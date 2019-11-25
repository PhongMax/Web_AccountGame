package com.shopmoba.service;
 
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.shopmoba.model.Product;
 
public class ProductInfo {
    private String code;
    private String name;
    private double price;
    private int nHeros;
    private int nSkins;
    private int nRounds;
	private boolean isGemstone;
    private boolean newProduct=false;
 

    private CommonsMultipartFile fileData;
 
    public ProductInfo() {
    }
 
    public ProductInfo(Product product) {
        this.code = product.getCode();
        this.name = product.getName();
        this.price = product.getPrice();
        this.nHeros = product.getnHeros();
        this.nSkins = product.getnSkins();
        this.nRounds = product.getnRounds();
        this.isGemstone = product.isGemstone();
    }
 

   
    public ProductInfo(String code, String name, double price, int nHeros, int nSkins, int nRounds,
			boolean isGemstone) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.nHeros = nHeros;
		this.nSkins = nSkins;
		this.nRounds = nRounds;
		this.isGemstone = isGemstone;
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
    
    
    public int getnHeros() {
		return nHeros;
	}

	public void setnHeros(int nHeros) {
		this.nHeros = nHeros;
	}

	public int getnSkins() {
		return nSkins;
	}

	public void setnSkins(int nSkins) {
		this.nSkins = nSkins;
	}

	public int getnRounds() {
		return nRounds;
	}

	public void setnRounds(int nRounds) {
		this.nRounds = nRounds;
	}

	public boolean getIsGemstone() {
		return isGemstone;
	}

	public void setIsGemstone(boolean isGemstone) {
		this.isGemstone = isGemstone;
	}
	
    public CommonsMultipartFile getFileData() {
        return fileData;
    }
 
    public void setFileData(CommonsMultipartFile fileData) {
        this.fileData = fileData;
    }
 
    public boolean isNewProduct() {
        return newProduct;
    }
 
    public void setNewProduct(boolean newProduct) {
        this.newProduct = newProduct;
    }
 
}