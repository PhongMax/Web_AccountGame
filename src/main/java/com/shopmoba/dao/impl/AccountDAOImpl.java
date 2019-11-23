package com.shopmoba.dao.impl;
 
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.shopmoba.dao.AccountDAO;
import com.shopmoba.model.Account;
 

@Transactional
public class AccountDAOImpl implements AccountDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
 
    @Override
    public Account findAccount(String userName ) {
    	
    	try {
    	    Session session = sessionFactory.getCurrentSession();
    	    String hql = "FROM Account ac WHERE ac.userName = '" + userName + "'";
    			 
    	    return (Account) session.createQuery(hql).uniqueResult();
		} catch (HibernateException hibernateEx) {
			hibernateEx.printStackTrace();
			return null;
		}
    
    }
 
}