package com.lntai.coffee.dao;

import com.lntai.coffee.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRespository extends JpaRepository<Order, Integer> {

}
