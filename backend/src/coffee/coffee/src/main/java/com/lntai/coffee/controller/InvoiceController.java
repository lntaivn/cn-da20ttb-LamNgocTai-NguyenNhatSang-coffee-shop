package com.lntai.coffee.controller;

import com.lntai.coffee.dto.InvoiceDTO;
import com.lntai.coffee.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/invoices")
public class InvoiceController {

    private final InvoiceService invoiceService;

    @Autowired
    public InvoiceController(InvoiceService invoiceService) {
        this.invoiceService = invoiceService;
    }

    @PostMapping()
    public ResponseEntity<String> createInvoice(@RequestBody InvoiceDTO invoiceRequest) {
        try {
            invoiceService.createInvoice(
                    invoiceRequest.getTableOrderId(),
                    invoiceRequest.getTotalAmount(),
                    invoiceRequest.getPaymentStatus(),
                    invoiceRequest.getEmployeeId()
            );
            return new ResponseEntity<>("Invoice created successfully", HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>("Error creating invoice: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{invoiceId}")
    public ResponseEntity<String> updateInvoice(
            @PathVariable Integer invoiceId,
            @RequestBody InvoiceDTO invoiceRequest) {
        try {
            invoiceService.updateInvoice(
                    invoiceId,
                    invoiceRequest.getTotalAmount(),
                    invoiceRequest.getPaymentStatus(),
                    invoiceRequest.getEmployeeId()
            );
            return new ResponseEntity<>("Invoice updated successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error updating invoice: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
