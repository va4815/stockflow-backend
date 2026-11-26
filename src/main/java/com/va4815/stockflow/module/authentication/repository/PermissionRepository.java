package com.va4815.stockflow.module.authentication.repository;

import com.va4815.stockflow.module.authentication.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PermissionRepository extends JpaRepository<Permission, Integer> {

}
