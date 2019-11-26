package com.shopmoba.validator;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.shopmoba.dao.ProductDAO;
import com.shopmoba.model.Product;
import com.shopmoba.service.ProductInfo;
 
@Component
public class ProductInfoValidator implements Validator {
 
    @Autowired
    private ProductDAO productDAO;

    
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == ProductInfo.class;
    }
 
    @Override
    public void validate(Object target, Errors errors) {
        ProductInfo productInfo = (ProductInfo) target;
 
        // Check the fields of ProductInfo class.
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "NotEmpty.productForm.code");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.productForm.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotEmpty.productForm.price");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nHeros", "NotEmpty.productForm.hero");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nRounds", "NotEmpty.productForm.round");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nSkins", "NotEmpty.productForm.skin");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "isGemstone", "NotEmpty.productForm.gemstone");
        
        String code = productInfo.getCode();
        if (code != null && code.length() > 0) {
            if (code.matches("\\s+")) {
                errors.rejectValue("code", "Pattern.productForm.code");
            } else if(productInfo.isNewProduct()) {
                Product product = productDAO.findProduct(code);
                if (product != null) {
                    errors.rejectValue("code", "Duplicate.productForm.code");
                }
            }
            
           
        }
        if (productInfo.getPrice() < 0)
        {
        	 errors.rejectValue("price", "Invalid.productForm.price");
        }
        if (productInfo.getnHeros() < 0)
        {
        	 errors.rejectValue("nHeros", "Invalid.productForm.hero");
        }
        if (productInfo.getnSkins() < 0)
        {
        	 errors.rejectValue("nSkins", "Invalid.productForm.skin");
        }
        if (productInfo.getnRounds() < 0)
        {
        	 errors.rejectValue("nRounds", "Invalid.productForm.round");
        }
    }
 
}