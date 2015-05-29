package com.communityblogproject;

import java.io.File;

public class User {
	String UserName,UserEmail,UserPassword,UserDOB,UserBio,UserReputation,UserRole;
	File UserProfilePicture;
	User(){
		
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserEmail() {
		return UserEmail;
	}
	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}
	public String getUserPassword() {
		return UserPassword;
	}
	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}
	public String getUserDOB() {
		return UserDOB;
	}
	public void setUserDOB(String userDOB) {
		UserDOB = userDOB;
	}
	public String getUserBio() {
		return UserBio;
	}
	public void setUserBio(String userBio) {
		UserBio = userBio;
	}
	public String getUserReputation() {
		return UserReputation;
	}
	public void setUserReputation(String userReputation) {
		UserReputation = userReputation;
	}
	public String getUserRole() {
		return UserRole;
	}
	public void setUserRole(String userRole) {
		UserRole = userRole;
	}
	public File getUserProfilePicture() {
		return UserProfilePicture;
	}
	public void setUserProfilePicture(File userProfilePicture) {
		UserProfilePicture = userProfilePicture;
	}
	
}
