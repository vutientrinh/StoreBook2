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

/**
 *
 * @author acer
 */
@WebServlet(name = "deleteCart", urlPatterns = {"/deleteCart"})
public class deleteCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productDetailID = request.getParameter("bid");
        System.out.println(productDetailID + "Sai roif");
        if (productDetailID != null) {
            ProductDetailDAO productdetaildao = new ProductDetailDAO();
            productdetaildao.remove(Long.parseLong(productDetailID));
            request.getRequestDispatcher("showCart").forward(request, response);

        } else {

        }
        request.getRequestDispatcher("HomeController").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);

    }

}
