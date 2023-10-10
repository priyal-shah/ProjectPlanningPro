package com.ProjectPlannerPro.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ProjectPlannerPro.Repository.UserRepo;
import com.ProjectPlannerPro.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/projectPlanningPro")
public class UserController {
	
	@Autowired
	private UserRepo userRepo;
	
	@PostMapping("users")
	public String Register(RedirectAttributes redirectAttribute,
			@ModelAttribute User user , @RequestParam(value="agreement", defaultValue = "false" ) boolean agreement) {
		
		try {
			
			userRepo.save(user);
			redirectAttribute.addFlashAttribute("successMsg", "Registered Successfully");
			return "redirect:home";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			redirectAttribute.addFlashAttribute("errorMsg", "Something went wrong");
			return "redirect:home";
		}
	}
	
	@RequestMapping("/login")
	public String Login(RedirectAttributes redirectAttributes, @RequestParam("email") String email, 
			@RequestParam("password") String password, HttpServletRequest req) {
		try {
			User user=userRepo.findByEmailAndPassword(email, password);
			if(user!=null) {
				HttpSession s=req.getSession();
				s.setAttribute("loginedUser", user);
				return "redirect:home";
			}
			
			else {
				redirectAttributes.addFlashAttribute("errorMsg", "wrong user id or password");
				return "redirect:loginPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			redirectAttributes.addFlashAttribute("errorMsg", "Something went wrong");
			return "redirect:loginPage";
		}
	}
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		try {
			HttpSession s=req.getSession(false);
			s.removeAttribute("loginedUser");
			return "redirect:home";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return "redirect:home";
		}
	}
}
