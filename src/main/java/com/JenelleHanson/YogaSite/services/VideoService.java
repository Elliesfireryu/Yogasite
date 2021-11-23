package com.JenelleHanson.YogaSite.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JenelleHanson.YogaSite.models.Comment;
import com.JenelleHanson.YogaSite.models.User;
import com.JenelleHanson.YogaSite.models.Video;
import com.JenelleHanson.YogaSite.repositories.VideoRepository;

@Service
public class VideoService {
	@Autowired 
	private VideoRepository videoRepo;

    public List<Video> getListOfFiles(){
        return videoRepo.findAll();
    }
	
	public List<Video> allVideos(){
		return this.videoRepo.findAll();
	}
	
	public List<Video> findTopVideos() {
		return this.videoRepo.findTop10ByOrderByUsersWhoFavedDesc();
	}
	
	public List<Video> searchVideoTitle(String videoTitle){
		return this.videoRepo.findByVideoTitleContaining(videoTitle);		
	}
	
	public void favVideo(User user, Video video) {
		List<User> userWhoFaved = video.getUsersWhoFaved();
		userWhoFaved.add(user);
		this.videoRepo.save(video);
	}
	
	public void unFavVideo(User user, Video video) {
		List<User> userWhoFaved = video.getUsersWhoFaved();
		userWhoFaved.remove(user);
		this.videoRepo.save(video);
	}
	
	public void vidComment(Video video, Comment comment) {
		List<Comment> videoComments = video.getComments();
		videoComments.add(comment);
		this.videoRepo.save(video);
	}
	
	public Video findVideo(Long id) {
		return this.videoRepo.findById(id).orElse(null);
	}
	
	public Video createVideo(Video video) {
		return videoRepo.save(video);
	}
	
	public Video updateVideo(Video video) {
		return videoRepo.save(video);
	}
	
	public void deleteVideo(Long id) {
		this.videoRepo.deleteById(id);
	}
}
