package com.lntai.coffee.entity;

import jakarta.persistence.Table;
import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;

@Entity
@Table(name = "INVOICE")
@Data
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "invoice_id")
    private Integer invoiceId;

    @ManyToOne
    @JoinColumn(name = "tableorder_id")
    private TableOrder tableId;


    @Column(name = "total_amount")
    private BigDecimal totalAmount;

    @Column(name = "payment_status")
    private String paymentStatus;

    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employeeId;
}