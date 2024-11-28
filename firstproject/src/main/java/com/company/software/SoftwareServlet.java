package com.company.software;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/SoftwareServlet")
public class SoftwareServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/user_access_management";
    private static final String DB_USER = "root"; // Your MySQL username
    private static final String DB_PASSWORD = "password"; // Your MySQL password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String accessLevel = request.getParameter("access_level");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)")) {

            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, accessLevel);
            ps.executeUpdate();

            response.getWriter().println("<h3>Software created successfully!</h3>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error creating software.</h3>");
        }
    }
}
