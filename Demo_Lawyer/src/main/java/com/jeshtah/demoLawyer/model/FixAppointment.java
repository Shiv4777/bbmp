package com.jeshtah.demoLawyer.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="FIXAPPOINTMENT")
public class FixAppointment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	private String startDate;
	private String appointmentTime;
	private String priorityRadio;
	private String casualRadio;
	private String height;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "case_id",referencedColumnName = "case_id")
	private CaseDetail caseDetail;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "client_id", referencedColumnName = "client_id")
	private ClientDetails clientDetails;
	
	public FixAppointment() {
		super();
	}

	public String getStartDate() {
		return startDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ClientDetails getClientDetails() {
		return clientDetails;
	}

	public void setClientDetails(ClientDetails clientDetails) {
		this.clientDetails = clientDetails;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getAppointmentTime() {
		return appointmentTime;
	}

	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
	}

	public String getPriorityRadio() {
		return priorityRadio;
	}

	public void setPriorityRadio(String priorityRadio) {
		this.priorityRadio = priorityRadio;
	}

	public String getCasualRadio() {
		return casualRadio;
	}

	public void setCasualRadio(String casualRadio) {
		this.casualRadio = casualRadio;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public CaseDetail getCaseDetail() {
		return caseDetail;
	}

	public void setCaseDetail(CaseDetail caseDetail) {
		this.caseDetail = caseDetail;
	}
}
