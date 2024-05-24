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
public class PublisherDAO {

    public static void addPublisher(Publisher publisher) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Query query = em.createQuery("SELECT p FROM Publisher p ORDER BY p.publisher_id DESC");
            query.setMaxResults(1);
            Publisher lastPublisher = (Publisher) query.getSingleResult();
            Long newId = 1L;

            if (lastPublisher != null) {
                newId = lastPublisher.getPublisher_id() + 1;
            }
            publisher.setPublisher_id(newId);

            em.persist(publisher);

            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }

    }

    public static Publisher getPublisherByBookID(Long publisher_id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Publisher publisher = null;
        try {
            publisher = em.find(Publisher.class, publisher_id);
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return publisher;
    }

    public static Publisher getPublisherByID(Long pubID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Publisher publisher = null;

        try {
            em.getTransaction().begin();

            String jpql = "SELECT p FROM Publisher p WHERE p.publisher_id = :pubID";
            TypedQuery<Publisher> query = em.createQuery(jpql, Publisher.class);
            query.setParameter("pubID", pubID);

            publisher = query.getSingleResult();

            em.getTransaction().commit();
        } catch (NoResultException e) {
            System.out.println("Publisher not found with ID: " + pubID);
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

        return publisher;
    }

    public static Publisher getPublisherByName(String pubName) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Publisher publisher = null;

        try {
            em.getTransaction().begin();

            String jpql = "SELECT p FROM Publisher p WHERE LOWER(p.publisher_name) = LOWER(:pubName)";
            TypedQuery<Publisher> query = em.createQuery(jpql, Publisher.class);
            query.setParameter("pubName", pubName);

            publisher = query.getSingleResult();

            em.getTransaction().commit();
        } catch (NoResultException e) {
            System.out.println("Publisher not found with name: " + pubName);
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

        return publisher;
    }

    public static List<Publisher> getAll() {
        // open session
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        List<Publisher> publishers = null;
        try {
            // Create query
            final String sqlString = "select pb from Publisher pb";
            Query query = em.createQuery(sqlString);
            publishers = query.getResultList();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
        return publishers;
    }

}
