/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer.buy;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.*;
import business.*;
import java.util.*;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
@WebServlet(name = "showCart", urlPatterns = {"/showCart"})
public class showCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userAccount") != null) {
            CartDAO cartDao = new CartDAO();
            long total = 0;

            ProductDetailDAO productdetaildao = new ProductDetailDAO();
            Customer userAccount = (Customer) session.getAttribute("userAccount");
            List<ProductDetail> items = productdetaildao.GetAllByIDCart(userAccount.getCustomer_id());
            if (items.size() > 0) {
                total = productdetaildao.Total(items);
                if (total > 0) {
                    request.setAttribute("total", total);
                    request.setAttribute("product", items);
                    request.getRequestDispatcher("/view/cart.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("HomeController").forward(request, response);
                }
            } else {
                total = 0;
                request.setAttribute("total", total);
                request.getRequestDispatcher("/view/cart.jsp").forward(request, response);

            }
        } else {
            request.getRequestDispatcher("/login").forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
