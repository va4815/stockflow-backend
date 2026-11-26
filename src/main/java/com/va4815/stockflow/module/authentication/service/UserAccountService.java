package com.va4815.stockflow.module.authentication.service;

import com.va4815.stockflow.module.authentication.repository.UserAccountRepository;
import com.va4815.stockflow.module.authentication.repository.UserSettingRepository;
import org.springframework.stereotype.Service;

@Service
public class UserAccountService {
    private final UserAccountRepository userAccountRepository;
    private final UserSettingRepository userSettingRepository;

    public UserAccountService(UserAccountRepository userAccountRepository, UserSettingRepository userSettingRepository) {
        this.userAccountRepository = userAccountRepository;
        this.userSettingRepository = userSettingRepository;
    }
}
