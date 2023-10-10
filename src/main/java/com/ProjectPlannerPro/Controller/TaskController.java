package com.ProjectPlannerPro.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ProjectPlannerPro.Helper;
import com.ProjectPlannerPro.Repository.ProjectRepo;
import com.ProjectPlannerPro.Repository.TaskRepo;
import com.ProjectPlannerPro.Repository.UserRepo;
import com.ProjectPlannerPro.entity.Project;
import com.ProjectPlannerPro.entity.Task;
import com.ProjectPlannerPro.entity.User;

@Controller
@RequestMapping("/projectPlanningPro")
public class TaskController {
	
	@Autowired
	private TaskRepo taskRepo;
	
	@Autowired
	private ProjectRepo projectRepo;
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private Helper helper;
	
	
	@RequestMapping("/project/addTaskPage/{id}")
	public String addTaskPage(@PathVariable("id") int id, Model model) {
		
		try {
			System.out.println(id+"project id");
			List<User> users=userRepo.findAll();
			model.addAttribute("users", users);
			model.addAttribute("Project", projectRepo.findById(id));
			return "AddTaskPage";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			Project p=projectRepo.findById(id);
			model.addAttribute("Project", p);
			return "ProjectDeshboard";
		}
		
	}
	
	
	@PostMapping("/project/addTask/{pId}")
	public String AddTaskFunction(@PathVariable("pId") int pId,
			@ModelAttribute Task task, @RequestParam(value="userId", defaultValue = "0") int uId,
			RedirectAttributes redirectAttributes, Model model) {
		try {
			task.setProject(projectRepo.findById(pId));
			
			if(uId==0)task.setStatus(0);
			else { task.setStatus(1);
			task.setUser(userRepo.findById(uId));
			}
			taskRepo.save(task);
			List<User> users=userRepo.findAll();
			model.addAttribute("users", users);
			Project p=projectRepo.findById(pId);
			model.addAttribute("Project",p);
			model.addAttribute("succcessMsg", "Task added successfully");
			return "AddTaskPage";
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			Project p=projectRepo.findById(pId);
			model.addAttribute("Project", p);
			model.addAttribute("errorMsg", "Something went wrong");
			return "ProjectDeshboard";
			
		}
	}
	
	
	@RequestMapping("/project/AllTasks/{pId}")
	public String ViewTask(Model model, @PathVariable("pId") int pId) {
		try {
			
			Project project=projectRepo.findById(pId);
			model.addAttribute("Project", project);
			List<Task> tasks=taskRepo.findByProject(project);
			model.addAttribute("tasks", tasks);
			model.addAttribute("status", helper.getStatus());
			return "ViewTask";
		} catch (Exception e) {
			// TODO: handle exception
			
			System.out.println(e.getLocalizedMessage());
			Project p=projectRepo.findById(pId);
			model.addAttribute("Project", p);
			return "ProjectDeshboard";
		}
	}
	
	
	@RequestMapping("/project/AllTasks/{pId}/updateStatus/{tId}")
	public String updateStatus(@PathVariable("tId") int tId ,@PathVariable("pId") int pId,
			@RequestParam("status") int status,
			Model model) {
		
		try {
			
			Task task=taskRepo.findById(tId);
			task.setStatus(status);
			Project project =projectRepo.findById(pId);
			taskRepo.save(task);
			
			model.addAttribute("Project", project);
			List<Task> tasks=taskRepo.findByProject(project);
			model.addAttribute("tasks", tasks);
			model.addAttribute("status", helper.getStatus());
			return "ViewTask";
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			Project p=projectRepo.findById(pId);
			model.addAttribute("Project", p);
			return "ProjectDeshboard";
		}
	}
	
	
	@PostMapping("/project/AllTasks/{pId}/UpdateMember/{tId}")
	public String AssignMember(@PathVariable("tId") int tId ,@PathVariable("pId") int pId,
			@RequestParam("member") int memberId,
			Model model) {
	try {
		if(memberId!=-1) {
			User member=userRepo.findById(memberId);
			Task task=taskRepo.findById(tId);
			task.setUser(member);
			taskRepo.save(task);
			
		}
		
		Project project =projectRepo.findById(pId);
		
		model.addAttribute("Project", project);
		List<Task> tasks=taskRepo.findByProject(project);
		model.addAttribute("tasks", tasks);
		model.addAttribute("status", helper.getStatus());
		return "ViewTask";
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getLocalizedMessage());
		Project p=projectRepo.findById(pId);
		model.addAttribute("Project", p);
		return "ProjectDeshboard";
	}
		
		
	}
	
	@RequestMapping("/project/{pId}/delete-task/{tId}")
	public String deleteTask(@PathVariable("tId") int tId ,@PathVariable("pId") int pId, Model model) {
		try {
			taskRepo.deleteById(tId);
			
			Project project=projectRepo.findById(pId);
			model.addAttribute("Project", project);
			List<Task> tasks=taskRepo.findByProject(project);
			model.addAttribute("tasks", tasks);
			model.addAttribute("status", helper.getStatus());
			return "ViewTask";
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			Project p=projectRepo.findById(pId);
			model.addAttribute("Project", p);
			return "ProjectDeshboard";
		}
	}
	
	
	
	@RequestMapping("/project/addMemberPage/{pId}")
	public String AddMemberPage(Model model, @PathVariable("pId") int pId) {
		model.addAttribute("title", "Add Member");
		List<User> members=userRepo.findByUserType(0);
		model.addAttribute("members", members);
		Project project=projectRepo.findById(pId);
		model.addAttribute("Project", project);
		
		return "AddMemberPage";
	}

	
	@RequestMapping("/project/addMemberPage/searchMember/{pId}")
	public String SearchMember(Model model, @PathVariable("pId") int pId, 
			@RequestParam("uId") int uId, @RequestParam("name") String name) {
		try {
			List<User> members=new ArrayList<User>();
			if(uId!=0 && name!="") {
				User user=userRepo.findById(uId);
				if(user.getName().equals(name))members.add(user);
				else model.addAttribute("errorMsg", "incorect credentials");
			}
			else if(uId==0 && name!="") {
				members=userRepo.findByName( name);
			}
			else if(name=="" && uId!=0) {
				User user=userRepo.findById( uId);
				members.add(user);
			}else {
				members=userRepo.findByUserType(0);
			}
			
			if(members.size()==0) {
				members=userRepo.findByUserType(0);
			}
			model.addAttribute("title", "Add Member");
			model.addAttribute("members", members);
			Project project=projectRepo.findById(pId);
			model.addAttribute("Project", project);
			
			return "AddMemberPage";
			
			
		} catch (Exception e) {
			try {
				model.addAttribute("title", "Add Member");
				List<User> members=userRepo.findByUserType(0);
				model.addAttribute("members", members);
				Project project=projectRepo.findById(pId);
				model.addAttribute("Project", project);
				
				return "AddMemberPage";
			} catch (Exception e2) {
				// TODO: handle exception
				System.out.println(e.getLocalizedMessage());
				Project p=projectRepo.findById(pId);
				model.addAttribute("Project", p);
				return "ProjectDeshboard";
			}
		}
	}
	
	
	@PostMapping("/project/addMemberPage/addMember/{pId}")
	public String AddMember(@PathVariable("pId") int pId,@RequestParam("member") int mId,
			Model model) {
		try {
			User m=userRepo.findById(mId);
			
			Project project=projectRepo.findById(pId);
			
			if(project.getMember()==null) {
				List <User> list=new ArrayList<User>();
				list.add(m);
			}
			else {
				List<User> list=project.getMember();
				list.add(m);
				project.setMember(list);
			}
			
			projectRepo.save(project);
			
			model.addAttribute("title", "Add Member");
			List<User> members=userRepo.findByUserType(0);
			model.addAttribute("members", members);
			model.addAttribute("Project", project);
			model.addAttribute("successMsg", "Member added successfully into the project");
			return "AddMemberPage";
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			model.addAttribute("title", "Add Member");
			List<User> members=userRepo.findByUserType(0);
			model.addAttribute("members", members);
			Project project=projectRepo.findById(pId);
			model.addAttribute("Project", project);
			model.addAttribute("errorMsg", "Something went wrong");
			return "AddMemberPage";

		}
	}
	
	
	
	
	@RequestMapping("/project/viewMembers/{pId}")
	public String ViewMembersPage(Model model, @PathVariable("pId") int pId) {
		try {
			Project project=projectRepo.findById(pId);
			List<User> members=project.getMember();
			model.addAttribute("members", members);
			model.addAttribute("Project", project);
			model.addAttribute("status", helper.getStatus());
			return "ViewMembers";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			Project p=projectRepo.findById(pId);
			model.addAttribute("Project", p);
			return "ProjectDeshboard";
		}
	}
	
	/*
	@RequestMapping("/project/${pId}/delete-member/{mId}")
	public String deleteMember(@PathVariable("mId") int mId ,@PathVariable("pId") int pId,
			Model model) {
		try {
			Project p=projectRepo.findById(pId);
			List<User> memberList=p.getMember();
			User u=userRepo.findById(mId);
			for(int i=0;i<memberList.size();i++) {
				if(memberList.get(i)==u) {
					memberList.remove(i);
					break;
				}
			}
			
			List<User> members=p.getMember();
			model.addAttribute("members", members);
			model.addAttribute("Project", p);
			model.addAttribute("status", helper.getStatus());
			return "ViewMembers";
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			Project p=projectRepo.findById(pId);
			model.addAttribute("Project", p);
			return "ProjectDeshboard";
		}
	}
		*/
	
}
