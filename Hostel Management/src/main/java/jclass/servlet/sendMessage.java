package jclass.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendMessage")
public class sendMessage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static Connection connection = null;

 // ... (unchanged code)

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        
        
        String senderIDParam = request.getParameter("senderID");
        String receiverIDParam = request.getParameter("receiverID");
        String message = request.getParameter("message");
        
        String sendername= request.getParameter("sendername");
        String receivername= request.getParameter("receivername");

        if (senderIDParam != null && receiverIDParam != null  && !senderIDParam.isEmpty() && !receiverIDParam.isEmpty() )
        {
        int senderID = Integer.parseInt(senderIDParam);
        int receiverID = Integer.parseInt(receiverIDParam);
        
        if (message != null && !message.isEmpty()) {
            senderID = Integer.parseInt(senderIDParam);
           receiverID = Integer.parseInt(receiverIDParam);

            String query = "INSERT INTO Chat (senderID, receiverID, message, timestamp) VALUES (?, ?, ?, ?)";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");

                try (PreparedStatement pst = connection.prepareStatement(query)) {
                    pst.setInt(1, senderID);
                    pst.setInt(2, receiverID);
                    pst.setString(3, message);
                    pst.setTimestamp(4, getCurrentTimestamp());

                    pst.executeUpdate();
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
        } else {
            response.sendRedirect("chat?senderID=" + senderID + "&receiverID=" + receiverID + "&sendername=" + sendername+ "&receivername=" + receivername);
        }
        }
        else {
            System.out.println("SenderID, ReceiverID, or Message is missing or empty");

		}
    }
    // ... (unchanged code)
    private Timestamp getCurrentTimestamp() {
        // Get the current time in milliseconds
        long currentTimeMillis = System.currentTimeMillis();

        // Create a new Timestamp object using the current time
        return new Timestamp(currentTimeMillis);
    }



}
