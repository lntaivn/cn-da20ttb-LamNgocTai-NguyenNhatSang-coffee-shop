package com.lntai.coffee.dao;

import com.lntai.coffee.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductCategoryRepository extends JpaRepository<Product, Integer> {

}
