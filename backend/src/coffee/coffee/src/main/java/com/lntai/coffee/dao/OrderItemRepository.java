package com.lntai.coffee.dao;

import com.lntai.coffee.entity.OrderItem;
import com.lntai.coffee.entity.OrderItemId; // Đảm bảo rằng bạn đã tạo lớp này
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, OrderItemId> {
    // Các phương thức tùy chỉnh nếu cần
}
