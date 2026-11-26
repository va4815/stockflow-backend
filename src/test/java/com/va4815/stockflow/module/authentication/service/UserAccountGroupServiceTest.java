package com.va4815.stockflow.module.authentication.service;

import com.va4815.stockflow.module.authentication.repository.UserAccountGroupRepository;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
public class UserAccountGroupServiceTest {

    @Mock
    private UserAccountGroupRepository userAccountGroupRepository;

    @InjectMocks
    private UserAccountGroupService userAccountGroupService;

}
