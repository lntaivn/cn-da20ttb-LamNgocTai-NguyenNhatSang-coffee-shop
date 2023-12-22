package com.lntai.coffee.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lntai.coffee.auth.AuthenticationRequest;
import com.lntai.coffee.request.RegisterRequest;
import com.lntai.coffee.dao.AuthenticationResponse;
import com.lntai.coffee.dao.EmployeeRepository;
import com.lntai.coffee.entity.Employee;
import com.lntai.coffee.token.Token;
import com.lntai.coffee.dao.TokenRepository;
import com.lntai.coffee.token.TokenType;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final EmployeeRepository employeeRepository;
    private final TokenRepository tokenRepository;
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
                .role(request.getRole())
                .deviceAuthentication(request.getDeviceAuthentication())
                .address(request.getAddress())
                .build();
        var saveEmployee =  employeeRepository.save(employee);
        var jwtToken = jwtService.generateToken(employee);
        var refreshToken = jwtService.generateRefreshToken(employee);
        saveEmployeeToken(saveEmployee, jwtToken);
        return AuthenticationResponse.builder()
                .accessToken(jwtToken)
                .refreshToken(refreshToken)
                .build();
    }

    private void revokeAllEmployeeTokens(Employee employee){
        var validEmployeeTokens = tokenRepository.findAllValidTokensByEmployee(employee.getEmployeeId());
        if(validEmployeeTokens.isEmpty())
            return;

        validEmployeeTokens.forEach(t -> {
            t.setExpired(true);
            t.setRevoked(true);
        });
        tokenRepository.saveAll(validEmployeeTokens);
    }

    private void saveEmployeeToken(Employee employee, String jwtToken) {
        var token = Token.builder()
                .employee(employee)
                .token(jwtToken)
                .tokenType(TokenType.BEARER)
                .expired(false)
                .revoked(false)
                .build();
        tokenRepository.save(token);
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
        var refreshToken = jwtService.generateRefreshToken(employee);

        revokeAllEmployeeTokens(employee);
        saveEmployeeToken(employee, jwtToken);
        return AuthenticationResponse.builder()
                .accessToken(jwtToken)
                .refreshToken(refreshToken)
                .employeeId(employee.getEmployeeId())
                .username(employee.getUsername())
                .email(employee.getEmail())
                .address(employee.getAddress())
                .gender(employee.getGender())
                .message("Đăng ký thành công")
                .role(employee.getRole())
                .build();

    }

    public void refreshToken(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {
        final String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        final String refreshToken;
        final String userEmail;
        if (authHeader == null ||!authHeader.startsWith("Bearer ")) {
            return;
        }
        refreshToken = authHeader.substring(7);
        userEmail = jwtService.extractUsername(refreshToken);
        if (userEmail != null) {
            var user = this.employeeRepository.findByEmail(userEmail)
                    .orElseThrow();
            if (jwtService.isTokenValid(refreshToken, user)) {
                var accessToken = jwtService.generateToken(user);
                revokeAllEmployeeTokens(user);
                saveEmployeeToken(user, accessToken);
                var authResponse = AuthenticationResponse.builder()
                        .accessToken(accessToken)
                        .refreshToken(refreshToken)
                        .build();
                new ObjectMapper().writeValue(response.getOutputStream(), authResponse);
            }
        }
    }
}
