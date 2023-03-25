package com.wonwon.zeropayAPI;

import java.sql.DriverManager;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class ZeropayApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZeropayApiApplication.class, args);
	}

}
