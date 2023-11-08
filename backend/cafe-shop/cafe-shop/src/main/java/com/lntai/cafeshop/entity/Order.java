package lntai.cafeshop.entity;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "Order")
@Data
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private int orderId;

    @Column(name = "table_id")
    private int tableId;

    private String status;

    @Column(name = "total_amount")
    private BigDecimal totalAmount;

    @Column(name = "payment_status")
    private String paymentStatus;

    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
}
