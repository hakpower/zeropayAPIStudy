package com.wonwon.zeropayAPI.config.database;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import com.zaxxer.hikari.HikariDataSource;

import lombok.Getter;

/*
 * dataSource 관련 설정을 application.properties 에서 하는 것이 아닌 별도의 MyDataSource 클래스를 생성해서 진행해봤습니다.
 */
@Component
public class MyDataSource extends HikariDataSource {
	//@Value("${myProp.driverClassName}")
	private String driverClassName="com.mysql.cj.jdbc.Driver";
	
	//@Value("${myProp.dbUrl}")
	private String dbUrl="jdbc:mysql://localhost:3306/zeropayapi";
	
	//@Value("${myProp.dbUserName}")
	private String dbUserName="root";
	
	//@Value("${myProp.dbPassword}")
	private String dbPassword="wh9592";
	
	public MyDataSource() {
		setDriverClassName(getDriverClassName());
		setJdbcUrl(getDbUrl());
		setUsername(getDbUserName());
		setPassword(getDbPassword());
	}
	
	public String getDriverClassName() {
		return driverClassName;
	}

	public String getDbUrl() {
		return dbUrl;
	}

	public String getDbUserName() {
		return dbUserName;
	}

	public String getDbPassword() {
		return dbPassword;
	}
}
