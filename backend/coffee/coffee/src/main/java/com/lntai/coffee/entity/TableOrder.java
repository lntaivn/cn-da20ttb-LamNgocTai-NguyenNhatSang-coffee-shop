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
    private Integer tableId;

    @Column(name = "table_name")
    private String tableName;
}
