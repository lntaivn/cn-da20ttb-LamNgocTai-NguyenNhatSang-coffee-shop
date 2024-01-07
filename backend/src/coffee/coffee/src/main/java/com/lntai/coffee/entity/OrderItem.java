package com.lntai.coffee.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "\"ORDERITEM\"")
@Data
@IdClass(OrderItemId.class)
public class OrderItem {
    @Id
    @Column(name = "invoice_id")
    private int invoiceId;

    @Id
    @Column(name = "product_id")
    private int productId;

    @Column(name = "count")
    private int count;
}
