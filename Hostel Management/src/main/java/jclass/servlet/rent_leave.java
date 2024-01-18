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

@WebServlet("/rent_leave")
public class rent_leave extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static Connection connection = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Servlet executed 2");
        response.setContentType("text/html;charset=UTF-8");

        String tagParam = request.getParameter("tag");
        String roomno1 = request.getParameter("roomid");
        String studentid1 = request.getParameter("senderID");

        int roomno = Integer.parseInt(roomno1);
        int studentid = Integer.parseInt(studentid1);

        int tag = 0; // Default initialization

        // Check if the parameter is not null and not empty
        if (tagParam != null && !tagParam.isEmpty()) {
            tag = Integer.parseInt(tagParam);
            System.out.println("Tag: " + tag);
        } else {
            // Handle the case where the parameter is not provided
            System.out.println("Filter tag parameter is missing or empty");
            // You might want to redirect or display an error message
        }

        String query = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");
            query = "SELECT bookingID FROM booking WHERE userID = ? AND room_id = ?";
            try (PreparedStatement pst = connection.prepareStatement(query)) {
                pst.setInt(1, studentid);
                pst.setInt(2, roomno);
                try (ResultSet rs = pst.executeQuery()) {
                    if (rs.next() && tag == 1) {
                        request.setAttribute("message", "Operation unsuccessful, room already booked");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/displaymessage.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        if (tag == 1) {
                            query = "INSERT INTO booking (userID, room_id) VALUES (?, ?)";
                        } else if (tag == 2) {
                            query = "DELETE FROM booking WHERE userID = ? AND room_id = ?";
                        }

                        try (PreparedStatement updatePst = connection.prepareStatement(query)) {
                            updatePst.setInt(1, studentid);
                            updatePst.setInt(2, roomno);
                            System.out.println("Generated Query: " + query);
                            int rowsAffected = updatePst.executeUpdate();

                            if (rowsAffected > 0) {
                                request.setAttribute("message", "Operation successful");
                            } else {
                                request.setAttribute("message", "Operation unsuccessful");
                            }

                            // Forward the request to the JSP page
                            RequestDispatcher dispatcher = request.getRequestDispatcher("/displaymessage.jsp");
                            dispatcher.forward(request, response);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
