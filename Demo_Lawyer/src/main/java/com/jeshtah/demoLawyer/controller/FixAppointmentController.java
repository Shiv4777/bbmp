package com.jeshtah.demoLawyer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.jeshtah.demoLawyer.model.CaseDetail;
import com.jeshtah.demoLawyer.model.ClientDetails;
import com.jeshtah.demoLawyer.model.FixAppointment;
import com.jeshtah.demoLawyer.model.ResponseObject;
import com.jeshtah.demoLawyer.repository.ClientDetailsRepository;
import com.jeshtah.demoLawyer.repository.FixAppointmentRepository;

@Controller
public class FixAppointmentController {

	@Autowired
	private ClientDetailsRepository clientDetailsRepository;
	
	@Autowired
	private FixAppointmentRepository FixAppointmentRepository;
	
	@Autowired
	private com.jeshtah.demoLawyer.repository.CaseRegistrationRepository caseRegistrationRepository; 
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	@RequestMapping(value ="/fixAppointment", method = RequestMethod.GET)
	public ModelAndView fixAppointment() {
		Iterable<ClientDetails> clientDetails = clientDetailsRepository.findAllByOrderByIdDesc();
		return new ModelAndView("fixAppointment","clients",clientDetails);
	}
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	@RequestMapping(value ="/fixAppointment", method = RequestMethod.POST)
	public ModelAndView fixAppointmentRegistartion(HttpServletRequest req) {
		String clientId = req.getParameter("clientname");
		String caseId = req.getParameter("case_Id");
		String startDate = req.getParameter("startDate");
		String appointmentTime = req.getParameter("appointmentTime");
		String priorityRadio = req.getParameter("priorityRadio");
		String casualRadio = req.getParameter("casualRadio");
		String height = req.getParameter("height");
		
		FixAppointment entity=new FixAppointment();
		entity.setAppointmentTime(appointmentTime);
		entity.setStartDate(startDate);
		entity.setPriorityRadio(priorityRadio);
		entity.setCasualRadio(casualRadio);
		entity.setHeight(height);
		CaseDetail caseDetail = caseRegistrationRepository.findById(Integer.parseInt(caseId)).get();
		ClientDetails clientDetails = clientDetailsRepository.findById(Integer.parseInt(clientId)).get();
		entity.setCaseDetail(caseDetail);
		entity.setClientDetails(clientDetails);
		FixAppointmentRepository.save(entity);
		return new ModelAndView("lawyerDashboard");
	}
	
	@RequestMapping(value ="/getCaseDetails", method = RequestMethod.POST)
	@ResponseBody
	public ResponseObject getCaseDetails(HttpServletRequest req) throws JsonProcessingException{
		String parameter = req.getParameter("clientId");
		List<CaseDetail> caseDetailByClientId = caseRegistrationRepository.getCaseDetailByClientId(Integer.parseInt(parameter));
		ResponseObject rs=new ResponseObject();
		rs.setStatusCode(200);
		rs.setMessage("sucess");
		rs.setResult(caseDetailByClientId);
//		  ObjectMapper mapper = new ObjectMapper();
//		  String jsonString = mapper.writeValueAsString(caseDetailByClientId);
//		  System.out.println(jsonString);
//		  
//		  Gson pretty=new GsonBuilder().setPrettyPrinting().create();
//		  String json = pretty.toJson(caseDetailByClientId);
//		  System.out.println(json);
		return rs;

	}
}
