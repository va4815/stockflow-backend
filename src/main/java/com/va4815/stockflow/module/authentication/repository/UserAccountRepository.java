package com.va4815.stockflow.module.authentication.repository;

import com.va4815.stockflow.module.authentication.entity.UserAccount;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserAccountRepository extends JpaRepository<UserAccount, Integer> {

}
