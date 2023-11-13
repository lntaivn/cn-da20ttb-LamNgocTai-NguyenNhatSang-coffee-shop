package com.lntai.coffee.dao;

import com.lntai.coffee.entity.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface OrderRespository extends JpaRepository<Order, Integer> {

    Page<Order> findByTableId(@RequestParam("table_id") Integer tableId,
                              Pageable pageable);

    Page<Order> findByEmployee_EmployeeId(@RequestParam("employeeId") Integer employeeId, Pageable pageable);
}