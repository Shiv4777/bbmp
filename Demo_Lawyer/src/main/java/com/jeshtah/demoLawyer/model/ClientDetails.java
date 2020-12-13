package com.jeshtah.demoLawyer.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//Model is used for mapping variables to columns in table.
// create class
// add 2 annotations a)Entity @Table--> to create table

// these 2 annotatations are used for creating primary key(ID), GeneratedValue(AutoIncrement)
// Create columns related to variables matching fields in the UI

// to set Getter-Setter methods for usuage whole through out project--> Right Click->Source-> Generate Getter-Setter

//After this Create Repository to implement CRUD operations -> to add SQL Qureies.
@Entity
@Table(name = "clientDetails")
public class ClientDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "client_id")
	private int id;

	@Column(name = "firstName")
	private String firstName;

	@Column(name = "lastName")
	private String lastName;
	@Column(name = "email")
	private String email;
	@Column(name = "dob")
	private String dob;
	@Column(name = "gender")
	private String gender;
	@Column(name = "phone")
	private long phone;
	@Column(name = "address")
	private String address;
	@Column(name = "otherDetails")
	private String otherDetails;

//	@OneToOne(mappedBy = "clientDetails")
//	@JsonIgnoreProperties("clientDetails")
//	private CaseDetail caseDetail;

//	public CaseDetail getCaseDetail() {
//		return caseDetail;
//	}
//
//	public void setCaseDetail(CaseDetail caseDetail) {
//		this.caseDetail = caseDetail;
//	}

	public ClientDetails() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOtherDetails() {
		return otherDetails;
	}

	public void setOtherDetails(String otherDetails) {
		this.otherDetails = otherDetails;
	}

}
