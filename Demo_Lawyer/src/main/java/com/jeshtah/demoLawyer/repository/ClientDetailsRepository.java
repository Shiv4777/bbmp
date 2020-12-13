package com.jeshtah.demoLawyer.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jeshtah.demoLawyer.model.ClientDetails;

@Repository
public interface ClientDetailsRepository  extends CrudRepository<ClientDetails, Integer>{
	
	public List<ClientDetails> findAllByOrderByIdDesc();

}
