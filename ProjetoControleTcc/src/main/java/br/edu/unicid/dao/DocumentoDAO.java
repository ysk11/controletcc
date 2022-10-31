package br.edu.unicid.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileItem;

import com.mysql.cj.jdbc.Blob;

import br.edu.unicid.bean.Documento;
import br.edu.unicid.util.ConnectionFactory;

public class DocumentoDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs; 
	private Documento doc;
	
	public DocumentoDAO() throws Exception {
		// Chama a classe ConnectionFactory e estabele uma conexão
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}
	
	/**
     * @param item FileItem, representa um arquivo que é enviado pelo formulario
     * MultiPart/Form-data
     * @throws IOException
     * @throws ServletException
     */
	public void inserirDocumento(FileItem item) throws Exception {
        try {
            String SQL = "INSERT INTO tb_documentos (codigo, documento) VALUES(?, ?)";
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, 1); // codigo 1
            ps.setBinaryStream(2, item.getInputStream(), (int) item.getSize() );
            ps.executeUpdate();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
	}
	
	public Blob recuperaDocumento(int codigo) throws Exception {
		Blob blob = null;
		
		try {
			String SQL = "SELECT documento FROM tb_documentos WHERE codigo = ?";
			ps = (PreparedStatement) conn.createStatement();
			ps.setInt(1, codigo);
		    rs = ps.executeQuery(SQL);

		    if (rs.next()) {
		    	blob = (Blob) rs.getBlob("documento");
		    }
		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return blob;
	}
	
	public List buscarTodosDocumentos() throws Exception {
		try {
			String SQL = "SELECT * FROM tb_documentos";
			
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			List<Documento> list = new ArrayList<Documento>();
			while (rs.next()) {
				int id = rs.getInt(1);
				String nome = rs.getString(2);
				Date data = rs.getDate(3);
				list.add(new Documento(id, nome, data));
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
}
