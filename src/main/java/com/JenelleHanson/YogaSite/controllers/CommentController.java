package com.JenelleHanson.YogaSite.controllers;

import java.util.List;

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

import com.JenelleHanson.YogaSite.models.Comment;
import com.JenelleHanson.YogaSite.models.User;
import com.JenelleHanson.YogaSite.services.CommentService;
import com.JenelleHanson.YogaSite.services.UserService;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentServ;
	@Autowired
	private UserService uServ;
	
	@GetMapping("/videos/{id}/comments")
	public String vidComments(@ModelAttribute("comment") Comment comment, @PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("user", this.uServ.findUser(userId));
			model.addAttribute("allComments", commentServ.allComments());
			User userToComment = this.uServ.findUser(userId);
			Comment makeComment = this.commentServ.createComment(comment);
			this.uServ.userComment(userToComment, makeComment);
			model.addAttribute("allComments", commentServ.allComments());
			return "redirect:/videos/{id}";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/videos/{id}/comments")
	public String makeComment(@Valid @ModelAttribute("comment") Comment comment, Model model, BindingResult result, HttpSession session) {
		model.addAttribute("allComments", commentServ.allComments());
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			if(result.hasErrors()) {
				return "/videoDash.jsp";
			} else {
				this.commentServ.updateComment(comment);
				return "redirect:/main";
			}
		} else {
			return "redirect:/login";
		}
//		return "redirect:/videos/{id}";
	}	

}
