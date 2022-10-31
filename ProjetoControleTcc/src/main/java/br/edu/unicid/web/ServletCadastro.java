package br.edu.unicid.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import br.edu.unicid.bean.Usuario;
import br.edu.unicid.dao.DocumentoDAO;
import br.edu.unicid.dao.UsuarioDAO;

/**
 * Servlet implementation class ServletCadastro
 */
public class ServletCadastro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCadastro() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private Date strToDate(String data) throws Exception {
        if (data == null) {
            return null;
        }

        Date dataF = null;
        try {
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            long timestamp = dateFormat.parse(data).getTime();
            dataF = new Date(timestamp);
        } catch (ParseException pe) {
            throw pe;
        }
        
        return dataF;
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	
    	DocumentoDAO ddao;
    	UsuarioDAO dao;
    	Usuario usuario = new Usuario();
    	String mensagem = "";

    	String cmd = request.getParameter("cmd");
    	if (cmd != null) {
    		try {
    			usuario.setUsuario(request.getParameter("usuario"));
    			usuario.setTipoUsuario(request.getParameter("tipo"));
    			usuario.setSenha(request.getParameter("senha"));
    			usuario.setNome(request.getParameter("nome"));
    			usuario.setSexo(request.getParameter("sexo"));
    			usuario.setEmail(request.getParameter("email"));
    			usuario.setDataNascimento(strToDate(request.getParameter("data")));
    			usuario.setEndereco(request.getParameter("endereco"));
    			usuario.setNumero(Integer.parseInt(request.getParameter("numero")));
    	    } catch (Exception ex) {
    	    	ex.printStackTrace();
    	    }
    	}
    	
    	try {
    		dao = new UsuarioDAO();
    		ddao = new DocumentoDAO();
    	    RequestDispatcher rd = null;
      
    	    // Cadastro de usuário/ orientador
    	    if (cmd.equalsIgnoreCase("incluir")) {
    	    	dao.inserirUsuario(usuario);
    	    	mensagem = "Usuário cadastrado com sucesso";
    	        rd = request.getRequestDispatcher("/cadastro.jsp");
    	    }
    	    // Alteração de senha
    	    else if (cmd.equalsIgnoreCase("atualizar")) {
    	    	dao.atualizarSenhaUsuario(usuario);
    	    	mensagem = "Senha atualizada com sucesso";
    	        HttpSession session = request.getSession(true);
    	        session.setAttribute("usuario", usuario);
    	        rd = request.getRequestDispatcher("/redefinir_senha.jsp");
    	    }
    	    // Validação de login
    	    else if (cmd.equalsIgnoreCase("login")) {
    	    	Usuario retornoUsuario = dao.buscarUsuario(usuario.getUsuario());
    	    	
    	    	if ((retornoUsuario.getUsuario() == usuario.getUsuario()) &&
    	    			retornoUsuario.getSenha() == usuario.getSenha()) {
    	    		HttpSession session = request.getSession(true);
        	        session.setAttribute("usuario", usuario);
        	        rd = request.getRequestDispatcher("/menu.jsp");
    	    	} else {
    	    		mensagem = "Usuário e/ou senha incorretos";
    	    		request.setAttribute("mensagem", mensagem);
    	    		rd = request.getRequestDispatcher("/login.jsp");
    	    	}
    	    }
    	    // Envio de documento
    	    else if (cmd.equalsIgnoreCase("enviarArquivo")) {
    	    	boolean isMultiPart = FileUpload.isMultipartContent((RequestContext) request);
    	    	FileItem item = null;
    	    	
                if (isMultiPart) {
                    FileItemFactory factory = (FileItemFactory) new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    
                    List items = upload.parseRequest((RequestContext) request);
                    Iterator iter = items.iterator();
                    while (iter.hasNext()) {
                        item = (FileItem) iter.next();
                        if (!item.isFormField()) {
                            if (item.getName().length() > 0) {
                                ddao.inserirDocumento(item);
                            }
                        }
                    }
                }
                
                // Pega o diretório / documento dentro do diretório atual de onde a aplicação está rodando
                String caminho = getServletContext().getRealPath("/docs") + "/";

                // Cria o diretório caso ele não exista
                File diretorio = new File(caminho);
                if (!diretorio.exists()) {
                    diretorio.mkdir();
                }

                // Mandar o arquivo para o diretório informado
                String nome = item.getName();
                String arq[] = nome.split("\\\\");
                for (int i = 0; i < arq.length; i++) {
                    nome = arq[i];
                }

                File file = new File(diretorio, nome);
                FileOutputStream output = new FileOutputStream(file);
                InputStream is = item.getInputStream();
                byte[] buffer = new byte[2048];
                int nLidos;
                while ((nLidos = is.read(buffer)) >= 0) {
                    output.write(buffer, 0, nLidos);
                }
                
                output.flush();
                output.close();
    	    }
    	    // Redireciona para o menu principal
    	    else if (cmd.equalsIgnoreCase("menu")) {
    	        rd = request.getRequestDispatcher("/menu.jsp");
    	    }
    	    
    	    // Executa a ação de direcionar para a página JSP
    	    rd.forward(request, response);
    	} catch (Exception e) {
    		e.printStackTrace();
    	    throw new ServletException(e);
    	}
    }
}
