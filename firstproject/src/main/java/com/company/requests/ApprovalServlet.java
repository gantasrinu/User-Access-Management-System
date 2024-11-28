package com.company.requests;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/user_access_management";
    private static final String DB_USER = "root"; 
    private static final String DB_PASSWORD = "password"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestId = request.getParameter("request_id");
        String action = request.getParameter("action");

        String status = action.equals("approve") ? "Approved" : "Rejected";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement("UPDATE requests SET status = ? WHERE id = ?")) {

            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(requestId));
            ps.executeUpdate();

            response.getWriter().println("<h3>Request " + status + " successfully!</h3>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error processing request.</h3>");
        }
    }
}
