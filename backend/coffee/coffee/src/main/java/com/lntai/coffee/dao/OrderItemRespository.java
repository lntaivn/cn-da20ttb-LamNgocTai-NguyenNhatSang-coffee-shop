package com.lntai.coffee.dao;

import com.lntai.coffee.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRespository extends JpaRepository<OrderItem, Integer> {

}