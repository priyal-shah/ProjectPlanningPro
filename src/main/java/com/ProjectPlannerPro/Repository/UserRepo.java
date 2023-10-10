package com.ProjectPlannerPro.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ProjectPlannerPro.entity.User;

@Repository
public interface UserRepo extends JpaRepository<User,Integer> {

	public User findById(int id);
	
	public User findByEmailAndPassword(String email, String password);
	
	public List<User> findByUserType(int type);
	
	
	public List<User> findByName(String name);
}
