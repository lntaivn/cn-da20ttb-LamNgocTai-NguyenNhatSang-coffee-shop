package lntai.cafeshop.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "ProductCategory")
@Data
public class ProductCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")

    private long category_id;

    private String name;
}
