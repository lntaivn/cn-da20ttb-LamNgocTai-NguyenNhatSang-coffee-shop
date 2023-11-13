package com.lntai.coffee.dao;

import com.lntai.coffee.entity.Employee;
import com.lntai.coffee.entity.Order;
import com.lntai.coffee.entity.Product;
import com.lntai.coffee.entity.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRespository extends JpaRepository<Employee, Integer> {

}