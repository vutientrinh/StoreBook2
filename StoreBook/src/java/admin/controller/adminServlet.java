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
import com.google.gson.GsonBuilder;
import com.google.gson.Gson;
import static data.DBUtil.getEmFactory;
import java.text.DateFormatSymbols;
import java.util.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author Admin
 */
@WebServlet(name = "adminServlet", urlPatterns = {"/adminhome"})
public class adminServlet extends HttpServlet {

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
        List<Bill> bills = BillDAO.GetAll();
        if (!books.isEmpty() && !bills.isEmpty()) {
            System.out.println(books);
            request.setAttribute("books", books);
            request.setAttribute("bills", bills);
            request.getRequestDispatcher("/view/admin_dashboard.jsp").forward(request, response);

        } else {
            getServletContext()
                    .getRequestDispatcher("/index.jsp")
                    .forward(request, response);
        }
    }

}
