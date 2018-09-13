package com.cmeizu;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@ConfigurationProperties(prefix = "girl")
public class GirlProperties {
    private String cupSize;

    private Integer age;

    public void setAge(Integer age) {
        this.age = age;
    }

    public void setCupSize(String cupSize) {
        this.cupSize = cupSize;
    }

    public Integer getAge() {
        return age;
    }

    public String getCupSize() {
        return cupSize;
    }
}
