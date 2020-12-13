package com.jeshtah.demoLawyer.repository;

import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.jeshtah.demoLawyer.model.User;


@Repository
@Transactional
public interface UserRepository extends JpaRepository<User, Integer> {
	User findByUserName(String username);
	Optional<User> findByEmail(String email);
}
