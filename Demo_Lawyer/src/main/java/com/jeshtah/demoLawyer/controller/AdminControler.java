package com.jeshtah.demoLawyer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class AdminControler {
	
	@RequestMapping(value="/adminDasbord")
	public String adminDashbord(HttpServletRequest req,HttpServletResponse res) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		req.getSession().setAttribute("user", userDetails);
		return "lawyerDashboard";
	}
	
	@RequestMapping(value="/user")
	@PreAuthorize("hasAnyRole('ADMIN','USER')")
	public String user() {
		return "registration";
	}
	
	@RequestMapping(value="/admin")
	@PreAuthorize("hasAnyRole('ADMIN')")
	public String adminDashBord() {
		return "welcome";
	}
	
	@RequestMapping(value="/fileupload")
	public String file() {
		return "fileUpload";
		
	}
}
