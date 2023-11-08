package lntai.cafeshop.entity;

import lombok.Data;
import javax.persistence.*;

@Entity
@Table(name = "product")
@Data
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")

    private long product_id;

    private String name;

    private double price;

    private String image_url;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private ProductCategory ProductCategory;


}
