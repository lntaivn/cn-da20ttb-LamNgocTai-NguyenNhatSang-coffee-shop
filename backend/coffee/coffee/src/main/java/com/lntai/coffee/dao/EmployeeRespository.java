package com.lntai.coffee.dao;

import com.lntai.coffee.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRespository extends JpaRepository<Employee, Integer> {

}