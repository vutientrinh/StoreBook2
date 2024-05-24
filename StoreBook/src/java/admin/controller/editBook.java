/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import DAO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import business.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "editBook", urlPatterns = {"/editBook"})
public class editBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String book_id = request.getParameter("bid");
        System.out.println(book_id);
        BookDAO book = new BookDAO();
        Book getbook = book.getBookByID(Long.parseLong(book_id));

        // Get the list of categories
        List<Category> categories = getbook.getListCategory();

        // Create a new list to hold the category names
        List<String> categoryNames = new ArrayList<>();

        if (getbook != null) {         
            for (Category category : categories) {
                categoryNames.add(category.getCategory_name());
            }
            String tags = String.join(", ", categoryNames);
            request.setAttribute("tags", tags);
            request.setAttribute("book", getbook);
            request.getRequestDispatcher("/view/edit_page.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/adminhome").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String book_id = request.getParameter("bid");
        BookDAO book = new BookDAO();
        Book getbook = book.getBookByID(Long.parseLong(book_id));
        if (getbook != null) {
            request.setAttribute("book", getbook);
            request.getRequestDispatcher("/view/edit_page.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/adminhome").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
 
}
