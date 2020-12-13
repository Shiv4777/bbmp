package com.jeshtah.demoLawyer.servicesImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jeshtah.demoLawyer.model.MyUserDetails;
import com.jeshtah.demoLawyer.model.User;
import com.jeshtah.demoLawyer.repository.UserRepository;

@Service
public class MyUserDetailsServiceImpl implements UserDetailsService {	 

	@Autowired
	private UserRepository userRepository;
	
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<User> activeUser = userRepository.findByEmail(username);
		activeUser.orElseThrow(()->new UsernameNotFoundException("User Not Found"+username));
		return activeUser.map(MyUserDetails::new).get();
	///	User user = userRepository.getActiveUser(username);
		/*
		 * if (activeUser.isEmpty()) { throw new
		 * UsernameNotFoundException("User NOT Found" + username); } return
		 new MyUserDetails(activeUser.get(0)); */
	}
}
