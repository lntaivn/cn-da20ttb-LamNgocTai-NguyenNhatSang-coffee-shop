package com.lntai.coffee.dao;

import com.lntai.coffee.entity.ProductCategory;
import org.springframework.data.domain.Page;
import com.lntai.coffee.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query(value = """
      SELECT p1_0 FROM Product p1_0
      WHERE p1_0.name LIKE %:name%
      """)
    List<Product> findByNameContaining(@Param("name") String name);

    List<Product> findByCategory_Id(Integer categoryId);

    Optional<Product> findByProductId(Integer id);

}
