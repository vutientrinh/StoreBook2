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
import javax.persistence.TypedQuery;

/**
 *
 * @author acer
 */
public class CartDAO {

    public static void save(Cart cart) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(cart);
            System.out.println("đã lưu cart");
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void addCart(Cart cart, long uid) {
        ProductDetailDAO productdetaildao = new ProductDetailDAO();
        cart.setProductDetails(productdetaildao.GetAllByIDCart(cart.getCart_id()));
        updateCart(cart, uid);
    }

    public static void updateCart(Cart cart, long uid) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(cart);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
    public static Cart getCartByUID(Long uid) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        Cart cart = null;
        try {
            String jpql = "SELECT c FROM Cart c WHERE c.customer.customer_id = :uid"; // Filtering by customer_id
            TypedQuery<Cart> query = em.createQuery(jpql, Cart.class);
            query.setParameter("uid", uid); // Set parameter for uid
            query.setMaxResults(1); // Limit the result to 1 cart

            cart = query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return cart;
    }

}
