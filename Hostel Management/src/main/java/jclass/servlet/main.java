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
import jclass.model.user;

@WebServlet("/")
public class main extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		try {
			System.out.println("Hello 2");
			con = DBCon.getConnetion();
			String stmt = "select * from payments";
			PreparedStatement pstmt = con.prepareStatement(stmt);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("Hello 3");
			List<Payments> payments = new ArrayList<>();
			
			while(rs.next()) {
				Payments payment = new Payments();
				payment.setPaymentID(rs.getInt("paymentID"));
				payment.setAmount(Double.parseDouble(rs.getString("amount")));
				payment.setPaymentType(rs.getString("paymentType"));
				payment.setStatus(rs.getString("status"));
				payment.setPayeeID(rs.getInt("payeeID"));
				payment.setManagerID(rs.getInt("managerID"));
				
				
				
				payments.add(payment);
				
				System.out.println("Payment ID: " + payment.getPaymentID());
	            System.out.println("Amount: " + payment.getAmount());
	            System.out.println("Payment Type: " + payment.getPaymentType());
	            System.out.println("Status: " + payment.getStatus());
	            System.out.println("Payee ID: " + payment.getPayeeID());
	            System.out.println("Manager ID: " + payment.getManagerID());
	            System.out.println("-----------------------------------");
			}
			System.out.println("Hello 4");
			// Close the resources
            
            System.out.println("Hello 5");
			con = DBCon.getConnetion();
			stmt = "select * from hostel";
			pstmt = con.prepareStatement(stmt);
			rs = pstmt.executeQuery();
			System.out.println("Hello 6");
			List<Hostel> hostels = new ArrayList<>();
			
			while(rs.next()) {
				Hostel hostel = new Hostel();
				hostel.setHostelID(rs.getInt("hostelID"));
				hostel.setHostelName(rs.getString("hostelName"));
				hostel.setLocation(rs.getString("location"));
				hostel.setDistance(rs.getInt("distance"));
				hostel.setImagelink(rs.getString("imagelink"));
				hostel.setManagerID(rs.getInt("managerID"));
				
				
				
				hostels.add(hostel);
				
			}
			System.out.println("Hello 7");
			
			System.out.println("Hello 5");
			con = DBCon.getConnetion();
			stmt = "select * from user where type=\"Student\" or type=\"Parent\"";
			pstmt = con.prepareStatement(stmt);
			rs = pstmt.executeQuery();
			System.out.println("Hello 6");
			List<user> users = new ArrayList<>();
			
			while(rs.next()) {
				user user = new user();
				user.setUserID(rs.getInt("userID"));
				user.setName(rs.getString("name"));
				
				
				
				users.add(user);
				
			}
			System.out.println("Hello 7");
			// Close the resources

            // Set the payments list as an attribute in the request
            request.setAttribute("payments", payments);
            request.setAttribute("hostels", hostels);
            request.setAttribute("users", users);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
	        dispatcher.forward(request, response);
	        return;
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("managerDashboard.jsp");
        dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
