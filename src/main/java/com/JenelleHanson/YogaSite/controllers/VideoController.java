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
import org.springframework.web.bind.annotation.RequestParam;

import com.JenelleHanson.YogaSite.models.User;
import com.JenelleHanson.YogaSite.models.Video;
import com.JenelleHanson.YogaSite.services.UserService;
import com.JenelleHanson.YogaSite.services.VideoService;

@Controller
public class VideoController {
	@Autowired
	private VideoService vidServ;
	@Autowired
	private UserService userServ;
	
	@GetMapping("/main")
	public String index(@ModelAttribute("video") Video video, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("user", this.userServ.findUser(userId));
			model.addAttribute("allVideos", vidServ.allVideos());
			return "main.jsp";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/videos/{id}")
	public String vidDash(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) { 
			model.addAttribute("user", this.userServ.findUser(userId));
			model.addAttribute("video", this.vidServ.findVideo(id));
			return "videoDash.jsp";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/videos/{id}")
	public String updateVideo(@Valid @ModelAttribute("video") Video video, BindingResult result, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			if(result.hasErrors()) {
				return "/videoDash.jsp";
			} else {
				this.vidServ.updateVideo(video);
				return "redirect:/main";
			}
		} else {
			return "redirect:/login";
		}
	}

	
	@GetMapping("/videos/{id}/like")
	public String vidLikes(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("video", this.vidServ.findVideo(id));
			List<User> userLikeList = this.vidServ.findVideo(id).getUsersWhoFaved();
			User userToFavVideo = this.userServ.findUser(userId);
			Video videoToFav = this.vidServ.findVideo(id);
			if(userLikeList.contains(userToFavVideo)) {
				return "redirect:/videos/{id}";
			} else {
				this.vidServ.favVideo(userToFavVideo,videoToFav);
				System.out.println(userLikeList.size());
				return "redirect:/videos/{id}";
			}
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/videos/{id}/unlike")
	public String vidUnlikes(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("video", this.vidServ.findVideo(id));
			List<User> userLikeList = this.vidServ.findVideo(id).getUsersWhoFaved();
			User userToUnFavVideo = this.userServ.findUser(userId);
			Video videoToUnFav = this.vidServ.findVideo(id);
			if(userLikeList.contains(userToUnFavVideo)) {
				this.vidServ.unFavVideo(userToUnFavVideo,videoToUnFav);
				System.out.println(userLikeList.size());
				return "redirect:/videos/{id}";
			} else {
				return "redirect:/videos/{id}";
			}
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/search")
	public String search(@RequestParam("video") String videoTitle, Model model, HttpSession session) {//If you need to search anything it is a request parameter
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("user", this.userServ.findUser(userId));
			model.addAttribute("allVideosByVideoTitle", this.vidServ.searchVideoTitle(videoTitle));
			model.addAttribute("video", videoTitle);// you need both the videos and the title
		return "search.jsp";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/topTen")
	public String topTen(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user__id");
		if(userId != null) {
			model.addAttribute("user", this.userServ.findUser(userId));
			model.addAttribute("allVideos", vidServ.findTopVideos());
		return "topTen.jsp";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		this.vidServ.deleteVideo(id);
		return "redirect:/main";
	}
}
