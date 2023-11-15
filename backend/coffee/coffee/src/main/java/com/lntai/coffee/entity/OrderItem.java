package com.lntai.coffee.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "\"ORDERITEM\"")
@Data
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_item_id")
    private int orderItemId;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Invoice order;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private int quantity;
}
