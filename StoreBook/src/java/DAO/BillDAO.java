/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.CartDAO.updateCart;
import business.Cart;
import data.DBUtil;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import DAO.*;
import business.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.*;
import javax.persistence.NoResultException;

/**
 *
 * @author acer
 */
public class BillDAO {

    public static void save(Bill bill, Customer customer, Cart cart) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            bill.setCustomer(customer);
            bill.setPayment_date(new Date());
            ArrayList<ProductDetail> productdetails = ProductDetailDAO.GetAllByIDCart(cart.getCart_id());
            bill.setStatus(1);
            for (ProductDetail productdetail : productdetails) {
                productdetail.setBill(bill);
                ProductDetailDAO.update(productdetail);
            }
            System.out.println("lấy được bill id");
            em.persist(bill);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }

    public static void updateBill(Bill bill, long uid) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(bill);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<Bill> GetAllBillofUser(Long uid) {
        ArrayList<Bill> listBillUser = new ArrayList<>(); // Initialize the ArrayList
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {

            TypedQuery<Bill> query = em.createQuery("SELECT pd FROM Bill pd WHERE pd.customer.customer_id = :uid", Bill.class);
            // Set the parameter value
            query.setParameter("uid", uid);
            List<Bill> resultList = query.getResultList(); // Use List<Book> variable

            if (resultList != null && !resultList.isEmpty()) {
                listBillUser.addAll(resultList); // Add all elements from List<Book> to ArrayList<Book>
            }
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();

        } finally {
            em.close();
        }

        return listBillUser;
    }

    public static List<Bill> GetAll() {
        ArrayList<Bill> listBillUser = new ArrayList<>(); // Initialize the ArrayList
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {

            TypedQuery<Bill> query = em.createQuery("SELECT pd FROM Bill pd", Bill.class);
            // Set the parameter value

            List<Bill> resultList = query.getResultList(); // Use List<Book> variable

            if (resultList != null && !resultList.isEmpty()) {
                listBillUser.addAll(resultList); // Add all elements from List<Book> to ArrayList<Book>
            }
        } finally {
            em.close();
        }

        return listBillUser;
    }

    public static Bill findBillbyBillID(Long billID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Bill bill = em.find(Bill.class, billID);
        em.close(); // Close the EntityManager after retrieving the data
        return bill;
    }

    public static List<Bill> GetByMonth(int year, int month) {
        List<Bill> listBillUser = new ArrayList<>();
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        try {
            TypedQuery<Bill> query = em.createQuery(
                    "SELECT pd FROM Bill pd "
                    + "WHERE FUNCTION('YEAR', pd.payment_date) = :year "
                    + "AND FUNCTION('MONTH', pd.payment_date) = :month",
                    Bill.class
            );

            query.setParameter("year", year);
            query.setParameter("month", month);

            listBillUser = query.getResultList();
        } finally {
            em.close();
        }

        return listBillUser;
    }
}
