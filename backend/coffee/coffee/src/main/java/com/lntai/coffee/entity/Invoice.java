package com.lntai.coffee.entity;

import jakarta.persistence.Table;
import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;

@Entity
@Table(name = "INVOICE") // Bọc tên bảng trong dấu nháy ngược
@Data
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer orderId;

    @ManyToOne
    @JoinColumn(name = "table_id")
    private TableOrder tableId;

    private String status;

    @Column(name = "total_amount")
    private BigDecimal totalAmount;

    @Column(name = "payment_status")
    private String paymentStatus;

    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employeeId;
}