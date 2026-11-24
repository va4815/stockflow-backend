package com.va4815.stockflow.module.authentication.repository;

import com.va4815.stockflow.module.authentication.entity.UserSetting;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserSettingRepository extends JpaRepository<UserSetting, Integer> {

}
