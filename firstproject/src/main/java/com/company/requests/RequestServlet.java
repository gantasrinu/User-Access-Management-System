package com.company.requests;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	 private static final String DB_URL = "jdbc:mysql://localhost:3306/user_access_management"; 
	    private static final String DB_USER = "root"; 
	    private static final String DB_PASSWORD = "password"; 

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String software = request.getParameter("software");
	        String accessType = request.getParameter("accessType");
	        String reason = request.getParameter("reason");
	        String username = (String) request.getSession().getAttribute("username");

	        Connection conn = null;
	        PreparedStatement ps = null;

	        try {
	           
	            Class.forName("com.mysql.cj.jdbc.Driver");

	          
	            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	            String sql = "INSERT INTO access_requests (username, software, access_type, reason, status) VALUES (?, ?, ?, ?, ?)";
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, username);
	            ps.setString(2, software);
	            ps.setString(3, accessType);
	            ps.setString(4, reason);
	            ps.setString(5, "Pending");

	            int rowsInserted = ps.executeUpdate();

	            if (rowsInserted > 0) {
	             
	                response.sendRedirect("requestAccessSuccess.jsp");
	            } else {
	                throw new Exception("No rows inserted.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();

	           
	            response.setContentType("text/html");
	            PrintWriter out = response.getWriter();
	            response.sendRedirect("requestAccessSuccess.jsp");
	            out.println("<h3 style='color:red;'>An error occurred while processing the request.</h3>");
	        } finally {
	            try {
	                if (ps != null) ps.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}