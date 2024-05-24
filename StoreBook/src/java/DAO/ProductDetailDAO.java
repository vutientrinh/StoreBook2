/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import business.*;
import data.DBUtil;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.*;
import javax.persistence.TypedQuery;

/**
 *
 * @author acer
 */
public class ProductDetailDAO {

    public static void addProductDetail(Long bookID, int quantity, Cart cart) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        ProductDetail productdetail = new ProductDetail(); // Assuming ProductDetail is an entity
        Book book = em.find(Book.class, bookID);
        trans.begin();
        try {
            ProductDetail oldproductdetail = new ProductDetail();
            oldproductdetail = getProductDetailbyID(bookID, cart.getCart_id());
            if (oldproductdetail != null) {
                if (quantity >= oldproductdetail.getQuantity()) {
                    oldproductdetail.setQuantity(book.getQuantity() + oldproductdetail.getQuantity());
                    book.setQuantity(0);
                    book.setBought(book.getBought() + book.getQuantity());
                    BookDAO.update(book, book.getBook_id());
                } else {
                    oldproductdetail.setQuantity(quantity+oldproductdetail.getQuantity());
                    book.setQuantity(book.getQuantity()-quantity);
                    book.setBought(book.getBought()+quantity);
                    BookDAO.update(book,book.getBook_id());
                    em.merge(oldproductdetail);
                }

                trans.commit();
            } else {
                Query query = em.createQuery("SELECT p FROM ProductDetail p ORDER BY p.id DESC");
                query.setMaxResults(1);
                List<ProductDetail> resultList = query.getResultList();

                if (!resultList.isEmpty()) {

                    ProductDetail lastProduct = (ProductDetail) query.getSingleResult();

                    // Tạo id cho sản phẩm mới
                    Long newId = 1L; // Giá trị mặc định nếu không có sản phẩm nào trong cơ sở dữ liệu
                    if (lastProduct != null) {
                        newId = lastProduct.getId() + 1; // Tăng id so với sản phẩm cuối cùng
                    }
                    if (book.getQuantity() <= quantity) {
                        productdetail.setCart(cart);
                        productdetail.setId(newId);
                        productdetail.setBook(book);
                        productdetail.setQuantity(book.getQuantity());
                        book.setQuantity(0);
                        book.setBought(book.getBought() + book.getQuantity());
                        BookDAO.update(book, book.getBook_id());
                        em.persist(productdetail);
                    } else {
                        productdetail.setCart(cart);
                        productdetail.setId(newId);
                        productdetail.setBook(book);
                        productdetail.setQuantity(quantity);
                        book.setQuantity(book.getQuantity() - quantity);
                        book.setBought(book.getBought() + quantity);
                        BookDAO.update(book, book.getBook_id());

                        em.persist(productdetail);
                    }
                    trans.commit();
                } else {
                    Long newId = 1L; // Giá trị mặc định nếu không có sản phẩm nào trong cơ sở dữ liệu

                    // Gán id cho sản phẩm mới
                    productdetail.setCart(cart);
                    productdetail.setId(newId);
                    productdetail.setBook(book);
                    productdetail.setQuantity(quantity);
                    em.persist(productdetail);
                    trans.commit();
                }
            }

        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void update(ProductDetail productdetail) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(productdetail);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void remove(Long id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();

        try {
            ProductDetail item = em.find(ProductDetail.class,
                    id);
            if (item != null) {
                em.remove(item);
            }
            trans.commit();
        } catch (RuntimeException e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static Long Total(List<ProductDetail> books) {
        long total = 0;
        for (ProductDetail item : books) {
            total += (item.getQuantity()) * (item.getBook().getPrice());
        }
        return total;
    }

    public static ArrayList<ProductDetail> GetAllByIDCart(Long cart_id) {
        ArrayList<ProductDetail> listproduct = new ArrayList<>(); // Initialize the ArrayList

        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {

            TypedQuery<ProductDetail> query = em.createQuery("SELECT pd FROM ProductDetail pd WHERE pd.cart.cart_id = :cart_id", ProductDetail.class);
            // Set the parameter value
            query.setParameter("cart_id", cart_id);
            List<ProductDetail> resultList = query.getResultList(); // Use List<Book> variable

            if (resultList != null && !resultList.isEmpty()) {
                listproduct.addAll(resultList); // Add all elements from List<Book> to ArrayList<Book>
            }
        } finally {
            em.close();
        }

        return listproduct; // Return the ArrayList<Book>
    }

    public static ProductDetail getProductDetailbyID(Long book_id, Long cart_id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        ProductDetail productDetail = null;
        try {
            // Create a query that selects all product details where the book ID matches the parameter
            Query query = em.createQuery("SELECT pd FROM ProductDetail pd WHERE pd.book.book_id = :book_id AND pd.cart.cart_id = :cart_id");
            // Set the parameter value
            query.setParameter("book_id", book_id);
            query.setParameter("cart_id", cart_id);
            // Execute the query and get the result list
            productDetail = (ProductDetail) query.getSingleResult();
            // Commit the transaction
            trans.commit();
        } catch (Exception e) {
            // If any exception occurs, roll back the transaction and print the stack trace
            trans.rollback();
            e.printStackTrace();
        } finally {
            // Close the entity manager
            em.close();
        }
        return productDetail;
    }

}
