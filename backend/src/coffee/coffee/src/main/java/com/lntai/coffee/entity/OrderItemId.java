package com.lntai.coffee.entity;

import java.io.Serializable;
import java.util.Objects;

public class OrderItemId implements Serializable {
    private int invoiceId;
    private int productId;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderItemId that = (OrderItemId) o;
        return invoiceId == that.invoiceId &&
                productId == that.productId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(invoiceId, productId);
    }
}
