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
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author acer
 */
public class CustomerDAO {

    public static void addCustomer(Customer customer) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Query query = em.createQuery("SELECT c FROM Customer c ORDER BY c.customer_id DESC");
            query.setMaxResults(1);
            List<ProductDetail> resultList = query.getResultList();

            if (!resultList.isEmpty()) {

                Customer lastcustomer = (Customer) query.getSingleResult();

                // Tạo id cho sản phẩm mới
                Long newId = 1L; // Giá trị mặc định nếu không có sản phẩm nào trong cơ sở dữ liệu
                if (lastcustomer != null) {
                    newId = lastcustomer.getCustomer_id() + 1; // Tăng id so với sản phẩm cuối cùng
                }

                // Gán id cho sản phẩm mới
                customer.setCustomer_id(newId);

                em.persist(customer);
                trans.commit();
            }

        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void updateCustomer(Customer customer) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(customer);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static boolean isExistPhone(String phone) {
        boolean result = false;

        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {

            String jpql = "SELECT COUNT(u) FROM Customer u WHERE u.phone_number = :phone";
            Query query = em.createQuery(jpql);
            query.setParameter("phone", phone);
            Long count = (Long) query.getSingleResult();
            System.out.println("Phone count: " + count);

            if (count != null && count > 0) {
                result = true;
            }
            trans.commit();
        } catch (RuntimeException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
        return result;
    }

    public static List<Customer> getAll() {
        List<Customer> customers = null;
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            TypedQuery<Customer> query = em.createQuery("SELECT b FROM Customer b", Customer.class);
            List<Customer> resultList = query.getResultList(); // Use List<Book> variable

            if (resultList != null && !resultList.isEmpty()) {
                customers.addAll(resultList); // Add all elements from List<Book> to ArrayList<Book>
            }

        } catch (RuntimeException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
        return customers;
    }

    public static Customer findByPhone(String phone) {
        Customer customer = null;
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            // Construct the query to find the customer by phone number
            TypedQuery<Customer> query = em.createQuery("SELECT c FROM Customer c WHERE c.phone_number = :phoneNumber", Customer.class);
            query.setParameter("phoneNumber", phone);

            // Execute the query and retrieve the customer
            customer = query.getSingleResult();

            trans.commit(); // Commit the transaction
        } catch (NoResultException e) {
            // Handle case where no customer is found with the given phone number
            System.out.println("Customer not found for phone: " + phone);
        } catch (RuntimeException e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
        return customer;
    }

    public static Customer findByEmail(String email) {
        Customer customer = null;
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            // Construct the query to find the customer by phone number
            TypedQuery<Customer> query = em.createQuery("SELECT c FROM Customer c WHERE c.customer_email = :email", Customer.class);
            query.setParameter("email", email);

            // Execute the query and retrieve the customer
            customer = query.getSingleResult();

            trans.commit(); // Commit the transaction
        } catch (NoResultException e) {
            // Handle case where no customer is found with the given phone number
            System.out.println("Customer not found for email: " + email);
        } catch (RuntimeException e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
        return customer;
    }

    public static Customer testLogin(String email, String password) {
        Customer user = null;
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            TypedQuery<Customer> query = em.createQuery("SELECT u FROM Customer u WHERE u.customer_email = :email AND u.customer_password = :password", Customer.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            // Execute the query and retrieve the user
            user = query.getSingleResult();

            trans.commit(); // Commit the transaction

        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
        return user;
    }

}
