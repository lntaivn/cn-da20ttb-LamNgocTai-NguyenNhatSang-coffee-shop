package com.lntai.coffee.entity;


import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "TABLEORDER")
@Data
public class TableOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tableorder_id")
    private Integer tableOrderId;

    @Column(name = "table_name")
    private String tableName;

    public TableOrder() {
    }
    public TableOrder(Integer tableOrderId) {
        this.tableOrderId = tableOrderId;
    }
}
