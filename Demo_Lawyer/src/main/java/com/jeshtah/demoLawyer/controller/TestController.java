package com.jeshtah.demoLawyer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.jeshtah.demoLawyer.model.Test;
import com.jeshtah.demoLawyer.repository.TestRep;

@RestController
public class TestController {

	@Autowired
	TestRep rep;
	
	@PostMapping(value="/test")
	public List<Test> testMethod(@RequestBody Test test1){
//		
//		Test test=new Test();
//		test.setName("Anil");
//		
//		Test2 test2=new Test2();
//		test2.setName("Frank");
//		test2.setLname("Madhu");
//		
//		Test2 test3=new Test2();
//		test3.setName("Frank");
//		test3.setLname("Madhu");
//		
//		List<Test2> list=new ArrayList<Test2>();
//		list.add(test3);
//		list.add(test2);
//		
//		test.setTest2(list);
		rep.save(test1);
		System.out.println(rep.findAll());
		return null;
		
	}
}
