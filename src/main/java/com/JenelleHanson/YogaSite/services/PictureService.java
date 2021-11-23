package com.JenelleHanson.YogaSite.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JenelleHanson.YogaSite.models.Picture;
import com.JenelleHanson.YogaSite.repositories.PictureRepository;

@Service
public class PictureService {
	@Autowired 
	private PictureRepository picRepo;
	
	public List<Picture> allPictures(){
		return this.picRepo.findAll();
	}
	
	public Picture findPicture(Long id) {
		return this.picRepo.findById(id).orElse(null);
	}
	
	public Picture createPicture(Picture picture) {
		return picRepo.save(picture);
	}
	
	public Picture updatePicture(Picture picture) {
		return picRepo.save(picture);
	}
	
	public void deletePicture(Long id) {
		this.picRepo.deleteById(id);
	}
}
