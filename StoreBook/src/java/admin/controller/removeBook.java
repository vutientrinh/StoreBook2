/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.*;

/**
 *
 * @author Admin
 */
@WebServlet(name = "removeBook", urlPatterns = {"/removeBook"})
public class removeBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long bookId = Long.parseLong(request.getParameter("bid"));
        System.out.println("book_id" + bookId);


        BookDAO.removeBook(bookId, 0);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Book status updated successfully");
        System.out.println("Book status updated successfully");
        getServletContext()
                .getRequestDispatcher("/productController")
                .forward(request, response);
    }

}
