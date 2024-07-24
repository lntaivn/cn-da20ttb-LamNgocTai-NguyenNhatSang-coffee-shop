package com.lntai.coffee.request;

import com.lntai.coffee.entity.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RegisterRequest {
    private String username;

    private String email;

    private String password;

    private Date born;

    private String address;

    private String deviceAuthentication;

    private Role role;

}
