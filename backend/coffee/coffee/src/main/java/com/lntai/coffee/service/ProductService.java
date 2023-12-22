package com.lntai.coffee.service;

import com.lntai.coffee.dao.ProductCategoryRepository;
import com.lntai.coffee.dao.ProductRepository;
import com.lntai.coffee.dto.ProductDTO;
import com.lntai.coffee.entity.Product;
import com.lntai.coffee.entity.ProductCategory;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final ProductCategoryRepository productCategoryRepository;

    public ProductService(ProductRepository productRepository,
                          ProductCategoryRepository productCategoryRepository) {
        this.productRepository = productRepository;
        this.productCategoryRepository = productCategoryRepository;
    }

    public List<Product> findByName(String name) {
        return productRepository.findByNameContaining(name);
    }

    public List<Product> findByCategoryId(Integer category_id) {
        ProductCategory category = productCategoryRepository.findById(category_id)
                .orElseThrow(() -> new EntityNotFoundException("Category not found"));
        return productRepository.findByCategory_Id(category_id);
    }

    public Optional<Product> findById(Integer id) {
        return productRepository.findByProductId(id);
    }

    // Phương thức để lưu một sản phẩm mới
    public Product addProduct(ProductDTO productDTO) {
        ProductCategory category = productCategoryRepository.findById(productDTO.getCategoryId())
                .orElseThrow(() -> new EntityNotFoundException("Category not found"));

        Product product = new Product();
        product.setName(productDTO.getName());
        product.setPrice(productDTO.getPrice());
        product.setImageUrl(productDTO.getImageUrl());
        product.setCategory(category); // Gán đối tượng category tìm được vào product
        return productRepository.save(product);
    }
}
