package com.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.model.Vacante;

//metodos para registra los metodos para gestionar una vacantes

public class VacanteDao {
	
	DbConnection conn;
	
	//Pasar parametro de conexcion.
	public VacanteDao(DbConnection conn){
		this.conn = conn;
	}
	
	//insertar registro de vacantes
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
	

}
