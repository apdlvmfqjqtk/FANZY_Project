package com.java.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.java.dto.OrderDto;

public interface OrderRepository extends JpaRepository<OrderDto, Integer> {
    // 주문번호로 주문을 찾는 메소드
    Optional<OrderDto> findByOrderNumber(String orderNumber);
}