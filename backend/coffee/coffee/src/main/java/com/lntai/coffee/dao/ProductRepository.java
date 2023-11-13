package com.lntai.coffee.dao;

import org.springframework.data.domain.Page;
import com.lntai.coffee.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.RequestParam;

public interface ProductRepository extends JpaRepository<Product, Integer> {
//    Page<Product> findByCategoryId(@RequestParam("category_id") Integer categoryId,
//                              Pageable pageable);


}
