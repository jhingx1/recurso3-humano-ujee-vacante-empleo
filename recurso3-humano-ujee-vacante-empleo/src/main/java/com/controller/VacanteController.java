package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Vacante;

/**
 * Servlet implementation class VacanteController
 */
public class VacanteController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
          
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

		
		
	}

}
