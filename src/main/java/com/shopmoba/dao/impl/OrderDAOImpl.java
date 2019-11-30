package com.shopmoba.dao.impl;
 
import java.util.Date;
import java.util.List;
import java.util.UUID;
 
import org.hibernate.query.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.shopmoba.dao.OrderDAO;
import com.shopmoba.dao.ProductDAO;
import com.shopmoba.model.Order;
import com.shopmoba.model.OrderDetail;
import com.shopmoba.model.Product;
import com.shopmoba.service.CartInfo;
import com.shopmoba.service.CartLineInfo;
import com.shopmoba.service.CustomerInfo;
import com.shopmoba.service.OrderDetailInfo;
import com.shopmoba.service.OrderInfo;
import com.shopmoba.service.PaginationResult;
 
@Transactional
public class OrderDAOImpl implements OrderDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    @Autowired
    private ProductDAO productDAO;
 
    private int getMaxOrderNum() {
        String hql = "Select max(o.orderNum) from " + Order.class.getName() + " o ";
        Session session = sessionFactory.getCurrentSession();
        Integer value = (Integer) session.createQuery(hql).uniqueResult();
        if (value == null) {
            return 0;
        }
        return value;
    }
 
    @Override
    public void saveOrder(CartInfo cartInfo) {
        Session session = sessionFactory.getCurrentSession();
 
        int orderNum = this.getMaxOrderNum() + 1;
        Order order = new Order();
 
        order.setId(UUID.randomUUID().toString());
        order.setOrderNum(orderNum);
        order.setOrderDate(new Date());
        order.setAmount(cartInfo.getAmountTotal());
 
        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
        order.setCustomerName(customerInfo.getName());
        order.setCustomerEmail(customerInfo.getEmail());
        order.setCustomerPhone(customerInfo.getPhone());
        order.setCustomerAddress(customerInfo.getAddress());
 
        session.persist(order);
 
        List<CartLineInfo> lines = cartInfo.getCartLines();
 
        for (CartLineInfo line : lines) {
            OrderDetail detail = new OrderDetail();
            detail.setId(UUID.randomUUID().toString());
            detail.setOrder(order);
            detail.setAmount(line.getAmount());
            detail.setPrice(line.getProductInfo().getPrice());
            detail.setQuanity(line.getQuantity());
 
            String code = line.getProductInfo().getCode();
            Product product = this.productDAO.findProduct(code);
            detail.setProduct(product);
 
            session.persist(detail);
        }
 
        // Set OrderNum for report.
        // Set OrderNum để thông báo cho ngư�?i dùng.
        cartInfo.setOrderNum(orderNum);
    }
 
    // @page = 1, 2, ...
    @Override
    public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult, int maxNavigationPage) {
        String hql = "Select new " + OrderInfo.class.getName()
                + "(ord.id, ord.orderDate, ord.orderNum, ord.amount, "
                + " ord.customerName, ord.customerAddress, ord.customerEmail, ord.customerPhone) " + " from "
                + Order.class.getName() + " ord "
                + " order by ord.orderNum desc";
        Session session = this.sessionFactory.getCurrentSession();
        return new PaginationResult<OrderInfo>(session.createQuery(hql), page, maxResult, maxNavigationPage);
    }
 
    public Order findOrder(String orderId) {
        Session session = sessionFactory.getCurrentSession();
        return (Order) session.get(Order.class, orderId);
    }
 
    @Override
    public OrderInfo getOrderInfo(String orderId) {
        Order order = this.findOrder(orderId);
        if (order == null) {
            return null;
        }
        return new OrderInfo(order.getId(), order.getOrderDate(), 
                order.getOrderNum(), order.getAmount(), order.getCustomerName(), 
                order.getCustomerAddress(), order.getCustomerEmail(), order.getCustomerPhone());
    }
 
    @Override
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId) {
        String hql = "Select new " + OrderDetailInfo.class.getName() 
                + "(d.id, d.product.code, d.product.name , d.quanity,d.price,d.amount) "
                + " from " + OrderDetail.class.getName() + " d "
                + " where d.order.id = :orderId ";
 
        Session session = this.sessionFactory.getCurrentSession();
 
        @SuppressWarnings("unchecked")
		Query<OrderDetailInfo> query = session.createQuery(hql);
        query.setParameter("orderId", orderId);
 
        return query.list();
    }

	@Override
	public void deleteOrder(String orderID) {
		 Order order= null;
		 try {
			 	order = findOrder(orderID);
			    Session session = sessionFactory.getCurrentSession();
			    session.delete(order);
			    System.out.println("delete order successful " + orderID );
			    return;
			  } catch (RuntimeException re) {
				
				System.out.println("delete order failed " + orderID );
			    throw re;
			  }
	}

	@Override
	public boolean checkProductCode(String code) {
		
    	try {
    	    Session session = sessionFactory.getCurrentSession();
    	    String hql = "FROM OrderDetail od WHERE od.product.code = '" + code + "'";
    	    
    	    @SuppressWarnings("unchecked")
			List<OrderDetail> ls =  session.createQuery(hql).list();
    	    if ( ls.isEmpty())
    	    {
    	    	return false;
    	    }
    	    else 
    	    {
    	    	return true;
    	    }
    	   
		} catch (HibernateException hibernateEx) {
			hibernateEx.printStackTrace();
			return false;
		}catch(Exception ex)
    	{
			ex.printStackTrace();
			return false;
    	}
    
	}
    
    
 
}