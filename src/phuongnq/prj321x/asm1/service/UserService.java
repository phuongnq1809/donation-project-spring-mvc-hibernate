package phuongnq.prj321x.asm1.service;

import java.util.List;

import phuongnq.prj321x.asm1.entity.User;

public interface UserService {

	public User findUser(String uname, String upass);

	public List<User> getUsers();

	public User getUser(int theId);
	
	public User getUser(String username);

	public void saveUser(User theUser);

	public void deleteUser(int theId);

	public void changeUserStatus(int theId);

	public void updateUser(User theUser);

}
