package com.JenelleHanson.YogaSite.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.JenelleHanson.YogaSite.models.User;
import com.JenelleHanson.YogaSite.services.UserService;
import com.JenelleHanson.YogaSite.validators.UserValidator;

@Controller
public class HomeController {
	@Autowired
	private UserService uServ;
	@Autowired
	private UserValidator validator;
	
	@GetMapping("/login")
	public String login(@ModelAttribute("user") User user) {
		return "index.jsp";
	}
	
	@PostMapping("/login")
	public String loginChk(@RequestParam("lemail") String email, @RequestParam("lpassword") String password, RedirectAttributes redirectAttr, HttpSession session) {
		if(!this.uServ.authenticateUser(email, password)) {
			redirectAttr.addFlashAttribute("loginError", "Invalid Credentials");
			return "redirect:/login";
		}
		User user = this.uServ.getByEmail(email);
		session.setAttribute("user__id", user.getId());
		return "redirect:/main";//change to page after login
	}
	
	@GetMapping("/updateUser/{id}")
	public String userEdit(@PathVariable("id") Long id, @ModelAttribute("user") User user, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("user", this.uServ.findUser(id));
			return "userEdit.jsp";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/updateUser/{id}")
	public String updatePic(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
				return "/userEdit.jsp";
			} else {
				this.uServ.updateUser(user);
				return "redirect:/userShow/{id}";
			}
	}
	
	@GetMapping("/register")
	public String register(@ModelAttribute("user") User user) {
		return "dashboard.jsp";
	}
	
	@PostMapping("/register")
	public String registerChk(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		validator.validate(user, result);
		if(result.hasErrors()) {
			return "dashboard.jsp";
		}
		User newUser = this.uServ.registerUser(user);
		session.setAttribute("user__id", newUser.getId());
		return "redirect:/main";//change to next page after login
	}
	
	@GetMapping("/userShow/{id}")
	public String userShow(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("user", this.uServ.findUser(id));
			return "userShow.jsp";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/destroyUser/{id}")
	public String destroy(@PathVariable("id") Long id) {
		this.uServ.deleteUser(id);
		return "redirect:/logout";
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
}
