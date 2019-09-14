package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DbConnection;
import com.dao.VacanteDao;
import com.model.Vacante;


public class BusquedaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	/**
     * Metodo POST para hacer la busqueda de vacantes solicitada por el usuario.
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */  
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Recibimos la cadena de busqueda del usuario
        String q = request.getParameter("query");               
        List<Vacante> lista = null;
        DbConnection conn = new DbConnection();
        // Con nuestro objeto DAO, hacemos la busqueda de vacantes del usaurio
        //pasamos la conexion
        VacanteDao vacanteDao = new VacanteDao(conn);
        
        lista = vacanteDao.getByQuery(q);
        conn.disconnect();
        RequestDispatcher rd;
        request.setAttribute("vacantes", lista);
        //reenvio
        rd = request.getRequestDispatcher("/vacantes.jsp");
        rd.forward(request, response);
	}

}
