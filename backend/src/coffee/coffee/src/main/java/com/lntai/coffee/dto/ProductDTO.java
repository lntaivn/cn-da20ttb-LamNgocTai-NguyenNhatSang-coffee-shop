package com.lntai.coffee.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
    private String name;
    @NotNull(message = "Price cannot be null")
    @Min(value = 0, message = "Price must be a non-negative number")
    private BigDecimal price;
    private String imageUrl;
    private Integer categoryId;
}
