/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import business.Category;
import data.DBUtil;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.*;
import business.*;
import data.*;
import javax.persistence.EntityTransaction;

/**
 *
 * @author acer
 */
public class CategoryDAO {

    public static void addCategory(Category category) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {

            Query query = em.createQuery("SELECT c FROM Category c ORDER BY c.category_id DESC");
            query.setMaxResults(1);
            Category lastCategory = (Category) query.getSingleResult();
            Long newId = 1L;

            if (lastCategory != null) {
                newId = lastCategory.getCategory_id() + 1;
            }

            category.setCategory_id(newId);

            em.persist(category);

            trans.commit();

        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<Category> getAll() {
        // open session
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Category> categories = null;
        try {
            // Create query
            final String sqlString = "select ct from Category ct";
            Query query = em.createQuery(sqlString);
            categories = query.getResultList();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
        return categories;
    }

    public static List<Category> getCategoryByName(String name) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Category> categories = null;
        try {
            final String sqlString = "SELECT c FROM Category c WHERE c.category_name LIKE :name";
            Query query = em.createQuery(sqlString);
            query.setParameter("name", "%" + name + "%"); // Wildcards added to search for partial matches
            categories = query.getResultList();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return categories;
    }

    public static List<Category> getCategoryByBookID(Long bookID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Category> categories = null;
        try {
            final String sqlString = "SELECT c FROM Category c JOIN c.books b WHERE b.id = :bookID";
            Query query = em.createQuery(sqlString);
            query.setParameter("bookID", bookID);
            categories = query.getResultList();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return categories;
    }

    public static List<Category> getCategoryByExactName(String name) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Category> categories = null;
        try {
            final String sqlString = "SELECT c FROM Category c WHERE c.category_name = :name";
            Query query = em.createQuery(sqlString);
            query.setParameter("name", name);
            categories = query.getResultList();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return categories;
    }

}
