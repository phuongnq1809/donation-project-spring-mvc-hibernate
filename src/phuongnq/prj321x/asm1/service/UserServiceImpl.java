package phuongnq.prj321x.asm1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import phuongnq.prj321x.asm1.dao.UserDAO;
import phuongnq.prj321x.asm1.entity.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	@Override
	@Transactional
	public User findUser(String uname, String upass) {
		return userDAO.findUser(uname,upass);
	}

	@Override
	@Transactional
	public List<User> getUsers() {
		return userDAO.getUsers();
	}

	@Override
	@Transactional
	public User getUser(int theId) {
		return userDAO.getUser(theId);
	}
	
	@Override
	@Transactional
	public User getUser(String username) {
		return userDAO.getUser(username);
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {
		userDAO.saveUser(theUser);
	}

	@Override
	@Transactional
	public void deleteUser(int theId) {
		userDAO.deleteUser(theId);
	}

	@Override
	@Transactional
	public void changeUserStatus(int theId) {
		userDAO.changeUserStatus(theId);		
	}

	@Override
	@Transactional
	public void updateUser(User theUser) {
		userDAO.updateUser(theUser);
	}

	

}
