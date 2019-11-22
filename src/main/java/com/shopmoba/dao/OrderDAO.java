package com.shopmoba.dao;
 
import java.util.List;

import com.shopmoba.model.CartInfo;
import com.shopmoba.model.OrderDetailInfo;
import com.shopmoba.model.OrderInfo;
import com.shopmoba.model.PaginationResult;
 
public interface OrderDAO {
 
    public void saveOrder(CartInfo cartInfo);
 
    public PaginationResult<OrderInfo> listOrderInfo(int page,
            int maxResult, int maxNavigationPage);
    
    public OrderInfo getOrderInfo(String orderId);
    
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);
 
}