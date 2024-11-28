package com.company.registration;


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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_access_management";
    private static final String DB_USER = "root"; 
    private static final String DB_PASSWORD = "password"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

           
            String sql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, 'Employee')";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            int rowsInserted = ps.executeUpdate();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            if (rowsInserted > 0) {
                out.println("<h3 style='color:green;'>Registration Completed Successfully!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Registration Failed. Please Try Again!</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
