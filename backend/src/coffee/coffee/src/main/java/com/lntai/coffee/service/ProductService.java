package com.lntai.coffee.service;

import com.lntai.coffee.dao.ProductRepository;
import com.lntai.coffee.entity.Product;
import com.lntai.coffee.entity.ProductCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product getProductById(Integer productId) {
        return productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found with id: " + productId));
    }

    public void createProduct(String name, BigDecimal price, String imageUrl, ProductCategory category) {
        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setImageUrl(imageUrl);
        product.setCategory(category);

        productRepository.save(product);
    }

    public void updateProduct(Integer productId, Product updatedProduct) {
        Product existingProduct = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found with id: " + productId));

        existingProduct.setName(updatedProduct.getName());
        existingProduct.setPrice(updatedProduct.getPrice());
        existingProduct.setImageUrl(updatedProduct.getImageUrl());
        existingProduct.setCategory(updatedProduct.getCategory());

        productRepository.save(existingProduct);
    }

    public void deleteProduct(Integer productId) {
        Product existingProduct = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found with id: " + productId));

        productRepository.delete(existingProduct);
    }
}
