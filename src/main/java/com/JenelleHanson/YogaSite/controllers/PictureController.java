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

import com.JenelleHanson.YogaSite.models.Picture;
import com.JenelleHanson.YogaSite.services.PictureService;
import com.JenelleHanson.YogaSite.services.UserService;

@Controller
public class PictureController {
	@Autowired
	private PictureService picServ;
	@Autowired
	private UserService uServ;
	
	@GetMapping("/pictures")
	public String index(@ModelAttribute("picture") Picture picture, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("user", this.uServ.findUser(userId));
			model.addAttribute("allPictures", picServ.allPictures());
			return "picDashEdit.jsp";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/pictures/{id}")
	public String picPage(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("user", this.uServ.findUser(userId));
			model.addAttribute("picture", this.picServ.findPicture(id));
			System.out.println(this.picServ.findPicture(id).getProgressPic());
			return "editOnePic.jsp";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/pictures/{id}")
	public String OnePic(@Valid @ModelAttribute("picture") Picture picture, BindingResult result) {
			if(result.hasErrors()) {
				return "/editOnePic.jsp";
			} else {
				this.picServ.updatePicture(picture);
				return "redirect:/pictures";
			}
	}
	
	@GetMapping("/update/{id}")
	public String picUpdate(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("picture", this.picServ.findPicture(id));
			System.out.println(this.picServ.findPicture(id).getProgressPic());
			return "edit.jsp";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/update/{id}")
	public String updatePic(@Valid @ModelAttribute("picture") Picture picture, BindingResult result) {
			if(result.hasErrors()) {
				return "/edit.jsp";
			} else {
				this.picServ.updatePicture(picture);
				return "redirect:/pictures";
			}
	}
	
	@GetMapping("/destroy/{id}")
	public String destroy(@PathVariable("id") Long id) {
		this.picServ.deletePicture(id);
		return "redirect:/pictures";
	}
}
