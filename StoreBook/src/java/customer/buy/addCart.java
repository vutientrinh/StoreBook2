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
import static data.DBUtil.getEmFactory;
import jakarta.servlet.http.HttpSession;    
import java.util.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
@WebServlet(name = "addCart", urlPatterns = {"/addCart"})
public class addCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Retrieve the session if it exists

        if (session != null && session.getAttribute("userAccount") != null) {
            Customer userAccount = (Customer) session.getAttribute("userAccount");

            String quantity = request.getParameter("quantity");
            String book_id = request.getParameter("bid");
            Cart cart = CartDAO.getCartByUID(userAccount.getCustomer_id());
           
            ProductDetailDAO productdetail = new ProductDetailDAO();
            productdetail.addProductDetail(Long.parseLong(book_id), 
                    Integer.parseInt(quantity),cart);
            CartDAO.addCart(cart,userAccount.getCustomer_id());
            request.setAttribute("cart", cart);
            request.getRequestDispatcher("showCart").forward(request, response);

        } else {
            String currentURL = request.getRequestURI();
            request.setAttribute("currentURL",currentURL);
            request.getRequestDispatcher("/login").forward(request, response);

        }
    }

}
