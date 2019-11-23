package com.shopmoba.model;
 
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "Products")
public class Product implements Serializable {
 
    private static final long serialVersionUID = -1000119078147252957L;
    @Id
    private String code;
    private String name;
    private double price;
    
    @Lob
    private byte[] image;
    
    @Column(name = "Create_Date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="MM/dd/yyyy")
    private Date createDate;
 
    
    @OneToMany(mappedBy="product", fetch=FetchType.EAGER)
	private Collection<OrderDetail> orderDetails;
    
    public Collection<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Collection<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Product() {
    }

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}