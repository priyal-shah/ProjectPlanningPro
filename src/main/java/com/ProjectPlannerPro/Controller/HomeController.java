package com.ProjectPlannerPro.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/projectPlanningPro")
public class HomeController {

	@RequestMapping("/home")
	public String home(Model model) {
		model.addAttribute("title", "Home");
		return "Home";
	}
	
	@RequestMapping("/registerPage")
	public String RegisterPage(Model model) {
		model.addAttribute("title", "Sign Up");
		return "SignUp";
	}
	
	@RequestMapping("/loginPage")
	public String LoginPage(Model model) {
		return "Login";
	}
	
	@RequestMapping("/addProjectPage")
	public String AddProjectPage(Model model) {
		model.addAttribute("title", "Add Project");
		return "AddProjectPage";
	}
	
	
}
