package jclass.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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
import javax.servlet.http.HttpSession;

import jclass.model.name_id;

/**
 *request.getParameter("senderID")
 */
@WebServlet("/dismessage")
public class dismessage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static Connection connection = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

		HttpSession session=request.getSession();

		String senderIDParam = (String) session.getAttribute("userID");

        List<name_id> listOfIds = new ArrayList<>();
        List<name_id> listOfIds1 = new ArrayList<>();
        if (senderIDParam != null && !senderIDParam.isEmpty()) {
            try {
            	int senderID = Integer.parseInt(senderIDParam);
            	  System.out.println("Servlet executed"+senderID+" .............");
                String query = "SELECT DISTINCT receiverID FROM Chat WHERE senderID = ?";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");

                    try (PreparedStatement pst = connection.prepareStatement(query)) {
                    	pst.setInt(1, senderID);
                        try (ResultSet rs = pst.executeQuery()) {
                            while (rs.next()) {
                                name_id instance = new name_id();
                                instance.setId(rs.getInt("receiverID"));
                                listOfIds.add(instance);
                            }
                        }
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace(); // Consider logging or redirecting to an error page
                } finally {
                    try {
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace(); // Consider logging or redirecting to an error page
                    }
                }

                // Printing values outside the database interaction loop
                for (name_id instance1 : listOfIds) {
                	query = "SELECT username FROM User WHERE userID = ?";

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");
                       
                        try (PreparedStatement pst = connection.prepareStatement(query)) {
                        	int idx=instance1.getId();
                            pst.setInt(1, idx);
                            try (ResultSet rs = pst.executeQuery()) {
                                while (rs.next()) {
                                    name_id instance = new name_id();
                                    instance.setId(instance1.getId());
                                    System.out.println("ID: "+ idx);
                                    instance.setName(rs.getString("username"));
                                    listOfIds1.add(instance);
                                    
                                }
                            }
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace(); // Consider logging or redirecting to an error page
                    }
                	
                	
                }
            } catch (NumberFormatException e) {
                e.printStackTrace(); // Handle the case where senderIDParam is not a valid integer
            }
            for (name_id instance2 : listOfIds1) {
                System.out.println("ID: " + instance2.getId() + ", Name: " + instance2.getName());
            }
            
            request.setAttribute("listOfIds1", listOfIds1);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/messages.jsp");
            dispatcher.forward(request, response);

        } else {
            System.out.println("senderIDParam is null or empty");
        }
    }
}
