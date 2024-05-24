/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.*;
import business.*;
import static data.DBUtil.getEmFactory;
import java.util.*;

/**
 *
 * @author acer
 */
@WebServlet(name = "productAdminServlet", urlPatterns = {"/productController"})
public class productAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = null;
        BookDAO bookDao = new BookDAO();
        List<Book> books = bookDao.getAll();
        if (!books.isEmpty()) {
            request.setAttribute("books", books);
            request.getRequestDispatcher("/view/admin_page.jsp").forward(request, response);

        } else {
            getServletContext()
                    .getRequestDispatcher("/index.jsp")
                    .forward(request, response);
        }
    }

}
