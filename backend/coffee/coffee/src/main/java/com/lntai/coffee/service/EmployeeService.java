package com.lntai.coffee.service;

import com.lntai.coffee.dao.EmployeeRepository;
import com.lntai.coffee.entity.Employee;
import com.lntai.coffee.request.ChangePasswordRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;

@Service
@RequiredArgsConstructor
public class EmployeeService {
    private final PasswordEncoder passwordEncoder;
    private final EmployeeRepository repository;
    public void changePassword(ChangePasswordRequest request, Principal connectedUser) {

        var user = (Employee) ((UsernamePasswordAuthenticationToken) connectedUser).getPrincipal();

        // kiem tra mat khau
        if (!passwordEncoder.matches(request.getCurrentPassword(), user.getPassword())) {
            throw new IllegalStateException("Wrong password");
        }
        // kiem tra mat khau giong nhau
        if (!request.getNewPassword().equals(request.getConfirmationPassword())) {
            throw new IllegalStateException("Password are not the same");
        }

        // cap nhat
        user.setPassword(passwordEncoder.encode(request.getNewPassword()));

        // luu mat khau
        repository.save(user);
    }
}
