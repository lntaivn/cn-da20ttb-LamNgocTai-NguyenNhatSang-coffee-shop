package com.lntai.coffee.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "Employee")
@Data
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_id")
    private int employeeId;

    private String name;

    private String email;

    private String password;

    private Date born;

    private String address;

    @Column(name = "gender")
    private Gender gender;

    private String role;

    @Column(name = "device_authentication")
    private String deviceAuthentication;

    public enum Gender {
        MALE, FEMALE, OTHER
    }
}