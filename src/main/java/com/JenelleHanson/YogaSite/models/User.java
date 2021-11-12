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
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Please enter your name!")
	@Size(min=2, max=50, message="Please keep your first name between 2 and 50 characters!")
	private String name;
	
	private String profilePic;
	
	@Email
	@NotBlank
	private String email;
	@Size(min=6)
	private String password;
	@Transient
	private String passwordConfirm;
	
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@PrePersist
	protected void onCreate() {
	        this.createdAt = new Date();
	}
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	@PreUpdate
	protected void onUpdate() {
	        this.updatedAt = new Date();
	}
		
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	@JsonIgnore
	private List<Comment> comments;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name ="favorites",
		joinColumns = @JoinColumn(name="user_id"),
		inverseJoinColumns = @JoinColumn(name="video_id")
	)
	private List<Video> favVideos;
	
	
	public User() {
	}

	


	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	public String getProfilePic() {
		return profilePic;
	}


	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}


	public List<Video> getFavVideos() {
		return favVideos;
	}


	public void setFavVideos(List<Video> favVideos) {
		this.favVideos = favVideos;
	}


	public List<Comment> getComments() {
		return comments;
	}


	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
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
}
