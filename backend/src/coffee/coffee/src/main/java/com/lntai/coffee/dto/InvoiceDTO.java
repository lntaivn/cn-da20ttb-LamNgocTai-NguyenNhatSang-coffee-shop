package com.lntai.coffee.dto;

import lombok.Data;

import java.math.BigDecimal;
@Data
public class InvoiceDTO {
    private Integer tableOrderId;
    private BigDecimal totalAmount;
    private String paymentStatus;
    private Integer employeeId;

}
