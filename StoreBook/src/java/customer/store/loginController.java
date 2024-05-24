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
import jakarta.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
@WebServlet(name = "loginController", urlPatterns = {"/login"})
public class loginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Loading: LoginController DoPost");
        String action = request.getParameter("action");
        String linkURL = request.getParameter("currentURL");
        if (action == null) {
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
        } else {
            if (action.equals("signin")) {
                CustomerDAO customerdao = new CustomerDAO();
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                if (email != null && password != null) {
                    Customer account = customerdao.testLogin(email, password);
                    System.out.println("test khach hang");
                    if (account != null) {

                        HttpSession session = request.getSession();
                        session.setAttribute("userAccount", account);

                        if (account.getRole() == 1) {
                            System.out.println("laydulieuadmin");

                            request.getRequestDispatcher("/adminhome").forward(request, response);

                        } else {
                            request.getRequestDispatcher("/HomeController").forward(request, response);

                        }

                    } else {
                        request.setAttribute("error", "Wrong email or password");
                        request.getRequestDispatcher("/view/register.jsp").forward(request, response);
                    }

                } else {
                    String errormessage = "Password hoặc email không được để trống";
                    request.setAttribute("errorMessage", errormessage);
                }
            } else if (action.equals("createAccount")) {

                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phonenumber");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String errorMessage = "";

                if (name == null || address == null || phone == null || email == null || password == null) {
                    errorMessage = "Nhập cho đúng";
                } else {
                    CustomerDAO userDAO = new CustomerDAO();
                    if (userDAO.findByEmail(email) != null) {
                        errorMessage = "Địa chỉ Email được đã đăng ký trước đó. Vui lòng nhập email mới";
                    }
                    if (userDAO.isExistPhone(phone)) {
                        if (errorMessage == "") {
                            errorMessage = "Số điện thoại được đã đăng ký trước đó. Vui lòng nhập email mới";
                        } else {
                            errorMessage = "Số điện thoại và địa chỉ Email được đã đăng ký trước đó. Vui lòng nhập email mới";
                        }
                    }
                    if (errorMessage == "") {
                        //Nếu email và phone number hợp lệ thì tiến hành đăng ký thành viên
                        Customer user = new Customer();
                        user.setCustomer_name(name);
                        user.setPhone_number(phone);
                        user.setAddress(address);
                        user.setCustomer_email(email);
                        user.setCustomer_password(password);
                        user.setRole(2);

                        request.setAttribute("user", user);

                        try {
                            CustomerDAO.addCustomer(user);
                            Cart cart = new Cart();
                            cart.setCustomer(user);
                            cart.setCart_id(user.getCustomer_id());
                            CartDAO.save(cart);
                            System.out.println(user.getCustomer_id());
                            System.out.println("Thêm User thành công");
                            request.setAttribute("message", "Đăng ký tài khoản thành công");
                            JOptionPane.showMessageDialog(null, "Đăng ký tài khoản thành công. Mời bạn đăng nhập !!!");

                        } catch (Exception e) {
                            // TODO Auto-generated catch block
                            errorMessage = "Không tạo được account";
                            System.out.println("Thêm User không thành công");
                            e.printStackTrace();
                        }
                    }
                }
                request.setAttribute("error", errorMessage);
                getServletContext()
                        .getRequestDispatcher("/view/register.jsp")
                        .forward(request, response);
            }
        }

    }
}
