package com.lntai.coffee.dao;

import com.lntai.coffee.entity.Token;
import io.swagger.v3.oas.annotations.Hidden;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

@Hidden
public interface TokenRepository extends JpaRepository<Token, Integer> {

    @Query(value = """
      select t from Token t inner join Employee e on t.employee.employeeId = e.employeeId
      where e.employeeId = :employeeId and (t.expired = false or t.revoked = false)
      """)
    List<Token> findAllValidTokensByEmployee(Integer employeeId);

    Optional<Token> findByToken(String token);
}
