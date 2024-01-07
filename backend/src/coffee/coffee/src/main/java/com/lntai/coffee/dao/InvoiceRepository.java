package com.lntai.coffee.dao;

import com.lntai.coffee.entity.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvoiceRepository extends JpaRepository<Invoice, Integer> {

//    Page<Invoice> findByTableId(@RequestParam("table_id") Integer tableId,
//                                Pageable pageable);

//    Page<Invoice> findByEmployee_EmployeeId(@RequestParam("employeeId") Integer employeeId, Pageable pageable);
}