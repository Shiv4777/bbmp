package com.jeshtah.demoLawyer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jeshtah.demoLawyer.model.CaseDetail;
import com.jeshtah.demoLawyer.model.ClientDetails;
import com.jeshtah.demoLawyer.model.Hearing;
import com.jeshtah.demoLawyer.repository.CaseRegistrationRepository;
import com.jeshtah.demoLawyer.repository.ClientDetailsRepository;
import com.jeshtah.demoLawyer.repository.HearingRepository;

@Controller
public class SetHearingController {
	
	@Autowired
	private ClientDetailsRepository clientDetailsRepository;
	
	@Autowired
	private CaseRegistrationRepository caseRegistrationRepository; 
	
	@Autowired
	private HearingRepository hearingRepository;

	@RequestMapping(value = "/setHearing", method = RequestMethod.GET)
	public ModelAndView setHearing() {
		Iterable<ClientDetails> clientDetails = clientDetailsRepository.findAllByOrderByIdDesc();
		return new ModelAndView("setHearing","clients",clientDetails);
	}
	
	@RequestMapping(value = "/setHearing", method = RequestMethod.POST)
	public ModelAndView setHearingDetails(HttpServletRequest req) {
		String clientId = req.getParameter("clientname");
		String caseId = req.getParameter("case_Id");
		String nextDateHearing = req.getParameter("hearingDate1");
		String caseDescription = req.getParameter("caseDetails");
		String caseStatus = req.getParameter("caseStatus");
		System.out.println(clientId + "\t" + caseId + "\t" + nextDateHearing + "\t" + caseDescription + "\t" + caseStatus);
		//Saving object to DataBase
		Hearing entity=new Hearing();
		entity.setCaseDescription(caseDescription);
		entity.setNextDateHearing(nextDateHearing);
		entity.setCaseStatus(caseStatus);
		CaseDetail caseDetail = caseRegistrationRepository.findById(Integer.parseInt(caseId)).get();
		ClientDetails clientDetails = clientDetailsRepository.findById(Integer.parseInt(clientId)).get();
		entity.setCaseDetail(caseDetail);
		entity.setClientDetails(clientDetails);
		hearingRepository.save(entity);
		
		return new ModelAndView("lawyerDashboard");
	}
}
