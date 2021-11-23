package com.JenelleHanson.YogaSite.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.JenelleHanson.YogaSite.models.Video;

@Repository
public interface VideoRepository extends CrudRepository<Video, Long> {
	List<Video> findAll();
	List<Video> findTop10ByOrderByUsersWhoFavedDesc();
	List<Video> findByVideoTitleContaining(String videoTitle);
}
