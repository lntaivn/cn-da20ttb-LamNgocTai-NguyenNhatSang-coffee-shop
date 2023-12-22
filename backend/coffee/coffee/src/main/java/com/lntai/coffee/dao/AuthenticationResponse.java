package com.lntai.coffee.dao;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.lntai.coffee.entity.Employee;
import com.lntai.coffee.entity.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AuthenticationResponse {

    @JsonProperty("access_token")
    private String accessToken;

    @JsonProperty("refresh_token")
    private String refreshToken;

    private String message;

    private Integer employeeId;
    private String username;
    private String email;
    private String address;
    private Employee.Gender gender;
    private Role role;
}

