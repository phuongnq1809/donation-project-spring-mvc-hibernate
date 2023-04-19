package phuongnq.prj321x.asm1.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import phuongnq.prj321x.asm1.entity.Role;

@Repository
public class RoleDAOImpl implements RoleDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Role getRole(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Role theRole = currentSession.get(Role.class, theId);
			
		return theRole;
}

	@Override
	public List<Role> getRoles() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query...
		Query<Role> theQuery = currentSession.createQuery("from Role", Role.class);
		
		// execute query and get result list
		List<Role> roles = theQuery.getResultList();
		
		// return the results
		return roles;
	}

}
