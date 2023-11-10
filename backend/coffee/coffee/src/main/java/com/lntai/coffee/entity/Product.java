package com.lntai.coffee.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;

@Entity
@Table(name = "Product")
@Data
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Integer productId;

    private String name;

    private BigDecimal price;

    private String imageUrl; // Sử dụng kiểu dữ liệu String

    @ManyToOne
    @JoinColumn(name = "category_id")
    private ProductCategory category_id;
}