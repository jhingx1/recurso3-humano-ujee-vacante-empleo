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

/**
 * Servlet implementation class SiteController
 */
public class SiteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
     * Controller que sirve para mostrar la página principal de la aplicacion. Se encarga de mandar al index.jsp
     * un objeto de tipo List con las 3 ultimas vacantes
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd;        //reenvio de la solicitud
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        List<Vacante> lista = vacanteDao.getUltimas();//metodo que nos debuelve las 3 ultimas vacanes.
        conn.disconnect();
        request.setAttribute("ultimas", lista);//para preservar la lista en la pagina jsp
        rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
        
	}	

}
