package jclass.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jclass.connection.DBCon;
import jclass.model.Hostel;
import jclass.model.Payments;
import jclass.model.room;

/**
 * Servlet implementation class viewHostel
 */
@WebServlet("/viewHostel")
public class viewHostel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Connection con = null;
    	String hostelID = request.getParameter("hostelID");
    	int id = Integer.parseInt(hostelID);
		try {
			System.out.println("Hello 2");
			con = DBCon.getConnetion();
			String stmt = "select * from hostel where hostelID=?";
			PreparedStatement pstmt = con.prepareStatement(stmt);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("Hello 3");
			Hostel hostel = new Hostel();
			if(rs.next()) {
				hostel.setHostelID(rs.getInt("hostelID"));
				hostel.setHostelName(rs.getString("hostelName"));
				hostel.setLocation(rs.getString("location"));
				hostel.setDistance(rs.getInt("distance"));
				hostel.setImagelink(rs.getString("imagelink"));
				hostel.setManagerID(rs.getInt("managerID"));
			}
			System.out.println("Hello 4");
			// Close the resources
			
			stmt = "select * from room join hostel on room.hostelID = hostel.hostelID where room.hostelID=?";
			pstmt = con.prepareStatement(stmt);
			pstmt.setInt(1,id);
			rs = pstmt.executeQuery();
			System.out.println("Hello 3");
			List<room> rooms = new ArrayList<room>();
			while(rs.next()) {
				room room = new room();
				room.setRoomId(rs.getInt("room_id"));
				room.setTotalOccupants(rs.getInt("total_occupants"));
				room.setNoOfOccupants(rs.getInt("no_of_occupants"));
				rooms.add(room);
			}
			System.out.println("Hello 4");
			// Close the resources
			
			request.setAttribute("rooms", rooms);
		
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
        dispatcher.forward(request, response);
        return;
	} 		
		RequestDispatcher dispatcher = request.getRequestDispatcher("viewHostel.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
