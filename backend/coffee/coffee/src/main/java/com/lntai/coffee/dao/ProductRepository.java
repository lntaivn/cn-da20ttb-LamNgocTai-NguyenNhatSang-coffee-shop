package com.lntai.coffee.dao;

import com.lntai.coffee.entity.ProductCategory;
import org.springframework.data.domain.Page;
import com.lntai.coffee.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    List<Product> findByNameContaining(String name);

    List<Product> findByCategory_Id(Integer categoryId); // Đây là cách đúng

    Optional<Product> findByProductId(Integer id);


}
