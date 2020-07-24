/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.shopandcart.dao;

import com.learn.shopandcart.entities.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author BHAVYA
 */
public class userDao {
    private SessionFactory factory;

    public userDao(SessionFactory factory) {
        this.factory = factory;
    }
    //getUserByEmailandPassword
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        try
        {
            String query="from User where userEmail =: e and userpassword=: p";
            Session session=this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            
            user=(User)q.uniqueResult(); 
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
                
        return user;
    }
    public User getUserByEmail(String email)
    {
        User user=null;
        try
        {
            String query="from User where userEmail =: e";
            Session session=this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",email);
         
            
            user=(User)q.list().get(0); 
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
                
        return user;
    }
    public User getUserById(int id)
    {
        User user=null;
        try
        {
            String query="from User where userId =: e";
            Session session=this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",id);
         
            
            user=(User)q.list().get(0); 
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
                
        return user;
    }
    
}
