package com.jeshtah.demoLawyer.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="TEST2")
public class Test2 {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="tes_id")
	private int id;
	
	String name;
	String lname;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name ="test_id",referencedColumnName = "test_id")
	Test test;
	
	public Test getTest() {
		return test;
	}
	public void setTest(Test test) {
		this.test = test;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Test2() {
		super();
	}
}
