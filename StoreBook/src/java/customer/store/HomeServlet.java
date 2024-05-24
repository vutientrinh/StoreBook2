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
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/index.jsp";
        BookDAO bookDao = new BookDAO();
        List<Book> lastbooks = bookDao.get4LastestProduct();
        List<Book> bestbooks = bookDao.get4Bestbook();
        List<Book> allBook = bookDao.getAllactive();

        Book newBook = bookDao.newBook();

        if (lastbooks.size() > 0 && bestbooks.size() > 0) {
            request.setAttribute("lastbooks", lastbooks);
            request.setAttribute("bestbooks", bestbooks);
            request.setAttribute("newBook", newBook);
            request.setAttribute("allBook",allBook);

            url = "/view/home.jsp";
        } else {
            url = "/index.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
