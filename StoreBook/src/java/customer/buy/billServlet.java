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
import java.util.*;
import business.*;
import DAO.*;
import jakarta.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
@WebServlet(name = "billServlet", urlPatterns = {"/bill"})
public class billServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userAccount") != null) {
            ProductDetailDAO productdetaildao = new ProductDetailDAO();
            Customer userAccount = (Customer) session.getAttribute("userAccount");
            Bill newBill = new Bill();
            String totalprice = request.getParameter("total");
            List<ProductDetail> items = productdetaildao.GetAllByIDCart(userAccount.getCustomer_id());
            if (items.size() <= 0) {
                JOptionPane.showMessageDialog(null, "Don't have any value in Cart");
                request.getRequestDispatcher("showCart").forward(request, response);
            } else {
                Cart cart = CartDAO.getCartByUID(userAccount.getCustomer_id());
                BillDAO.save(newBill, userAccount, cart);
                request.setAttribute("newbill", newBill);
                request.setAttribute("total", totalprice);
                request.setAttribute("listproduct", items);
                request.setAttribute("user", userAccount);
                request.getRequestDispatcher("/view/bill.jsp").forward(request, response);

            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

}
