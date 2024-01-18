package jclass.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("name");
		String uemail=request.getParameter("email");
		String uage1=request.getParameter("age");
		String ucnic=request.getParameter("cnic");
		String ugender=request.getParameter("gender");
		String utype=request.getParameter("userType");
		String pass=request.getParameter("password");
		String copass=request.getParameter("confirmpassword");
		RequestDispatcher dispatcher=null;
		
		if(uname==null || uname.equals(""))
		{
			request.setAttribute("status","invalidName");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		
		if(uemail==null || uemail.equals(""))
		{
			request.setAttribute("status","invalidEmail");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		
		if(uage1==null || uage1.equals(""))
		{
			request.setAttribute("status","invalidAge");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		
		if(ucnic==null || ucnic.equals(""))
		{
			request.setAttribute("status","invalidCnic");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		else if(ucnic.length()>15)
		{
			request.setAttribute("status","invalidCnicLength");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		if(ugender==null || ugender.equals(""))
		{
			request.setAttribute("status","invalidGender");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		if(utype==null || utype.equals(""))
		{
			request.setAttribute("status","invalidType");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		if(pass==null || pass.equals(""))
		{
			request.setAttribute("status","invalidPassword");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		else if(!pass.equals(copass))
		{
			request.setAttribute("status","invalidCopass");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		else if(pass.length()<8)
		{
			request.setAttribute("status","invalidPassLength");
			dispatcher=request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		
		int uage=Integer.parseInt(uage1);

		Connection connection=null;
		String query = "INSERT INTO User(username, password, email, name, CNIC, age, type, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
	         Class.forName("com.mysql.cj.jdbc.Driver");
	         connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");

	         PreparedStatement pst = connection.prepareStatement(query);
			
	         pst.setString(1, uname);   // for 'username'
	         pst.setString(2, pass);    // for 'password'
	         pst.setString(3, uemail);  // for 'email'
	         pst.setString(4, uname);   // for 'name'
	         pst.setString(5, ucnic);   // for 'CNIC'
	         pst.setInt(6, uage);       // for 'age'
	         pst.setString(7, utype);   // for 'type'
	         pst.setString(8, ugender); // for 'gender'
			
			  System.out.println("Generated Query: " + query);
	           
			int rows=pst.executeUpdate();
			dispatcher=request.getRequestDispatcher("signup.jsp");
			if(rows>0)
			{
	          
				request.setAttribute("status", "success");
			}
			else
			{
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
