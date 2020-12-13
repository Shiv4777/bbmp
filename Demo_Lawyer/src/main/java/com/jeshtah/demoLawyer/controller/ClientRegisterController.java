package com.jeshtah.demoLawyer.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jeshtah.demoLawyer.model.ClientDetails;
import com.jeshtah.demoLawyer.repository.ClientDetailsRepository;

@Controller
public class ClientRegisterController {
	
	@Autowired
	private ClientDetailsRepository clientRepo;

	@RequestMapping(value ="/registerClient", method = RequestMethod.GET)
	public ModelAndView registerClient() {
		return new ModelAndView("registerClient");
	}
	
	@PostMapping(value = "/registerClient")
	public ModelAndView ClientRegister(HttpServletRequest req, HttpServletResponse res) throws ParseException {
		String firstname = req.getParameter("firstName");
		String lastname = req.getParameter("lastName");
		String email = req.getParameter("email");
		String dob = req.getParameter("dob");
		String gender = req.getParameter("female");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String otherDetails = req.getParameter("otherDetails");
		
		
	//	System.out.println(firstname + "\t" + lastname + "\t" + email  + "\t" +  dob  + "\t" + gender    + "\t" +   phone  + "\t" + address   + "\t" + otherDetails   );
		
		ClientDetails client = new ClientDetails();
		
		client.setFirstName(firstname);
		client.setLastName(lastname);
		client.setEmail(email);
		client.setDob(dob);
		client.setGender(gender);
		client.setPhone(Long.parseLong(phone));
		client.setAddress(address);
		client.setOtherDetails(otherDetails);
		
		
		clientRepo.save(client);
		
		return new ModelAndView("lawyerDashboard","message","Saved successfully...");
	}
	
	@GetMapping(value="/ClientDetails")
	@ResponseBody
	public ModelAndView getClientList() {
		List<ClientDetails> client = (List<ClientDetails>) clientRepo.findAll();
		return new ModelAndView("clientList","clients",client);
	}
	
	@RequestMapping(value ="/clientCaseRegistration", method = RequestMethod.GET)
	public ModelAndView clientCaseRegistration() {
		return new ModelAndView("clientcase");
	}
}
