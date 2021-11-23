package com.JenelleHanson.YogaSite.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.JenelleHanson.YogaSite.models.User;
import com.JenelleHanson.YogaSite.repositories.UserRepository;

@Component
public class UserValidator {
		@Autowired
		private UserRepository uRepo;
		
		public boolean supports(Class<?> clazz) {
			return User.class.equals(clazz);
		}
		
		public void validate(Object target, Errors errors) {
			User user = (User)target;
			
			if(!user.getPassword().equals(user.getPasswordConfirm())) {
				errors.rejectValue("password", "Match", "Password do not match!!! Warning!!!!");
			}
			
			if(this.uRepo.existsByEmail(user.getEmail())) {
				errors.rejectValue("email",  "Match", "Email previously registered!");
			}
		}

}
