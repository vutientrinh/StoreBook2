/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import business.*;
import data.DBUtil;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.*;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author acer
 */
public class AuthorDAO {

    public static List<Author> getAll() {
        // open session
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Author> authors = null;
        try {
            // Create query
            final String sqlString = "select pb from Author pb";
            Query query = em.createQuery(sqlString);
            authors = query.getResultList();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
        return authors;
    }

    public static void addAuthor(Author author) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Query query = em.createQuery("SELECT a FROM Author a ORDER BY a.author_id DESC");
            query.setMaxResults(1);

            Author lastAuthor = (Author) query.getSingleResult();
            Long newID = 1L;
            if (lastAuthor != null) {
                newID = lastAuthor.getAuthor_id() + 1;
            }
            author.setAuthor_id(newID);

            em.persist(author);

            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }

    }

    public static Author getAuthorByBookID(Long book_id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Author author = null;
        try {
            author = em.find(Author.class, book_id);
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {

            em.close();
        }

        return author;
    }

    public static Author getAuthorByID(Long authorID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Author author = null;

        try {
            em.getTransaction().begin();

            String jpql = "SELECT a FROM Author a WHERE a.author_id = :authorID";
            TypedQuery<Author> query = em.createQuery(jpql, Author.class);
            query.setParameter("authorID", authorID);

            author = query.getSingleResult();

            em.getTransaction().commit();
        } catch (NoResultException e) {
            System.out.println("Author not found with ID: " + authorID);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }

        return author;
    }

    public static Author getAuthorByName(String authorName) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Author author = null;

        try {
            em.getTransaction().begin();

            String jpql = "SELECT a FROM Author a WHERE a.author_name = :authorName";
            TypedQuery<Author> query = em.createQuery(jpql, Author.class);
            query.setParameter("authorName", authorName);

            author = query.getSingleResult();

            em.getTransaction().commit();
        } catch (NoResultException e) {
            System.out.println("Author not found with name: " + authorName);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
        return author;
    }
}
