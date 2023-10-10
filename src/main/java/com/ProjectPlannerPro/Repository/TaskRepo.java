package com.ProjectPlannerPro.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ProjectPlannerPro.entity.Project;
import com.ProjectPlannerPro.entity.Task;

@Repository
public interface TaskRepo  extends JpaRepository<Task, Integer>{

	public Task findById(int id);
	
	public List<Task> findByProject(Project p);
}
