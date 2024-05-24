/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer.store;

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
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author acer
 */
@WebServlet(name = "DetailServlet", urlPatterns = {"/detail"})
public class DetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String id = request.getParameter("bid");
        BookDAO bookDao = new BookDAO();
        PublisherDAO publisherDao = new PublisherDAO();
        AuthorDAO authorDao = new AuthorDAO();
        
        Author author = authorDao.getAuthorByBookID(Long.parseLong(id));
        
        Publisher publisher = publisherDao.getPublisherByBookID(Long.parseLong(id));
        Book book = bookDao.getBookByID(Long.parseLong(id));
        if (book != null) {
            request.setAttribute("detail", book);
            request.setAttribute("publisher",publisher);
            request.setAttribute("author",author);
            request.getRequestDispatcher("/view/bookdetail.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("HomeController").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String id = request.getParameter("bid");
        BookDAO bookDao = new BookDAO();
        Book book = bookDao.getBookByID(Long.parseLong(id));
        if (book != null) {
            request.setAttribute("detail", book);
            request.getRequestDispatcher("/view/bookdetail.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("HomeController").forward(request, response);
        }

    }

}
