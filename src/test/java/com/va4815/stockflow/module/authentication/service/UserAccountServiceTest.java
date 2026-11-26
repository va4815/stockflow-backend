package com.va4815.stockflow.module.authentication.service;

import com.va4815.stockflow.module.authentication.repository.UserAccountRepository;
import com.va4815.stockflow.module.authentication.repository.UserSettingRepository;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
public class UserAccountServiceTest {

    @Mock
    private UserAccountRepository userAccountRepository;

    @Mock
    private UserSettingRepository userSettingRepository;

    @InjectMocks
    private UserAccountService userAccountService;

}
