package com.ProjectPlannerPro.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="task")
public class Task {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int tId;
	
	private String name;
	private String desc;
	//assigned: 1, in progress: 2, completed: 3, could not complete: 4, created but not assign :0
	private int status;
	@ManyToOne
	private User user;
	@ManyToOne
	private Project project;
	
	public int gettId() {
		return tId;
	}
	public void settId(int tId) {
		this.tId = tId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public Task(int tId, String name, String desc, int status, User user, Project project) {
		super();
		this.tId = tId;
		this.name = name;
		this.desc = desc;
		this.status = status;
		this.user = user;
		this.project = project;
	}
	public Task() {
		super();
		// TODO Auto-generated constructor stub
	}
//	@Override
//	public String toString() {
//		return "Task [tId=" + tId + ", name=" + name + ", desc=" + desc + ", status=" + status + ", user=" + user
//				+ ", project=" + project + "]";
//	}
	
	
	
}
