package com.jeshtah.demoLawyer.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jeshtah.demoLawyer.model.Test;

public interface TestRep extends JpaRepository<Test, Integer> {

}
