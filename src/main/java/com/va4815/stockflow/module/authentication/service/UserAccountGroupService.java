package com.va4815.stockflow.module.authentication.service;

import com.va4815.stockflow.module.authentication.repository.UserAccountGroupRepository;
import org.springframework.stereotype.Service;

@Service
public class UserAccountGroupService {
    private final UserAccountGroupRepository userAccountGroupRepository;

    public UserAccountGroupService(UserAccountGroupRepository userAccountGroupRepository) {
        this.userAccountGroupRepository = userAccountGroupRepository;
    }
}
