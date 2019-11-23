package com.shopmoba.model;
 
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

 
@Entity
@Table(name = "Order_Details")
public class OrderDetail implements Serializable {
 
    private static final long serialVersionUID = 7550745928843183535L;
 
    @Id
	private String id;

	private int quanity;

	private double price;

	private double amount;

	@ManyToOne
	@JoinColumn(name = "ORDER_ID")
	private Order order;

	@ManyToOne
	@JoinColumn(name = "PRODUCT_ID")
	private Product product;

	public OrderDetail() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQuanity() {
		return quanity;
	}

	public void setQuanity(int quanity) {
		this.quanity = quanity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order oder) {
		this.order = oder;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
    
}