package com.lntai.coffee.service;

import com.lntai.coffee.auth.AuthenticationRequest;
import com.lntai.coffee.auth.RegisterRequest;
import com.lntai.coffee.dao.AuthenticationResponse;
import com.lntai.coffee.dao.EmployeeRepository;
import com.lntai.coffee.entity.Employee;
import com.lntai.coffee.entity.Role;
import com.lntai.coffee.token.Token;
import com.lntai.coffee.token.TokenRepository;
import com.lntai.coffee.token.TokenType;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
                .role(Role.USER)
                .deviceAuthentication(request.getDeviceAuthentication())
                .address(request.getAddress())
                .build();
        var saveEmployee =  employeeRepository.save(employee);
        var jwtToken = jwtService.generateToken(employee);
        saveEmployeeToken(saveEmployee, jwtToken);
        return AuthenticationResponse.builder()
                .token(jwtToken)
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

        revokeAllEmployeeTokens(employee);

        saveEmployeeToken(employee, jwtToken);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }
}
