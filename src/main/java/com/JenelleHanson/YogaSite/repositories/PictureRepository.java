package com.JenelleHanson.YogaSite.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.JenelleHanson.YogaSite.models.Picture;

@Repository
public interface PictureRepository extends CrudRepository<Picture, Long>{
	List<Picture> findAll();
//	List<Picture> findAllByClient();
}
