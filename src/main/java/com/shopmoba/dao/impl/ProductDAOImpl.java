package com.shopmoba.dao.impl;
 
import java.util.Date;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.shopmoba.dao.ProductDAO;
import com.shopmoba.model.Order;
import com.shopmoba.model.Product;
import com.shopmoba.service.PaginationResult;
import com.shopmoba.service.ProductInfo;


 
@Transactional
public class ProductDAOImpl implements ProductDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    @Override
    public Product findProduct(String code) {
        Session session = sessionFactory.getCurrentSession();
        return (Product) session.get(Product.class, code);
    }
 
    @Override
    public ProductInfo findProductInfo(String code) {
        Product product = this.findProduct(code);
        if (product == null) {
            return null;
        }
        return new ProductInfo(product.getCode(), product.getName(), product.getPrice(), product.getnHeros(),product.getnSkins(), 
        		product.getnRounds(), product.isGemstone());
    }
 
    @Override
    public void save(ProductInfo productInfo) {
        String code = productInfo.getCode();
 
        Product product = null;
 
        boolean isNew = false;
        if (code != null) {
            product = this.findProduct(code);
        }
        if (product == null) {
            isNew = true;
            product = new Product();
            product.setCreateDate(new Date());
        }
        product.setCode(code);
        product.setName(productInfo.getName());
        product.setPrice(productInfo.getPrice());
        
        product.setnHeros(productInfo.getnHeros());
        product.setnSkins(productInfo.getnSkins());
        product.setnRounds(productInfo.getnRounds());
        product.setGemstone(productInfo.getIsGemstone());
        
        if (productInfo.getFileData() != null) {
            byte[] image = productInfo.getFileData().getBytes();
            if (image != null && image.length > 0) {
                product.setImage(image);
            }
        }
        if (isNew) {
            this.sessionFactory.getCurrentSession().persist(product);
        }

        // Nếu có lỗi tại DB, ngoại lệ sẽ ném ra ngay lập tức thay cho try catch
        this.sessionFactory.getCurrentSession().flush();
    }
 

	@Override
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage,
            String likeName) {
        String hql = "Select new " + ProductInfo.class.getName() 
                + "(p.code, p.name, p.price, p.nHeros, p.nRounds, p.nSkins, p.isGemstone) " + " from "
                + Product.class.getName() + " p ";
        if (likeName != null && likeName.length() > 0) {
            hql += " Where lower(p.name) like :likeName ";
        }
        hql += " order by p.createDate desc ";
        
        Session session = sessionFactory.getCurrentSession();
 
        @SuppressWarnings("rawtypes")
		Query query = session.createQuery(hql);
        if (likeName != null && likeName.length() > 0) {
            query.setParameter("likeName", "%" + likeName.toLowerCase() + "%");
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }	
 
    @Override
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage) {
        return queryProducts(page, maxResult, maxNavigationPage, null);
    }

	@Override
	public void deleteProduct(String code) {
		Product product= null;
		 try {
			 	product = findProduct(code);
			    Session session = sessionFactory.getCurrentSession();
			    session.delete(product);
			    System.out.println("delete product successful " + code );
			    return;
			  } catch (RuntimeException re) {
				
				System.out.println("delete product failed " + code );
			    throw re;
			  }
	}
    
}