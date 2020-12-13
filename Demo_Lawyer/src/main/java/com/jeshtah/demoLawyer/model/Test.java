package com.jeshtah.demoLawyer.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="TEST")
public class Test {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="test_id")
	private int id;
	
	private String name;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name ="test_id", referencedColumnName = "test_id")
	private List<Test2> test2;

	public List<Test2> getTest2() {
		return test2;
	}
	public void setTest2(List<Test2> test2) {
		this.test2 = test2;
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
	public Test() {
		super();
	}
}
