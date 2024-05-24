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
 * /**
 *
 * @author acer
 */
@WebServlet(name = "showHistory", urlPatterns = {"/showHistory"})
public class showHistory extends HttpServlet {

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
            List<Bill> checkbill = new ArrayList<>();;
            List<Bill> billItems = BillDAO.GetAllBillofUser(userAccount.getCustomer_id());
            for (Bill bill : billItems) {
                if (bill.getStatus() == 1) {
                    checkbill.add(bill);
                }

            }
            request.setAttribute("bill", checkbill);
            request.getRequestDispatcher("/view/historyBill.jsp").forward(request, response);

        } else {
            String currentURL = request.getRequestURI();
            request.setAttribute("currentURL", currentURL);
            request.getRequestDispatcher("/login").forward(request, response);

        }

    }
}
