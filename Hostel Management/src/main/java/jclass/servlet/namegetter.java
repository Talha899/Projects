package jclass.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jclass.model.ChatMessage;

/**
 * Servlet implementation class namegetter
 */
@WebServlet("/namegetter")
public class namegetter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static Connection connection = null;

	 // ... (unchanged code)

     protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");

	        
	        
	        String senderIDParam = request.getParameter("senderID");
	        String receiverIDParam = request.getParameter("receiverID");
	      

	        if (senderIDParam != null && receiverIDParam != null  && !senderIDParam.isEmpty() && !receiverIDParam.isEmpty() )
	        {
	        int senderID = Integer.parseInt(senderIDParam);
	        int receiverID = Integer.parseInt(receiverIDParam);
	        
	        String sendername=null;
	        String receivername=null;
	        
	            senderID = Integer.parseInt(senderIDParam);
	           receiverID = Integer.parseInt(receiverIDParam);

	            String query = "SELECT username, userID FROM User WHERE userID = ? OR userID = ?";

	            try {
	                Class.forName("com.mysql.cj.jdbc.Driver");
	                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");

	                try (PreparedStatement pst = connection.prepareStatement(query)) {
	                    pst.setInt(1, senderID);
	                    pst.setInt(2, receiverID);
	                   

	                    try (ResultSet rs = pst.executeQuery()) {
	                        while (rs.next()) {

	                        	if(rs.getInt("userID")==senderID)
	                        	{
	                        		sendername= rs.getString("username");
		            	          

	                        	}
	                        	else if(rs.getInt("userID")==receiverID)
	                        	{
	                        		receivername= rs.getString("username");
	                        	}
	                           
	                          
	                        }
	                    }

	                    
	                    
	                    
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            } catch (ClassNotFoundException | SQLException e) {
	                e.printStackTrace();
	            } finally {
	                try {
	                    if (connection != null) {
	                        connection.close();
	                    }
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	          
	          
	            // Redirect back to the chat page after sending a message
	            response.sendRedirect("chat?senderID=" + senderID + "&receiverID=" + receiverID + "&sendername=" + sendername+ "&receivername=" + receivername);
	        }
	    
	        }
	

}
