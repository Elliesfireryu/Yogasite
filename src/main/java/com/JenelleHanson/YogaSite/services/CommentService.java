package com.JenelleHanson.YogaSite.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JenelleHanson.YogaSite.models.Comment;
import com.JenelleHanson.YogaSite.repositories.CommentRepository;

@Service
public class CommentService {
	@Autowired 
	private CommentRepository cRepo;
	
	public List<Comment> allComments(){
		return this.cRepo.findAll();
	}
		
	public Comment findComment(Long id) {
		return this.cRepo.findById(id).orElse(null);
	}
	
	public Comment createComment(Comment comment) {
		return cRepo.save(comment);
	}
	
	public Comment updateComment(Comment comment) {
		return cRepo.save(comment);
	}
	
	public void deleteComment(Long id) {
		this.cRepo.deleteById(id);
	}
}
