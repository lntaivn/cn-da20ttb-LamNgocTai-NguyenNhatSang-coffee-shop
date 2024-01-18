package com.lntai.coffee.dao;

import com.lntai.coffee.entity.Employee;
import com.lntai.coffee.entity.Invoice;
import com.lntai.coffee.entity.Product;
import com.lntai.coffee.entity.TableOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface InvoiceRepository extends JpaRepository<Invoice, Integer> {
    @Query("SELECT i FROM Invoice i WHERE i.tableOrderId.tableOrderId = :tableId")
    List<Invoice> findInvoicesByTableId(@Param("tableId") Integer tableId);



}