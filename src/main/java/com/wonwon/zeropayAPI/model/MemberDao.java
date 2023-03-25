package com.wonwon.zeropayAPI.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberDao {
	@Select("select * from member")
	List<MemberVo> findAll();
}
