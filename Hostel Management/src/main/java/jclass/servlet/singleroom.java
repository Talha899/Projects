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
 * Servlet implementation class singleroom
 */
@WebServlet("/view-room")
public class singleroom extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static Connection connection = null;

    public singleroom() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int id = Integer.parseInt(request.getParameter("roomId"));
        System.out.println("the id is " + id);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");

            try (PreparedStatement pst = connection.prepareStatement("SELECT * FROM room WHERE room_id = ?")) {
                pst.setInt(1, id);

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
                            room1.setFeatures(rs.getString("Feature"));
                            room1.setStatus(rs.getString("status"));
                            room1.setcatagory(rs.getInt("catagory"));
                            room1.setManagerID(rs.getInt("managerID"));
                            System.out.println("the id is " + rs.getInt("managerID"));

                            rooms.add(room1);
                        }
                        request.setAttribute("rooms", rooms);

                        // Forward the request to the JSP page
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/singleroom.jsp");
                        dispatcher.forward(request, response);
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
