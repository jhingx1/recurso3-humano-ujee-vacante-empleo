package com.test;

import com.dao.DbConnection;
import com.dao.UsuarioDao;
import com.model.Usuario;

public class TestConnection {

	public static void main(String[] args) {
		
		DbConnection conn = new DbConnection();
		UsuarioDao dao = new UsuarioDao(conn);
		Usuario usuario = dao.login("jhuaringa", "1234");
		System.out.println(usuario);

	}

}
