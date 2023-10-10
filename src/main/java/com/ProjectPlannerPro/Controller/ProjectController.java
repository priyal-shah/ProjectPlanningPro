package com.ProjectPlannerPro.Controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ProjectPlannerPro.Repository.ProjectRepo;
import com.ProjectPlannerPro.Repository.UserRepo;
import com.ProjectPlannerPro.entity.Project;
import com.ProjectPlannerPro.entity.Task;
import com.ProjectPlannerPro.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/projectPlanningPro")
public class ProjectController {

	@Autowired
	private ProjectRepo projectRepo;
	
	@Autowired
	private UserRepo userRepo;
	

	@PostMapping("addProject")
	public String AddProject(RedirectAttributes redirectAttributes, @ModelAttribute Project project,
			HttpServletRequest req) {
		try {
			HttpSession s=req.getSession(false);
			if(s==null || s.getAttribute("loginedUser")==null) {
				redirectAttributes.addFlashAttribute("errorMsg", "Please Login First");
				return "redirect:loginPage";
			}
			project.setUser((User)s.getAttribute("loginedUser"));
			project.setDate_created(new Date());
			projectRepo.save(project);
			redirectAttributes.addFlashAttribute("successMsg", "Project added successfully");
			return "redirect:addProjectPage";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			redirectAttributes.addFlashAttribute("errorMsg", "Somthing went wrong");
			return "redirect:addProjectPage";
		}
	}

	@RequestMapping("/viewProjects")
	public String GetAllProjects(Model model, HttpServletRequest req) {
		
		try {
			System.out.println("startes");
			HttpSession s = req.getSession(false);
			if (s == null || s.getAttribute("loginedUser") == null) {
				model.addAttribute("errorMsg", "Please Login First");
				return "redirect:loginPage";
			}

			User user = (User) s.getAttribute("loginedUser");
			List<Project> projects = projectRepo.findByUser(user);
			System.out.println(projects);
			model.addAttribute("projects", projects);
			return "ViewProjects";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return "redirect:home";
		}
		

	}

	
	@RequestMapping("/project/{pId}")
	public String Project(@PathVariable("pId") int pId, Model model) {
		Project p=projectRepo.findById(pId);
		model.addAttribute("Project", p);
		return "ProjectDeshboard";
	}
	
	
	
	
	
	@RequestMapping("/deleteProject/{id}")
	public String deleteProject(@PathVariable("id") int pid, RedirectAttributes redirectAttributes, HttpServletRequest req) {
		HttpSession s=req.getSession(false);
		if(s==null || s.getAttribute("loginedUser")==null) {
			redirectAttributes.addFlashAttribute("errorMsg", "Please login First");
			return "redirect:"+req.getContextPath()+"viewProjects";
		}
		
		try {
			projectRepo.deleteById(pid);
			redirectAttributes.addFlashAttribute("successMsg", "Project deleted successfulyy");
			return "redirect:"+req.getContextPath()+"viewProjects";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			redirectAttributes.addFlashAttribute("errorMsg", "Someting went wrong");
			return "redirect:"+req.getContextPath()+"viewProjects";
		}
	}
}
