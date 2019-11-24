package com.shopmoba.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.shopmoba.dao.AccountDAO;
import com.shopmoba.model.Account;

@Component
public class AccountInfoValidator implements Validator{   
	
    	@Autowired
    	private AccountDAO accountDAO;
	    @Override
	    public boolean supports(Class<?> clazz) {
	        return clazz == Account.class;
	    }


		@Override
		public void validate(Object target, Errors errors) { 
			 Account acount = (Account) target;
		        // Check the fields of CustomerInfo class.
		        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullName", "NotEmpty.signupForm.fullName");
		        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.signupForm.passwoird");
		        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotEmpty.signupForm.phone");
		        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "NotEmpty.signupForm.userName");
		        String userName = acount.getUserName();
		        if (userName != null && userName.length() > 0)
		        {
		        	Account acc = accountDAO.findAccount(userName);
		        	if (acc != null)
		        	{
		        		errors.rejectValue("userName", "Duplicate.signupForm.username");
		        	}
		      
		        }
		}
}
