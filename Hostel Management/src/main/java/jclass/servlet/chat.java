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

import jclass.model.ChatMessage;

/**
 * Servlet implementation class chat
 */


 // ... (unchanged code)

    @WebServlet("/chat")
    public class chat extends HttpServlet {
        private static final long serialVersionUID = 1L;

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");

            String senderIDParam = request.getParameter("senderID");
            String receiverIDParam = request.getParameter("receiverID");
            
	        String sendername= request.getParameter("sendername");
	        String receivername= request.getParameter("receivername");
	        
	        System.out.println(sendername+  "   ...............?................."+receivername);
	        
            if (senderIDParam != null && receiverIDParam != null && !senderIDParam.isEmpty() && !receiverIDParam.isEmpty()) {
                int senderID = Integer.parseInt(senderIDParam);
                int receiverID = Integer.parseInt(receiverIDParam);

                String query = "SELECT * FROM Chat WHERE (senderID = ? AND receiverID = ?) OR (senderID = ? AND receiverID = ?) ORDER BY timestamp ASC";

                try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");
                     PreparedStatement pst = connection.prepareStatement(query)) {

                    pst.setInt(1, senderID);
                    pst.setInt(2, receiverID);
                    pst.setInt(3, receiverID);
                    pst.setInt(4, senderID);

                    List<ChatMessage> chatMessages = new ArrayList<>();

                    try (ResultSet rs = pst.executeQuery()) {
                        while (rs.next()) {
                            ChatMessage message = new ChatMessage();
                            message.setChatID(rs.getInt("chatID"));
                            message.setSenderID(rs.getInt("senderID"));
                            message.setReceiverID(rs.getInt("receiverID"));
                            message.setMessage(rs.getString("message"));
                            message.setTimestamp(rs.getTimestamp("timestamp"));
                            message.setMyID(message.getSenderID() == senderID ? 1 : 0);
                            chatMessages.add(message);
                        }
                    }

                    request.setAttribute("chatMessages", chatMessages);
                    request.setAttribute("senderID", senderID);
                    request.setAttribute("receiverID", receiverID);
                    request.setAttribute("sendername", sendername);
                    request.setAttribute("receivername", receivername);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("/chatpage.jsp");
                    dispatcher.forward(request, response);

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                System.out.println("SenderID or ReceiverID is missing or empty");
            }
        }
    }
