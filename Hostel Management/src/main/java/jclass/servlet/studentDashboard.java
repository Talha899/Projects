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
import javax.servlet.http.HttpSession;

import jclass.model.user;
import jclass.servlet.*;


@WebServlet("/studentDashboard")
public class studentDashboard extends HttpServlet {
  private static Connection connection = null;

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
	  String senderIDParam = request.getParameter("senderID");
      System.out.println("Servlet executed 5............................");

      response.setContentType("text/html;charset=UTF-8");
      HttpSession session = request.getSession();

      String query = null;

      try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel1", "root", "talha123@");

          query = "SELECT * FROM User WHERE userID = ?";

          List<user> users1 = new ArrayList<>();
          
          
       // Assuming the session attribute "userID" contains a String
          int uid = Integer.parseInt((String) session.getAttribute("userID"));

          try (PreparedStatement pst = connection.prepareStatement(query)) {
              pst.setInt(1,uid);

              try (ResultSet rs = pst.executeQuery()) 
              {
                  while (rs.next()) {
                      user user1 = new user();
                      user1.setUserID(rs.getInt("userID"));
                      user1.setUsername(rs.getString("username"));
                      user1.setPassword(rs.getString("password"));
                      user1.setEmail(rs.getString("email"));
                      user1.setName(rs.getString("name"));
                      user1.setCNIC(rs.getString("CNIC"));
                      user1.setCNICImage(rs.getString("CNICImage"));
                      user1.setAge(rs.getInt("age"));
                      user1.setContact(rs.getString("contact"));
                      user1.setType(rs.getString("type"));
                      user1.setGender(rs.getString("gender"));
                      user1.setAddress(rs.getString("Address"));

                      users1.add(user1);
                  }
              }
          }

          request.setAttribute("users1", users1);

          // Forward the request to the JSP page
          RequestDispatcher dispatcher = request.getRequestDispatcher("/studentDashboard.jsp");
          dispatcher.forward(request, response);

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
