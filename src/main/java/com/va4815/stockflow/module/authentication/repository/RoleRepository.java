package com.va4815.stockflow.module.authentication.repository;

import com.va4815.stockflow.module.authentication.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer> {

}
