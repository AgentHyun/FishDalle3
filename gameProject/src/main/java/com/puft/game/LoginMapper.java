package com.puft.game;

import java.util.List;

public interface LoginMapper {

	
	 public abstract List<Login> searchUser(Login l);

	 public abstract List<Login> getMemberById(Login l);
	 public abstract int signUp(Login l);
	
	
}
