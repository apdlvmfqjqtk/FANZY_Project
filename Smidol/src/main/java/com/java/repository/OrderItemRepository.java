package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.java.dto.OrderItemDto;

public interface OrderItemRepository extends JpaRepository<OrderItemDto, Integer> {
    // 기본 CRUD 메소드는 JpaRepository에서 제공됨
}