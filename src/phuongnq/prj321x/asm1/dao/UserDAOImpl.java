package phuongnq.prj321x.asm1.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import phuongnq.prj321x.asm1.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User findUser(String uname, String upass) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<User> theQuery = currentSession.createQuery("from User where username=:userName and password=:userPass and status=1");
		theQuery.setParameter("userName", uname);
		theQuery.setParameter("userPass", upass);
		
		List<User> users = theQuery.getResultList();
		
		if(!users.isEmpty()) {
			return users.get(0);
		} else {
			return null;
		}

	}

	@Override
	public List<User> getUsers() {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query...sorted by last name
		Query<User> theQuery = currentSession.createQuery("from User order by id desc", User.class);
		
		// execute query and get result list
		List<User> users = theQuery.getResultList();
		
		// return the results
		return users;
	}

	@Override
	public User getUser(int theId) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		User theUser = currentSession.get(User.class, theId);
		
		return theUser;
	}
	
	@Override
	public User getUser(String username) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<User> theQuery = currentSession.createQuery("from User where username=:userName");
		theQuery.setParameter("userName", username);
		
		List<User> users = theQuery.getResultList();
		
		if(!users.isEmpty()) {
			return users.get(0);
		} else {
			return null;
		}
		
	}

	@Override
	public void saveUser(User theUser) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/update the user
		//currentSession.saveOrUpdate(theUser);
		currentSession.save(theUser);
		
	}

	@Override
	public void deleteUser(int theId) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delte object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from User where id=:userId");
		theQuery.setParameter("userId", theId);
		
		theQuery.executeUpdate();
		
	}

	@Override
	public void changeUserStatus(int theId) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// lay ve user voi id
		User userFound = getUser(theId);
		
		// lay ve gia tri status hien tai cua user
		int currentStatus = userFound.getStatus();
		
		Query theQuery = 
				currentSession.createQuery("update User set status=:userStatus where id=:userId");
		
		theQuery.setParameter("userId", theId);
		
		if(currentStatus == 1) {
			
			theQuery.setParameter("userStatus", 0);
			
		} else {
			
			theQuery.setParameter("userStatus", 1);
			
		}
		
		theQuery.executeUpdate();
		
	}

	@Override
	public void updateUser(User theUser) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.update(theUser);
		
	}

}
