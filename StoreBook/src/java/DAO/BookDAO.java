/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import javax.persistence.Query;
import data.*;
import business.*;
import java.util.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

/**
 *
 * @author acer
 */
public class BookDAO {

    public static void add(Book book) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Query query = em.createQuery("SELECT b FROM Book b ORDER BY b.book_id DESC");
            query.setMaxResults(1);
            Book lastProduct = (Book) query.getSingleResult();
            Long newId = 1L;

            if (lastProduct != null) {
                newId = lastProduct.getBook_id() + 1;
            }
            book.setBook_id(newId);

            em.persist(book);

            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void update(Book book, Long book_id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(book);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void removeBook(Long id, int newStatus) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Book book = em.find(Book.class, id);
            if (book != null) {
                book.setStatus(newStatus);
            }
            em.merge(book);
            trans.commit();
        } catch (RuntimeException e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static ArrayList<Book> getAll() {
        ArrayList<Book> books = new ArrayList<>(); // Initialize the ArrayList

        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {

            TypedQuery<Book> query = em.createQuery("SELECT b FROM Book b", Book.class);
            List<Book> resultList = query.getResultList(); // Use List<Book> variable

            if (resultList != null && !resultList.isEmpty()) {
                books.addAll(resultList); // Add all elements from List<Book> to ArrayList<Book>
            }
        } finally {
            em.close();
        }

        return books; // Return the ArrayList<Book>
    }
     public static ArrayList<Book> getAllactive() {
        ArrayList<Book> books = new ArrayList<>(); // Initialize the ArrayList

        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {

            TypedQuery<Book> query = em.createQuery("SELECT b FROM Book b where b.status =1", Book.class);
            List<Book> resultList = query.getResultList(); // Use List<Book> variable

            if (resultList != null && !resultList.isEmpty()) {
                books.addAll(resultList); // Add all elements from List<Book> to ArrayList<Book>
            }
        } finally {
            em.close();
        }

        return books; // Return the ArrayList<Book>
    }

    public static List<Book> get4LastestProduct() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Book> books = null;
        try {
            String jpql = "SELECT b FROM Book b ORDER BY b.price DESC"; // Assuming publishDate is the date attribute
            TypedQuery<Book> query = em.createQuery(jpql, Book.class);
            query.setMaxResults(4); // Limit the result to 4 products
            books = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return books;
    }

    public static Book newBook() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Book book = null;
        try {
            String jpql = "SELECT b FROM Book b ORDER BY b.bought DESC"; // Assuming publishDate is the date attribute
            TypedQuery<Book> query = em.createQuery(jpql, Book.class);
            query.setMaxResults(1); // Limit the result to 4 products
            book = query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return book;
    }

    public static List<Book> get4Bestbook() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Book> books = null;
        try {
            String jpql = "SELECT b FROM Book b ORDER BY b.bought DESC"; // Assuming publishDate is the date attribute
            TypedQuery<Book> query = em.createQuery(jpql, Book.class);
            query.setMaxResults(4); // Limit the result to 4 products
            books = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return books;
    }

    public static List<Book> getProductByCategoryID(Long cateID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Book> books = null;

        try {
            final String jpql = "SELECT b FROM Book b JOIN b.listCategory c WHERE c.category_id = :cateID and b.status=1";

            Query query = em.createQuery(jpql);
            query.setParameter("cateID", cateID);
            books = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return books;
    }

    public static Book getBookByID(Long bookID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Book book = null; // Initialize as null

        try {
            book = em.find(Book.class, bookID);
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return book;
    }

    public static List<Book> searchByName(String name) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Book> books = null;
        try {
            final String sqlString = "SELECT b FROM Book b WHERE b.book_name LIKE :name and b.status=1";
            Query query = em.createQuery(sqlString);
            query.setParameter("name", "%" + name + "%"); // Wildcards added to search for partial matches
            books = query.getResultList();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return books;
    }

    public static void deleteBookTags(Long bookId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();

        trans.begin();
        try {
            // Fetch the book entity
            Book book = em.find(Book.class, bookId);

            // Clear the categories collection
            book.getListCategory().clear();

            // Save the book entity
            em.merge(book);

            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
}
