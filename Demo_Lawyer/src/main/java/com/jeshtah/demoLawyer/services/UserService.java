package com.jeshtah.demoLawyer.services;

import com.jeshtah.demoLawyer.model.User;

public interface UserService {

	public void save(User user);

	abstract User findByEmail(String email);

}
