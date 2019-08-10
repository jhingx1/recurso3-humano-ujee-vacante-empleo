package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import com.model.Vacante;

//metodos para registra los metodos para gestionar una vacantes

public class VacanteDao {
	
	DbConnection conn;
	
	//Pasar parametro de conexcion.
	public VacanteDao(DbConnection conn){
		this.conn = conn;
	}
	
	 /**
     * 1. Metodo para insertar un registro en la tabla Vacante
     *
     * @param vacante
     * @return Regresa el id generado por la base de datos
     * @throws Exception
     */
	public boolean insert(Vacante vacante){
		
		String sql = "insert into Vacante values(?,?,?,?,?) ";
		
		//para fecha de publicacion
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			PreparedStatement ps = conn.getConnection().prepareStatement(sql);
			
			ps.setInt(1, vacante.getId());
			ps.setString(2,format.format(vacante.getFechaPublicacion()));
			ps.setString(3, vacante.getNombre());
			ps.setString(4, vacante.getDescripcion());
			ps.setString(5, vacante.getDetalle());
			
			ps.executeUpdate();//insert-update-delete
			
			return true;
			
		} catch (SQLException e) {			
			e.printStackTrace();
			return false;
		}
		
		
	}
	
	/**
     * 2. Metodo que regresa una lista con las 3 ultimas vacantes que seran
     * mostradas en la pagina principal
     *
     * @return
     * @throws Exception
     */
    public List<Vacante> getUltimas() {

        try {
            String sql = "select * from Vacante order by id desc limit 3";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            List<Vacante> list = new LinkedList<Vacante>();
            Vacante vacante;//Objeto vacio
            while (rs.next()) {
            	//Creamos un objeto por cada iteracion que se almacenara en la lista
                vacante = new Vacante(rs.getInt("id"));
                vacante.setFechaPublicacion(rs.getDate("fechaPublicacion"));
                vacante.setNombre(rs.getString("nombre"));
                vacante.setDescripcion(rs.getString("descripcion"));
                vacante.setDetalle(rs.getString("detalle"));
                // Add vacante object to the list
                list.add(vacante);
            }
            return list;

        } catch (SQLException e) {            
            System.out.println("Error VacanteDao.getUltimas: " + e.getMessage());
            return null;
        }
    }
	
	
	

}
