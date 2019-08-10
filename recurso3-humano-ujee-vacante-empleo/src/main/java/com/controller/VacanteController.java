package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DbConnection;
import com.dao.VacanteDao;
import com.model.Vacante;

/**
 * Servlet implementation class VacanteController
 */
public class VacanteController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
     * 1. Metodo que sirve para guardar una vacante.
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */         
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//Recibir paramametros
		
		String nombreParam = request.getParameter("nombre");
		String descripcionParam = request.getParameter("descripcion");
		String detalleParam = request.getParameter("detalle");
		
		//Del bean de tipo vacante para representar un registro(datos) de la tabla vacante
		Vacante vacante = new Vacante(0);
		
		vacante.setNombre(nombreParam);
		vacante.setDescripcion(descripcionParam);
		vacante.setDetalle(detalleParam);
		
		//Por el metodo subString se van a mostrar los datos del beans
		System.out.println(vacante);

		//Ahora insertamos en la base de datos
		
		// Procesamos los datos. Guardar en BD
        DbConnection conn = new DbConnection();
        
        VacanteDao vacanteDao = new VacanteDao(conn);
        boolean status = vacanteDao.insert(vacante);
        
        // Preparamos un mensaje para el usuario
        String msg = "";
        if (status) {
            msg = "La vacante fue guardada correctamente.";
        } else {
            msg = "Ocurrio un error. La vacante no fue guardada.";
        }
        conn.disconnect(); //uso del metodo para cerrar la conexion.       
        RequestDispatcher rd;
        // Compartimos la variable msg, para poder accederla desde la vista con Expression Language
        request.setAttribute("message", msg);
        // Enviarmos respuesta. Renderizamos la vista mensaje.jsp
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
		
	}

}
