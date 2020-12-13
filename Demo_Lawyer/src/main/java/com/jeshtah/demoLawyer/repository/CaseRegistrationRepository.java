package com.jeshtah.demoLawyer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.jeshtah.demoLawyer.model.CaseDetail;

public interface CaseRegistrationRepository extends CrudRepository<CaseDetail, Integer>{
	@Query(value ="select *from case_detail where client_id=?1",nativeQuery = true)
    public	List<CaseDetail> getCaseDetailByClientId(int client_id);
	
}
