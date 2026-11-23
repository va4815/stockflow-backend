package com.va4815.stockflow.config;

import org.flywaydb.core.Flyway;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration(proxyBeanMethods = false)
@ConditionalOnProperty(name = "spring.flyway.enabled", havingValue = "true", matchIfMissing = true)
public class FlywayConfiguration {

    @Bean(name = "authenticationFlyway", initMethod = "migrate")
    Flyway authenticationFlyway(DataSource dataSource) {
        return createFlyway(dataSource, "schema_authentication");
    }

    @Bean(name = "productFlyway", initMethod = "migrate")
    Flyway productFlyway(DataSource dataSource) {
        return createFlyway(dataSource, "schema_product");
    }

    @Bean(name = "inventoryFlyway", initMethod = "migrate")
    Flyway inventoryFlyway(DataSource dataSource) {
        return createFlyway(dataSource, "schema_inventory");
    }

    @Bean(name = "orderFlyway", initMethod = "migrate")
    Flyway orderFlyway(DataSource dataSource) {
        return createFlyway(dataSource, "schema_order");
    }

    private Flyway createFlyway(DataSource dataSource, String schema) {
        return Flyway.configure()
                .dataSource(dataSource)
                .locations("classpath:db/migration/" + schema)
                .defaultSchema(schema)
                .schemas(schema)
                .createSchemas(true)
                .load();
    }

}
