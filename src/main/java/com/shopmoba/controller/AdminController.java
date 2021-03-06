package com.shopmoba.controller;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopmoba.dao.AccountDAO;
import com.shopmoba.dao.OrderDAO;
import com.shopmoba.dao.ProductDAO;
import com.shopmoba.model.Account;
import com.shopmoba.service.OrderDetailInfo;
import com.shopmoba.service.OrderInfo;
import com.shopmoba.service.PaginationResult;
import com.shopmoba.service.ProductInfo;
import com.shopmoba.util.SecurityUltil;
import com.shopmoba.validator.AccountInfoValidator;
import com.shopmoba.validator.ProductInfoValidator;
 
@Controller
@Transactional
@EnableWebMvc
public class AdminController {
 
    @Autowired
    private OrderDAO orderDAO;
 
    @Autowired
    private ProductDAO productDAO;
 
    @Autowired
    private ProductInfoValidator productInfoValidator;
    
    @Autowired
    private AccountInfoValidator accountInfoValidator;
 
    @Autowired
    private AccountDAO accountDAO;
    
    
    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("Target=" + target);
 
        if (target.getClass() == ProductInfo.class) {
            dataBinder.setValidator(productInfoValidator);
            dataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
        }
        
        if (target.getClass() == Account.class) {
            dataBinder.setValidator(accountInfoValidator);
           
        }
    }
 
    
    @RequestMapping(value = { "/signup" }, method = RequestMethod.GET)
    public String signup(Model model) {
    	Account  account = new Account();
    	model.addAttribute("account", account);
        return "Signup";
    }
    
    
    // POST: Show Sign up Page, save account
    // Save or update Applicant
    // 1. @ModelAttribute bind form value
    // 2. @Validated form validator
    // 3. RedirectAttributes for flash value
    
	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST)
	public String signupSave(Model model, @ModelAttribute("account") @Validated Account account, BindingResult result,
			final RedirectAttributes redirectAttributes) {
		
		 if (result.hasErrors()) {
	            return "Signup";
	        }
		 
		 try {
			 account.setActive(true);
			 accountDAO.saveAccount(account);	
			} catch (Exception e) {
				 // Need: Propagation.NEVER?
	            String message = e.getMessage();
	            model.addAttribute("errorMessage", message);
	           
	            return "redirect:/Signup";
			}
		 	
		 
		 	model.addAttribute("account", account);
	        return "success";
	}
	
	
    // GET: Show Login Page
    @RequestMapping(value = { "/login" }, method = RequestMethod.GET)
    public String login(Model model) {
 
        return "login";
    }
 
    @RequestMapping(value = { "/accountInfo" }, method = RequestMethod.GET)
    public String accountInfo(Model model) {
 
        model.addAttribute("userDetails", accountDAO.findAccount(SecurityUltil.getPrincipal()));
        return "accountInfo";
    }
 
    @RequestMapping(value = { "/orderList" }, method = RequestMethod.GET)
    public String orderList(Model model,
            @RequestParam(value = "page", defaultValue = "1") String pageStr) {
        int page = 1;
        try {
            page = Integer.parseInt(pageStr);
        } catch (Exception e) {
        }
        final int MAX_RESULT = 5;
        final int MAX_NAVIGATION_PAGE = 10;
 
        PaginationResult<OrderInfo> paginationResult = orderDAO.listOrderInfo(page, MAX_RESULT, MAX_NAVIGATION_PAGE);
 
        model.addAttribute("paginationResult", paginationResult);
        return "orderList";
    }
 
    // GET: Show product. 
    @RequestMapping(value = { "/product" }, method = RequestMethod.GET)
    public String product(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
        ProductInfo productInfo = null;
 
        if (code != null && code.length() > 0) {
            productInfo = productDAO.findProductInfo(code);
        }
        if (productInfo == null) {
            productInfo = new ProductInfo();
            productInfo.setNewProduct(true);
        }
        model.addAttribute("productForm", productInfo);
        return "product";
    }
    
    
    // POST: Save product
    @RequestMapping(value = { "/product" }, method = RequestMethod.POST)
    // Avoid UnexpectedRollbackException 
    @Transactional(propagation = Propagation.NEVER)
    public String productSave(Model model,
            @ModelAttribute("productForm") @Validated ProductInfo productInfo, 
            BindingResult result, 
            final RedirectAttributes redirectAttributes) {
 
        if (result.hasErrors()) {
            return "product";
        }
        try {
            productDAO.save(productInfo);
        } catch (Exception e) {
            // Need: Propagation.NEVER?
            String message = e.getMessage();
            model.addAttribute("message", message);
            // Show product form.
            return "product";
 
        }
        return "redirect:/productList";
    }
 
 
 // GET: delete product.
    @RequestMapping(value = { "/deleteProduct" }, method = RequestMethod.GET)
    public String deleteProduct(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
        ProductInfo productInfo = null;
 
        if (code != null && code.length() > 0) {
            productInfo = productDAO.findProductInfo(code);
           
        }
        if (productInfo == null) {
        	 model.addAttribute("message", "delete failed  !!!");
        	 return "productList";
        }else
        {
        	boolean check = this.orderDAO.checkProductCode(code);
        	if (!check)
        	{
            this.productDAO.deleteProduct(code);
        	}
        	else
        	{
        		model.addAttribute("message", "delete failed  !!! Product has an order !!!");
        		 return "productList";
        	}

        }
        model.addAttribute("message", "delete successful  !!! Product " + code + " has been deteted !!!");
        return "productList";
    }
 

    @RequestMapping(value = { "/order" }, method = RequestMethod.GET)
    public String orderView(Model model, @RequestParam("orderId") String orderId) {
        OrderInfo orderInfo = null;
        if (orderId != null) {
            orderInfo = this.orderDAO.getOrderInfo(orderId);
        }
        if (orderInfo == null) {
            return "redirect:/orderList";
        }
        List<OrderDetailInfo> details = this.orderDAO.listOrderDetailInfos(orderId);
        orderInfo.setDetails(details);
 
        model.addAttribute("orderInfo", orderInfo);
 
        return "order";
    }
    
    
    @RequestMapping(value = { "/deleteOrder" }, method = RequestMethod.GET)
    public String orderDelete(Model model, @RequestParam("orderId") String orderId) {
        OrderInfo orderInfo = null;
        if (orderId != null) {
            orderInfo = this.orderDAO.getOrderInfo(orderId);
        }
        if (orderInfo == null) {
        	model.addAttribute("message", "delete failed");
            return "orderList";
        }else
        {
        	this.orderDAO.deleteOrder(orderId);
        }
        
 
        return "redirect:/orderList";
    }
    
}