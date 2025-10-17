package com.dao;

import java.sql.Connection;

import com.entity.Appointment;

public class AppointmentDao {
	
	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addAppointment(Appointment ap)
	{
		boolean f=false;
		
		try {
			
			String sql="insert ";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
