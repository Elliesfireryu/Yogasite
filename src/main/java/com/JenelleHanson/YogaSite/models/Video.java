package com.JenelleHanson.YogaSite.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="videos")
public class Video {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String videoTitle;
	private String videoLink;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	public Video() {
	}

	@PrePersist
	protected void onCreate() {
	        this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {//if Post Persist doesn't work add PreUpdate
	        this.updatedAt = new Date();
	}
	
	
//	many to many
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name ="favorites",
		joinColumns = @JoinColumn(name="video_id"),
		inverseJoinColumns = @JoinColumn(name="user_id")
	)
	private List<User> usersWhoFaved;
	
	
	@OneToMany(mappedBy="video", fetch = FetchType.LAZY)
	@JsonIgnore
	private List<Comment> comments;
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getVideoLink() {
		return videoLink;
	}
	
	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}
	
	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<User> getUsersWhoFaved() {
		return usersWhoFaved;
	}
	
	public void setUsersWhoFaved(List<User> usersWhoFaved) {
		this.usersWhoFaved = usersWhoFaved;
	}
}
