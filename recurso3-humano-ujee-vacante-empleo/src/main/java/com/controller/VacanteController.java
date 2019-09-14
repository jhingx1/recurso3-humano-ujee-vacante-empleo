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
 * Servlet implementation class VacanteController
 */
public class VacanteController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recibimos el parametro de accion, para ver que solicito el cliente.
        String action = request.getParameter("action");
        if ("ver".equals(action)) {
            this.verDetalle(request, response);
        } else if ("lista".equals(action)) {
            this.verTodas(request, response);
        } else if ("enviarCV".equals(action)) {
            this.mostrarFormularioCV(request, response);
        }
    }
	
	
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
	
	/**
     * 2. Metodo para ver los detalles completos de una Vacante.
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void verDetalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
        
        // Recibimos id de la vacante a consultar
        int idVacante = Integer.parseInt(request.getParameter("id"));                
        DbConnection conn = new DbConnection(); //conexion
        VacanteDao vacanteDao = new VacanteDao(conn);
        Vacante vacante = vacanteDao.getById(idVacante);
        conn.disconnect();        
        
        // Compartimos la variable msg, para poder accederla desde la vista con Expression Language
        request.setAttribute("vacante", vacante);
        RequestDispatcher rd;
        
        // Enviarmos respuesta. Renderizamos la vista detalle.jsp
        rd = request.getRequestDispatcher("/detalle.jsp");
        rd.forward(request, response);
    }
    
    /**
     * 3. Metodo para buscar todas las vacantes registradas.
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void verTodas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        List<Vacante> lista = vacanteDao.getAll();
        conn.disconnect();
        // Compartimos la variable lista, para poder accederla desde la vista
        request.setAttribute("vacantes", lista);
        RequestDispatcher rd;
        rd = request.getRequestDispatcher("/vacantes.jsp");
        rd.forward(request, response);
    }
    
    protected void mostrarFormularioCV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
        //para encontrar el id de la vacante
    	int idVacante = Integer.parseInt(request.getParameter("id"));      
        Vacante vacante = null;
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        vacante = vacanteDao.getById(idVacante);
        conn.disconnect();      
        //Para ponerlo en la vista
        request.setAttribute("vacante", vacante);
        RequestDispatcher rd;
        //enviando a la vista
        rd = request.getRequestDispatcher("/frm_cv.jsp");
        rd.forward(request, response);
    }

}
