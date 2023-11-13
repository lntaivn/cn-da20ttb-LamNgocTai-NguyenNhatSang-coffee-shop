package com.lntai.coffee.dao;

import com.lntai.coffee.entity.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestParam;

public interface OrderRespository extends JpaRepository<Order, Integer> {

    Page<Order> findByTableId(@RequestParam("table_id") Integer tableId,
                              Pageable pageable);
}
