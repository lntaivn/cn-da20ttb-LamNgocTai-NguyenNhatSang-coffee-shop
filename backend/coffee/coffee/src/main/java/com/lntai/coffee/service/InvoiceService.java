package com.lntai.coffee.service;

import com.lntai.coffee.dao.InvoiceRepository;
import com.lntai.coffee.dao.TableOrderRepository;
import com.lntai.coffee.dao.EmployeeRepository;
import com.lntai.coffee.dto.InvoiceDTO;
import com.lntai.coffee.entity.Invoice;
import com.lntai.coffee.entity.TableOrder;
import com.lntai.coffee.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvoiceService {
    private final InvoiceRepository invoiceRepository;
    private final TableOrderRepository tableOrderRepository;
    private final EmployeeRepository employeeRepository;

    @Autowired
    public InvoiceService(InvoiceRepository invoiceRepository,
                          TableOrderRepository tableOrderRepository,
                          EmployeeRepository employeeRepository) {
        this.invoiceRepository = invoiceRepository;
        this.tableOrderRepository = tableOrderRepository;
        this.employeeRepository = employeeRepository;
    }

    public Invoice createInvoice(InvoiceDTO invoiceDTO) {
        Invoice invoice = new Invoice();

        invoice.setTotalAmount(invoiceDTO.getTotalAmount());
        invoice.setPaymentStatus(invoiceDTO.getPaymentStatus());

        TableOrder tableOrder = tableOrderRepository.findById(invoiceDTO.getTableOrderId()) // Sử dụng đúng getter
                .orElseThrow(() -> new RuntimeException("TableOrder not found"));
        invoice.setTableId(tableOrder);

        Employee employee = employeeRepository.findById(invoiceDTO.getEmployeeId()) // Sử dụng đúng getter
                .orElseThrow(() -> new RuntimeException("Employee not found"));
        invoice.setEmployeeId(employee);

        return invoiceRepository.save(invoice);
    }

}
