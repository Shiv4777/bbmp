package com.jeshtah.demoLawyer.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.jeshtah.demoLawyer.config.CustomeLoginSuccessHandler;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(
      securedEnabled = true,
      jsr250Enabled = true,
      prePostEnabled = true
)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private CustomeLoginSuccessHandler customeLoginHandler;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService)
		.passwordEncoder(getPasswordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		
		 http.authorizeRequests()
		 .antMatchers("/").permitAll()
		 .antMatchers("/security/**").permitAll()
		 .antMatchers("/login").permitAll()
		 .antMatchers("/resetpassword").permitAll()
		 .antMatchers("/sendresetlink").permitAll()
		 .antMatchers("/fileupload").permitAll()
		 .antMatchers("/register").permitAll()
		 .antMatchers("/test").permitAll()
		 .antMatchers("/admim/**").hasRole("ADMIN")
		 .antMatchers("/home").hasAnyRole("ADMIN","USER")
		 .anyRequest().authenticated()
		 .and()
		 .formLogin()
		 .loginPage("/login")
	//	 .successForwardUrl("/adminDasbord") 
		 .successHandler(customeLoginHandler)
		 .failureUrl("/login?error=true")
		 .and()
		 .logout().invalidateHttpSession(true)
		 .clearAuthentication(true)
		 .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		 .logoutSuccessUrl("/logout-success").permitAll()
		 .and()
		 .rememberMe().key("remember-me").tokenValiditySeconds(144000)
		 .and()
		 .exceptionHandling()
		 .accessDeniedPage("/accessDenied.jsp");
	}
	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**","/vendor/**");
	}
}
