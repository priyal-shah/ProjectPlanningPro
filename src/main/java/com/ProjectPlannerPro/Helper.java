package com.ProjectPlannerPro;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class Helper {

	
	Map<Integer, String> status=new HashMap<>();
	
	public Helper() {
		status.put(0,"Not assign");
		status.put(1, "Assigned");
		status.put(2, "In progress");
		status.put(3, "Completed");
		status.put(4, "Failed complete");
	}

	public Map<Integer, String> getStatus() {
		return status;
	}

	public void setStatus(Map<Integer, String> status) {
		this.status = status;
	}
	
	
}
