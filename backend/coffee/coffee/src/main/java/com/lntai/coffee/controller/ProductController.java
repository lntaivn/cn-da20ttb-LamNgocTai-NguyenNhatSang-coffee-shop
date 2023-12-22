package com.lntai.coffee.controller;

import com.lntai.coffee.dao.ProductCategoryRepository;
import com.lntai.coffee.dao.ProductRepository;
import com.lntai.coffee.dto.ProductDTO;
import com.lntai.coffee.entity.Product;
import com.lntai.coffee.entity.ProductCategory;
import com.lntai.coffee.service.ProductService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/products")
@Validated
public class ProductController {
    private final ProductService productService;
    private final ProductCategoryRepository productCategoryRepository;

    @Autowired
    public ProductController(ProductService productService,
                             ProductCategoryRepository productCategoryRepository) {
        this.productService = productService;
        this.productCategoryRepository = productCategoryRepository;
    }

    @GetMapping("/search/findByCategory_Id")
    public ResponseEntity<?> findByCategoryId(@RequestParam Integer categoryId) {
        try {
            List<Product> products = productService.findByCategoryId(categoryId);
            return ResponseEntity.ok(products);
        } catch (EntityNotFoundException ex) {
            // Trả về ResponseEntity với kiểu dữ liệu phù hợp cho lỗi
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Collections.singletonMap("error", ex.getMessage()));
        }
    }

    @GetMapping("/search/findByNameContaining")
    public ResponseEntity<List<Product>> findByNameContaining(@RequestParam String name) {
        List<Product> products = productService.findByName(name);
        return ResponseEntity.ok(products);
    }

    @GetMapping("/search/findByProductId")
    public ResponseEntity<Product> findByProductId(@RequestParam Integer productId) {
        return productService.findById(productId)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }


    @PostMapping
    public ResponseEntity<Product> createProduct(@RequestBody ProductDTO productDTO) {
        Product product = productService.addProduct(productDTO);
        return new ResponseEntity<>(product, HttpStatus.CREATED);
    }



}
