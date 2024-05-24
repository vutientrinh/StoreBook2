//package admin.controller;
//
//import java.io.IOException;
//import java.util.Properties;
//import jakarta.mail.Message;
//import jakarta.mail.*;
//import jakarta.mail.MessagingException;
//import jakarta.mail.Session;
//import jakarta.mail.Transport;
//import jakarta.mail.internet.InternetAddress;
//import jakarta.mail.internet.MimeMessage;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.BufferedReader;
//import java.io.FileReader;
//import DAO.*;
//import business.*;
//
///**
// *
// * @author GMT
// */
//@WebServlet(name = "SendMailServlet", urlPatterns = {"/sendMail"})
//public class SendMail extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String userEmail = request.getParameter("cusEmail");
//        String billID = request.getParameter("billID");
//        System.out.println("billId nay : "+billID);
//        String to = userEmail;
//        String from = "vutientrinh.0357@gmail.com";
//        String host = "smtp.gmail.com";
//        String password = "vhic eqtb cvgu xebf";
//        String subject = "Thank You for Your Purchase";
//        //Mail body
//        String htmlFilePath = getServletContext().getRealPath("/view/thank.html");
//        String body = readHtmlFile(htmlFilePath);
////       
//        try {
//            // Send email
//            sendMail(to, from, host, password, subject, body, true);
////            Bill bill = BillDAO.findBillbyBillID(Long.parseLong(billID));
////            bill.setStatus(0);
////            BillDAO.updateBill(bill, CustomerDAO.findByEmail(userEmail).getCustomer_id());
//            // Forward to thanks.jsp or any other page
//            request.getRequestDispatcher("/adminhome").forward(request, response);
//
//        } catch (MessagingException e) {
//            e.printStackTrace(); // Handle the exception appropriately (log it, show an error page, etc.)
//            // Optionally redirect to an error page
//            request.getRequestDispatcher("/adminhome").forward(request, response);
//        }
//    }
//
//    // Method to send email
//    private void sendMail(String to, String from, String host, String password, String subject, String body, boolean bodyIsHTML)
//            throws MessagingException {
//        // 1 - get a mail session
//        Properties properties = System.getProperties();
//        properties.put("mail.smtp.host", host);
//        properties.put("mail.smtp.port", "465");
//        properties.put("mail.smtp.ssl.enable", "true");
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtps.quitwait", "false");
//
//        Session session = Session.getInstance(properties, new Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(from, password);
//            }
//        });
//
//        // 2 - create a message
//        Message message = new MimeMessage(session);
//        message.setSubject(subject);
//        if (bodyIsHTML) {
//            message.setContent(body, "text/html");
//        } else {
//            message.setText(body);
//        }
//
//        // 3 - address the message
//        Address toAddress = new InternetAddress(to);
//        message.setRecipient(Message.RecipientType.TO, toAddress);
//
//        // 4 - send the message
//        Transport.send(message);
//    }
//
//    private String readHtmlFile(String filePath) throws IOException {
//        StringBuilder content = new StringBuilder();
//        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
//            String line;
//            while ((line = reader.readLine()) != null) {
//                content.append(line).append("\n");
//            }
//        }
//        return content.toString();
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.getRequestDispatcher("/view/thanks.jsp").forward(request, response);
//
//    }
//
//}
