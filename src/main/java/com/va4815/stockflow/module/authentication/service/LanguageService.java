package com.va4815.stockflow.module.authentication.service;

import com.va4815.stockflow.module.authentication.repository.LanguageRepository;
import org.springframework.stereotype.Service;

@Service
public class LanguageService {
    private final LanguageRepository languageRepository;

    public LanguageService(LanguageRepository languageRepository) {
        this.languageRepository = languageRepository;
    }
}
