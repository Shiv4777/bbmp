package com.jeshtah.demoLawyer.servicesImpl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jeshtah.demoLawyer.model.Role;
import com.jeshtah.demoLawyer.model.User;
import com.jeshtah.demoLawyer.repository.RoleRepository;
import com.jeshtah.demoLawyer.repository.UserRepository;
import com.jeshtah.demoLawyer.services.UserService;

@Service
public class UserserviceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	

	@Override
	public void save(User user) {
		BCryptPasswordEncoder bCryptPasswordEncoder =new BCryptPasswordEncoder();
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setStatus("VERIFIED");
		Role role = roleRepository.getOne(1);
		user.setRoles(new HashSet<Role>(Arrays.asList(role)));
		userRepository.save(user);
	}

	@Override
	public User findByEmail(String email) {
		Optional<User> findByEmail = userRepository.findByEmail(email);
		if(!findByEmail.isPresent()) {
			return null;
		}
		return findByEmail.get();
	}

}
