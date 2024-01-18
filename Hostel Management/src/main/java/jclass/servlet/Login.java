package jclass.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail=request.getParameter("email");
		String pass=request.getParameter("password");
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		
		if(uemail==null || uemail.equals(""))
		{
			request.setAttribute("status","invalidEmail");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		if(pass==null || pass.equals(""))
		{
			request.setAttribute("status","invalidPassword");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");
			PreparedStatement pst=con.prepareStatement("select * from User where password=? and  email=? ");
			pst.setString(1, pass);
			pst.setString(2, uemail);
		
			
			
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				session.setAttribute("userID",rs.getString("userID"));
				session.setAttribute("type",rs.getString("type"));
				
				 System.out.println(session.getAttribute("type")+"..........");
				 if("manager".equals(session.getAttribute("type")))
				 {
				     response.sendRedirect("managerDashboard.jsp");
				 }
				 else if("parent".equals(session.getAttribute("type")))
				 {
				     response.sendRedirect("studentDashboard");
				 }
				 else if("student".equals(session.getAttribute("type")))
				 {
				     response.sendRedirect("studentDashboard");
				 }
				 else if("admin".equals(session.getAttribute("type")))
				 {
				     response.sendRedirect("admin.jsp");
				 }
				 else {
				     response.sendRedirect("login.jsp");
				}

				
			}
			else
			{
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
