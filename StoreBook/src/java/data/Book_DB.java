/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import business.*;
import java.util.List;
import javax.persistence.TypedQuery;

/**
 *
 * @author acer
 */
public class Book_DB {

    public static List<Book> getAllBooks() {
        List<Book> books = null;
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            TypedQuery<Book> query = em.createQuery("SELECT b FROM Book b", Book.class);
            books = query.getResultList(); // declare and assign the List<Book> variable
            return  books; // cast and return the List<Book> variable as an ArrayList<Book> object
        } finally {
            em.close();
        }
    }
     public static void insert() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();   
        Book book=new Book();
        book.setBook_img("https://images-us.bookshop.org/ingram/9781646221929.jpg?height=500&v=v2-6aa410c5a55ecd4f126013f073c7f556");
        try {
            em.persist(book);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
}
    