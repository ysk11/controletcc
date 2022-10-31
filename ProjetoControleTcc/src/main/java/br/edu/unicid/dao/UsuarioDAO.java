package br.edu.unicid.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.unicid.bean.Usuario;
import br.edu.unicid.util.ConnectionFactory;

public class UsuarioDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs; 
	private Usuario usuario;

	public UsuarioDAO() throws Exception {
		// Chama a classe ConnectionFactory e estabele uma conexão
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}

	public void inserirUsuario(Usuario usuario) throws Exception {
		if (usuario == null)
			throw new Exception("O valor passado não pode ser nulo");
		
		try {
			String SQL = "INSERT INTO tb_usuarios "
					+ "(usuario, senha, tipo_usuario, nome, sexo, email, data_nascimento, endereco, numero) "
					+ "values "
					+ "(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setString(1, usuario.getUsuario());
			ps.setString(2, usuario.getSenha());
			ps.setString(3, usuario.getTipoUsuario());
			ps.setString(4, usuario.getNome());
			ps.setString(5, usuario.getSexo());
			ps.setString(6, usuario.getEmail());
			ps.setDate(7, new java.sql.Date(usuario.getDataNascimento().getTime()));
			ps.setString(8, usuario.getEndereco());
			ps.setInt(9, usuario.getNumero());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao inserir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}
	
	public void atualizarSenhaUsuario(Usuario usuario) throws Exception {
		if (usuario == null)
			throw new Exception("O valor passado não pode ser nulo");
		
		try {
			String SQL = "UPDATE tb_usuarios SET "
					+ "senha = ? "
					+ "WHERE usuario = ?";
			
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setString(1, usuario.getSenha());
			ps.setString(2, usuario.getUsuario());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao atualizar dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	public void excluirUsuario(Usuario usuario) throws Exception {
		if (usuario == null)
			throw new Exception("O valor passado não pode ser nulo");
		
		try {
			String SQL = "DELETE FROM tb_usuarios WHERE id = ?";
			
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, usuario.getId());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao excluir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	public Usuario buscarUsuario(String usuarioLogin) throws Exception {
		try {
			String SQL = "SELECT * FROM tb_usuarios WHERE usuario = ?";
			
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setString(1, usuarioLogin);			
			rs = ps.executeQuery();
			if (rs.next()) {
				int id = rs.getInt(1);
				String login = rs.getString(2);
				String senha = rs.getString(3);
				String tipoUsuario = rs.getString(4);
				String nome = rs.getString(5);
				String sexo = rs.getString(6);
				String email = rs.getString(7);
				Date nascimento = rs.getDate(8);
				String endereco = rs.getString(9);
				int numero = rs.getInt(10);
				usuario = new Usuario(id, login, senha, tipoUsuario, nome, sexo, email, nascimento, endereco, numero);
			}
			
			return usuario;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	public List buscarTodosUsuarios() throws Exception {
		try {
			String SQL = "SELECT * FROM usuarios";
			
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			List<Usuario> list = new ArrayList<Usuario>();
			while (rs.next()) {
				int id = rs.getInt(1);
				String login = rs.getString(2);
				String senha = rs.getString(3);
				String tipoUsuario = rs.getString(4);
				String nome = rs.getString(5);
				String sexo = rs.getString(6);
				String email = rs.getString(7);
				Date nascimento = rs.getDate(8);
				String endereco = rs.getString(9);
				int numero = rs.getInt(10);
				list.add(new Usuario(id, login, senha, tipoUsuario, nome, sexo, email, nascimento, endereco, numero));
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
}
