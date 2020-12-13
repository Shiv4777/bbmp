package com.jeshtah.demoLawyer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jeshtah.demoLawyer.model.Role;


@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>{
} 
