package com.lntai.coffee.controller;

import com.lntai.coffee.dto.InvoiceDTO;
import com.lntai.coffee.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/invoices")
public class InvoiceController {

    private final InvoiceService invoiceService;

    @Autowired
    public InvoiceController(InvoiceService invoiceService) {
        this.invoiceService = invoiceService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<InvoiceDTO> getInvoiceById(@PathVariable Integer id) {
        try {
            InvoiceDTO invoiceDTO = invoiceService.getInvoiceById(id);
            if (invoiceDTO != null) {
                return new ResponseEntity<>(invoiceDTO, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping()
    public ResponseEntity<List<InvoiceDTO>> getAllInvoices() {
        try {
            List<InvoiceDTO> invoices = invoiceService.getAllInvoices();
            return new ResponseEntity<>(invoices, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
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

    @PutMapping("/{id}")
    public ResponseEntity<String> updateInvoice(
            @PathVariable Integer id,
            @RequestBody InvoiceDTO invoiceRequest) {
        try {
            invoiceService.updateInvoice(
                    id,
                    invoiceRequest.getTotalAmount(),
                    invoiceRequest.getPaymentStatus(),
                    invoiceRequest.getEmployeeId()
            );
            return new ResponseEntity<>("Invoice updated successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error updating invoice: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteInvoice(@PathVariable Integer id) {
        try {
            invoiceService.deleteInvoice(id);
            return new ResponseEntity<>("Invoice deleted successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error deleting invoice: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}