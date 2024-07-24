package com.lntai.coffee.controller;

import com.lntai.coffee.entity.Product;
import com.lntai.coffee.entity.ProductCategory;
import com.lntai.coffee.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public ResponseEntity<List<Product>> getAllProducts() {
        List<Product> products = productService.getAllProducts();
        return new ResponseEntity<>(products, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable Integer id) {
        Product product = productService.getProductById(id);
        return new ResponseEntity<>(product, HttpStatus.OK);
    }

    @PostMapping()
    public ResponseEntity<String> createProduct(
            @RequestParam String name,
            @RequestParam BigDecimal price,
            @RequestParam String imageUrl,
            @RequestParam Integer categoryId) {
        try {
            ProductCategory category = new ProductCategory();
            category.setId(categoryId);

            productService.createProduct(name, price, imageUrl, category);
            return new ResponseEntity<>("Product created successfully", HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>("Error creating product: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PutMapping("/{id}")
    public ResponseEntity<String> updateProduct(@PathVariable Integer id, @RequestBody Product updatedProduct) {
        try {
            productService.updateProduct(id, updatedProduct);
            return new ResponseEntity<>("Product updated successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error updating product: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteProduct(@PathVariable Integer id) {
        try {
            productService.deleteProduct(id);
            return new ResponseEntity<>("Product deleted successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error deleting product: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}

