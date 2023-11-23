package com.lntai.coffee.service;

import com.lntai.coffee.auth.AuthenticationRequest;
import com.lntai.coffee.auth.RegisterRequest;
import com.lntai.coffee.dao.AuthenticationResponse;
import com.lntai.coffee.dao.EmployeeRepository;
import com.lntai.coffee.entity.Employee;
import com.lntai.coffee.entity.Role;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final EmployeeRepository employeeRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    public AuthenticationResponse register(RegisterRequest request) {
        var employee = Employee.builder()
                .username(request.getUsername())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .gender(Employee.Gender.MALE)
                .born(request.getBorn())
                .role(Role.USER)
                .deviceAuthentication(request.getDeviceAuthentication())
                .address(request.getAddress())
                .build();
        employeeRepository.save(employee);
        var jwtToken = jwtService.generateToken(employee);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }

    public AuthenticationResponse authenticate(AuthenticationRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getEmail(),
                        request.getPassword()
                )
        );
        var employee = employeeRepository.findByEmail(request.getEmail())
                .orElseThrow();
        var jwtToken = jwtService.generateToken(employee);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }
}
