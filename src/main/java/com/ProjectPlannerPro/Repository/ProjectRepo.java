package com.ProjectPlannerPro.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ProjectPlannerPro.entity.Project;
import com.ProjectPlannerPro.entity.User;

@Repository
public interface ProjectRepo extends JpaRepository<Project, Integer> {

	public Project findById(int id);
	
	public List<Project> findByUser(User user);
}
