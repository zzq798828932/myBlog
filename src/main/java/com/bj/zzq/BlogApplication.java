package com.bj.zzq;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.thymeleaf.ThymeleafAutoConfiguration;

@SpringBootApplication(exclude = {ThymeleafAutoConfiguration.class})
@MapperScan(basePackages = "com.bj.zzq.dao")
public class BlogApplication {
    public static void main(String[] args){

        SpringApplication.run(BlogApplication.class,args);
    }
}