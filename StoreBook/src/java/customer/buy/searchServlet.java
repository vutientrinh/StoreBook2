/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer.buy;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.*;
import business.*;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
@WebServlet(name = "searchServlet", urlPatterns = {"/search"})
public class searchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nameSearch = request.getParameter("searchValue");
        String cid = request.getParameter("cid");
        System.out.println(cid);
        BookDAO bookdao = new BookDAO();
        if (cid == null) {

            CategoryDAO categoryDAO = new CategoryDAO();

            List<Book> bookList = bookdao.searchByName(nameSearch);
            if (bookList != null) {
                System.out.println("list cac cuon sach" + bookList);
            }
//        List<Category> categories = categoryDAO.getAll();

            request.setAttribute("listProduct", bookList);
//        request.setAttribute("listCategory", categories);
            request.setAttribute("txtSearch", nameSearch);
        } else {
            List<Book> bookList = bookdao.getProductByCategoryID(Long.parseLong(cid));
            if(bookList==null)System.out.println("khong cos du lieu ");
            request.setAttribute("listProduct", bookList);
        }

        request.getRequestDispatcher("/view/list_category.jsp").forward(request, response);

    }

}
