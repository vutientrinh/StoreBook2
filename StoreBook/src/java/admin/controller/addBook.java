/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import business.*;
import DAO.*;
import static jakarta.xml.bind.DatatypeConverter.parseLong;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "addBook", urlPatterns = {"/addBook"})
public class addBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getServletContext()
                .getRequestDispatcher("/view/edit_page.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PublisherDAO pubDAO = new PublisherDAO();
        AuthorDAO auDAO = new AuthorDAO();
        String url;
        String action = request.getParameter("action");
        String bid = request.getParameter("bid");
        System.out.println("bid: " + bid);

        System.out.println("ACION: " + action);
        if (action == null) {
            action = "add";
        }

        if (action.equals("add")) {
            System.out.println("ĐANG ADD!!!");

            // Get all parameters from the request
            String bookName = request.getParameter("name");
            String bookImg = request.getParameter("imageUrlInput");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String languages = request.getParameter("languages");
            String version = request.getParameter("version");
            String descriptions = request.getParameter("description");

            int status = Integer.parseInt(request.getParameter("status"));

            Publisher pub = PublisherDAO.getPublisherByName(request.getParameter("publisher"));
            Author auth = AuthorDAO.getAuthorByName(request.getParameter("author"));

            String categories = request.getParameter("tags");
            String[] categoryNames = categories.split(",");

            // Create a new Book object
            Book book = new Book();
            book.setBook_name(bookName);
            book.setBook_img(bookImg);
            book.setPrice(price);
            book.setQuantity(quantity);
            book.setLanguages(languages);
            book.setVersion(version);
            book.setDescriptions(descriptions);
            book.setBought(0);
            book.setStatus(status);

            Publisher UsedPub = new Publisher();
            Author UsedAut = new Author();
            int usedpub = 0;
            int usedaut = 0;

            Publisher existingPublisher = PublisherDAO.getPublisherByName(request.getParameter("publisher"));
            if (existingPublisher == null) {
                Publisher publisher = new Publisher();
                publisher.setPublisher_name(request.getParameter("publisher"));
                UsedPub = publisher;
                PublisherDAO.addPublisher(publisher);
                book.setPublisher(publisher);
                usedpub = 1;
            } else {
                book.setPublisher(pub);
                usedpub = 0;
            }

            Author existingAuthor = AuthorDAO.getAuthorByName(request.getParameter("author"));
            if (existingAuthor == null) {
                Author author = new Author();
                author.setAuthor_name(request.getParameter("author"));
                UsedAut = author;
                AuthorDAO.addAuthor(author);
                book.setAuthor(author);
                usedaut = 1;
            } else {
                book.setAuthor(auth);
                usedaut = 0;
            }

            for (String categoryName : categoryNames) {
                // Trim the category name to remove leading and trailing spaces
                categoryName = categoryName.trim();

                // Get the Category objects by their exact name
                List<Category> cate = CategoryDAO.getCategoryByExactName(categoryName);

                // If the category exists, add it to the book's listCategory
                if (cate != null && !cate.isEmpty()) {
                    for (Category category : cate) {
                        // Check if the book's listCategory already contains the category
                        if (!book.getListCategory().contains(category)) {
                            book.getListCategory().add(category);
                        }
                    }
                } else {
                    // If the category does not exist, create a new one and add it to the book's listCategory
                    Category newCategory = new Category();
                    newCategory.setCategory_name(categoryName);
                    CategoryDAO.addCategory(newCategory);
                    book.getListCategory().add(newCategory);
                }
            }
            try {
                if (bid == "") {
                    BookDAO.add(book);
                    System.out.println("Thêm Sách thành công");
                    request.setAttribute("message", "Thêm Sách thành công");
                    response.sendRedirect(request.getContextPath() + "/productController");
                } else {
                    System.out.println("Đang Sửa Sách");
                    BookDAO.deleteBookTags(Long.parseLong(bid));
                    Book BookNeedUp = BookDAO.getBookByID(Long.parseLong(bid));

                    BookNeedUp.setBook_name(bookName);
                    BookNeedUp.setBook_img(bookImg);
                    BookNeedUp.setPrice(price);
                    BookNeedUp.setQuantity(quantity);
                    BookNeedUp.setLanguages(languages);
                    BookNeedUp.setVersion(version);
                    BookNeedUp.setDescriptions(descriptions);

                    if (usedpub == 1) BookNeedUp.setPublisher(UsedPub);
                    else BookNeedUp.setPublisher(pub);
                    
                    if (usedaut == 1) BookNeedUp.setAuthor(UsedAut);
                    else BookNeedUp.setAuthor(auth);

                    BookNeedUp.setStatus(status);
                    BookNeedUp.setListCategory(book.getListCategory());
                    BookDAO.update(BookNeedUp, Long.parseLong(bid));

                    request.setAttribute("message", "Update thành công");
                    response.sendRedirect(request.getContextPath() + "/productController");
                }

            } catch (Exception e) {
                // TODO Auto-generated catch block
                System.out.println("Thêm Sách không thành công");
                e.printStackTrace();
            }
        }

    }
}
