package com.wonwon.zeropayAPI.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.activation.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.wonwon.zeropayAPI.model.MemberDao;
import com.wonwon.zeropayAPI.model.MemberVo;

@Service
public class MemberService {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public String selectAll() {
		SqlSession session = sqlSessionFactory.openSession();
		
		Iterator<MemberVo> ite = session.getMapper(MemberDao.class).findAll().iterator();
		List<String> data = new ArrayList<>();
		while(ite.hasNext()) {
			MemberVo member = ite.next();
			String json = "{\"mem_id\":\""+member.getMem_id()+"\", \"mem_pw\":\""+member.getMem_pw()+"\", \"mem_name\":\""+member.getMem_name()+"\"}";
			data.add(json);
		}
		
		return data.toString();
	}
}
