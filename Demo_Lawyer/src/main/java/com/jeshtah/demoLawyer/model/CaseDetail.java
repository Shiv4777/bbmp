package com.jeshtah.demoLawyer.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="caseDetail")
public class CaseDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "case_id")
	private int id;
	private String caseName;
	private String startDate;
	private String hearingDate;
	private String caseType;
	private String caseDetails;
	private String referenceBooks;
	private String casestatus;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "client_id", referencedColumnName = "client_id")
	private ClientDetails clientDetails;

	public CaseDetail() {
		super();
	}

	public String getHearingDate() {
		return hearingDate;
	}

	public void setHearingDate(String hearingDate) {
		this.hearingDate = hearingDate;
	}

	public String getReferenceBooks() {
		return referenceBooks;
	}

	public void setReferenceBooks(String referenceBooks) {
		this.referenceBooks = referenceBooks;
	}

	public String getCasestatus() {
		return casestatus;
	}

	public void setCasestatus(String casestatus) {
		this.casestatus = casestatus;
	}

	public ClientDetails getClientDetails() {
		return clientDetails;
	}

	public void setClientDetails(ClientDetails clientDetails) {
		this.clientDetails = clientDetails;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCaseName() {
		return caseName;
	}

	public void setCaseName(String caseName) {
		this.caseName = caseName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getCaseType() {
		return caseType;
	}

	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}

	public String getCaseDetails() {
		return caseDetails;
	}

	public void setCaseDetails(String caseDetails) {
		this.caseDetails = caseDetails;
	}

	public String getReferenceBook() {
		return referenceBook;
	}

	public void setReferenceBook(String referenceBook) {
		this.referenceBook = referenceBook;
	}

	private String referenceBook;

}
