package com.jeshtah.demoLawyer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jeshtah.demoLawyer.model.User;
import com.jeshtah.demoLawyer.services.UserService;
import com.jeshtah.demoLawyer.util.Constants;

@Controller
public class LoginControler {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = {"/","/login"})
	public String login(HttpServletRequest req, HttpServletResponse res) {
		return "login";
	}

	@RequestMapping(value = "/resetpassword")
	public ModelAndView resetPassword() {
		return new ModelAndView("resetpassword", "user", new User());
	}

	@RequestMapping(value = "/sendresetlink")
	public ModelAndView aceptUserName(@ModelAttribute("user") User user) throws Exception {
		System.out.println(user.getEmail());
		User findByEmail = userService.findByEmail(user.getEmail());
		if (findByEmail == null) {
			return new ModelAndView("resetpassword", "message", Constants.USER_NOT_EXITS);
		}
	//	SendGrid.putSendGrid(findByEmail.getEmail(), findByEmail.getUserName());
		return new ModelAndView("resetpassword" ,"message", Constants.SEND_RESET_URL);
	}

	@RequestMapping(value = "/register")
	public String register(Model model) {
		model.addAttribute("userForm", new User());
		return "registration";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registration(@Valid @ModelAttribute("userForm") User user, BindingResult bindingResult) {
			User findByEmail = userService.findByEmail(user.getEmail());
			if (findByEmail == null) {
				userService.save(user);
			}else {
				return new ModelAndView("registration", "message", Constants.USER_EXITS);
			}

		/*  userValidator.validate(userForm, bindingResult); if
		 * (bindingResult.hasErrors()) { return "registration"; }
		 */
		return new ModelAndView("login" ,"message",Constants.SUCESS);
	}

	@RequestMapping(value = "/logout-success")
	public String logout(HttpServletRequest req, HttpServletResponse res) {
		req.getSession().invalidate();
		return "login";
	}

}
