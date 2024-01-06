package com.lntai.coffee.controller;

import com.lntai.coffee.dto.InvoiceDTO;
import com.lntai.coffee.entity.Invoice;
import com.lntai.coffee.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @PostMapping
    public ResponseEntity<Invoice> createInvoice(@RequestBody InvoiceDTO invoiceDTO) {
        Invoice invoice = invoiceService.createInvoice(invoiceDTO);
        return ResponseEntity.ok(invoice);
    }
}
