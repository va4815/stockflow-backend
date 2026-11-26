package com.va4815.stockflow.module.authentication.service;

import com.va4815.stockflow.module.authentication.repository.PermissionRepository;
import org.springframework.stereotype.Service;

@Service
public class PermissionService {
    private final PermissionRepository permissionRepository;

    public PermissionService(PermissionRepository permissionRepository) {
        this.permissionRepository = permissionRepository;
    }
}
