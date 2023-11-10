package com.lntai.coffee.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;

@Entity
@Table(name = "Order") // Chú ý tên bảng đã được thay đổi thành "CoffeeOrder" để tránh trùng với từ khóa SQL "ORDER"
@Data
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private int orderId;

    @Column(name = "table_id")
    private int tableId;

    private String status;

    @Column(name = "total_amount")
    private BigDecimal totalAmount;

    @Column(name = "payment_status")
    private String paymentStatus;

    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
}