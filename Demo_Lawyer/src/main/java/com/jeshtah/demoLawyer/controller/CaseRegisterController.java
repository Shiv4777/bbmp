package com.jeshtah.demoLawyer.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.spi.CleanableThreadContextMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jeshtah.demoLawyer.model.CaseDetail;
import com.jeshtah.demoLawyer.model.ClientDetails;
import com.jeshtah.demoLawyer.repository.ClientDetailsRepository;
import com.jeshtah.demoLawyer.repository.CaseRegistrationRepository;
@Controller
public class CaseRegisterController {

	@Autowired
	private ClientDetailsRepository ClientDetailsRepository;
	
	@Autowired
	private CaseRegistrationRepository CaseRegistrationRepository;
	
	@RequestMapping(value ="/registerCase", method = RequestMethod.GET)
	public ModelAndView registerCase() {
		Iterable<ClientDetails> clientDetails = ClientDetailsRepository.findAllByOrderByIdDesc();
		return new ModelAndView("registerCase","clients",clientDetails);
	}
	
	@RequestMapping(value ="/registerCase", method = RequestMethod.POST)
	public ModelAndView registerCaseDetails(HttpServletRequest req, HttpServletResponse res) {
		String clientId = req.getParameter("client_name");
		String caseName = req.getParameter("caseName");
		String startDate = req.getParameter("startDate");
		String hearingDate1 = req.getParameter("hearingDate1");
		String caseType = req.getParameter("caseType");
		String caseRefBooks = req.getParameter("caseRefBooks");
		String caseDetails = req.getParameter("caseDetails");
		String caseStatus = req.getParameter("caseStatus");
	//	System.out.println(clientId+"\t"+caseName+"\t"+startDate+"\t"+hearingDate1+"\t"+caseType+"\t"+caseRefBooks+"\t"+caseDetails+"\t"+caseStatus);
		
		ClientDetails clientDetail = ClientDetailsRepository.findById(Integer.parseInt(clientId)).get();
		
		CaseDetail clientDetails=new CaseDetail();
		clientDetails.setClientDetails(clientDetail);
		clientDetails.setCaseName(caseName);
		clientDetails.setStartDate(startDate);
		clientDetails.setHearingDate(hearingDate1);
		clientDetails.setCaseType(caseType);
		clientDetails.setReferenceBook(caseRefBooks);
		clientDetails.setCaseDetails(caseDetails);
		clientDetails.setCasestatus(caseStatus);
		CaseRegistrationRepository.save(clientDetails);
		return new ModelAndView("registerCase", "messagge", "Saved successfully...");
	}
}
