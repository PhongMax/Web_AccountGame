package com.shopmoba.dao;
 
import java.util.List;

import com.shopmoba.service.CartInfo;
import com.shopmoba.service.OrderDetailInfo;
import com.shopmoba.service.OrderInfo;
import com.shopmoba.service.PaginationResult;
 
public interface OrderDAO {
 
    public void saveOrder(CartInfo cartInfo);
 
    public PaginationResult<OrderInfo> listOrderInfo(int page,
            int maxResult, int maxNavigationPage);
    
    public OrderInfo getOrderInfo(String orderId);
    
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);
 
}