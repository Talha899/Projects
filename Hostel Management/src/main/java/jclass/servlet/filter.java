package jclass.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jclass.model.room;

/**
 * Servlet implementation class filter
 */
@WebServlet("/filter")
public class filter extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static Connection connection = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Servlet executed");

        response.setContentType("text/html;charset=UTF-8");
        System.out.println("Servlet executed");

        String tagParam = request.getParameter("filter-tag");
        int tag = 0; // Default initialization

        // Check if the parameter is not null and not empty
        if (tagParam != null && !tagParam.isEmpty()) {
            tag = Integer.parseInt(tagParam);
            System.out.println("the id is " + tag);
            // Rest of your code...
        } else {
            // Handle the case where the parameter is not provided
            System.out.println("Filter tag parameter is missing or empty");
            // You might want to redirect or display an error message
        }

        
        String searchQuery = request.getParameter("Searchq");
        
        if (searchQuery != null && !searchQuery.isEmpty()) {
            System.out.println("Search Query: " + searchQuery);
            tag=6;
        } else {
            System.out.println("Search query is missing or empty");
        
        }
        
        
        String query = null;

        if (tag == 1) {
            query = "SELECT * FROM room";
        } else if (tag == 2) {
            query = "SELECT * FROM room where catagory=1";
        } else if (tag == 3) {
            query = "SELECT * FROM room where catagory=0";
        }else if (tag == 4) {
            query = "SELECT * FROM room ORDER BY price DESC";
        }else if (tag == 5) {
            query = "SELECT * FROM room ORDER BY price ASC";
        }
        else if (tag == 6) {
        	query = "SELECT * FROM room WHERE room_name LIKE '%" + searchQuery + "%'";

        }
        
        else 
        {
        	query = "SELECT * FROM room";
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");

            try (PreparedStatement pst = connection.prepareStatement(query)) {

                List<room> rooms = new ArrayList<>();
                try (ResultSet rs = pst.executeQuery()) {
                    // Initialize the room object

                    while (rs.next()) {
                        room room1 = new room();
                        room1.setRoomId(rs.getInt("room_id"));
                        room1.setRoomName(rs.getString("room_name"));
                        room1.setImgLink(rs.getString("imglink"));
                        room1.setPrice(rs.getInt("price"));
                        room1.setArea(rs.getDouble("area"));
                        room1.setTotalOccupants(rs.getInt("total_occupants"));
                        room1.setNoOfOccupants(rs.getInt("no_of_occupants"));
                        room1.setDescription(rs.getString("description"));
                        room1.setStatus(rs.getString("status"));
                        room1.setcatagory(rs.getInt("catagory"));
                        room1.setManagerID(rs.getInt("managerID"));
                        System.out.println("the id is " + rs.getString("status"));

                        rooms.add(room1);
                    }
                    request.setAttribute("rooms", rooms);

                    // Forward the request to the JSP page
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/displayroom.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
