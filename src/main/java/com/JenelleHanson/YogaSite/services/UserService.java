package com.JenelleHanson.YogaSite.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JenelleHanson.YogaSite.models.Comment;
import com.JenelleHanson.YogaSite.models.User;
import com.JenelleHanson.YogaSite.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository uRepo;
	
	public List<User> allUsers(){
		return this.uRepo.findAll();
	}
	
	public User findUser(Long id) {
		User user = this.uRepo.findById(id).orElse(null);
		return user;
	}
	
	public User updateUser(User user) {
		String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hash);
		return uRepo.save(user);
	}
	
	public User userComment(User user, Comment comment) {
		List<Comment> userComments = user.getComments();
		userComments.add(comment);
		return this.uRepo.save(user);
	}
	
	public void deleteUser(Long id) {
		this.uRepo.deleteById(id);
	}
	
	public User registerUser(User user) {
		String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hash);
		return this.uRepo.save(user);
	}
	
	public boolean authenticateUser(String email, String password) {
		User user = this.uRepo.findByEmail(email);
		if(user==null) {
			return false;
		}
		return BCrypt.checkpw(password, user.getPassword());
	}
	
	public User getByEmail(String email) {
		return this.uRepo.findByEmail(email);
	}
}
