package com.jeshtah.demoLawyer.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Transactional
public class MyUserDetails implements UserDetails{
	private static final long serialVersionUID = 1L;
	private String userName;
	private String password;
	private boolean active;
	private List<GrantedAuthority> authority; 
	
	public MyUserDetails(User user) {
		this.userName=user.getUserName();
		this.password=user.getPassword();
	//	this.active=user.getActive();
		Set<Role> roles = user.getRoles();
		  List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
	        if (roles != null) {
	            for (Role role : roles) {
	                GrantedAuthority authority = new SimpleGrantedAuthority(role.getRole());
	                grantList.add(authority);
	            }
	        }
	        this.authority=grantList;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
	//	return user.getRoles().stream().map(role->new SimpleGrantedAuthority("ROLE"+role)).collect(Collectors.toList());
		return authority;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return userName;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
