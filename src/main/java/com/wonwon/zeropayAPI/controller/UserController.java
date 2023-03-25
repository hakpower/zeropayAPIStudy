package com.wonwon.zeropayAPI.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wonwon.zeropayAPI.service.MemberService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/member")
public class UserController {
	private final MemberService memberService;

	@GetMapping("/")
	public String index() {
		
		return memberService.selectAll();
	}
}
