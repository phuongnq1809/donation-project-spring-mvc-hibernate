package phuongnq.prj321x.asm1.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import phuongnq.prj321x.asm1.entity.Donation;
import phuongnq.prj321x.asm1.entity.UserDonation;

@Repository
public class UserDonationDAOImpl implements UserDonationDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveUserDonation(UserDonation theUserDonation) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// save the user-donation
		currentSession.saveOrUpdate(theUserDonation);
		
	}

	@Override
	public List<UserDonation> getUserDonations(int theDonationId) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query..
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation where donationId=:theDonationId order by id desc", UserDonation.class);
		theQuery.setParameter("theDonationId", theDonationId);
		
		// execute query and get result list
		List<UserDonation> userDonations = theQuery.getResultList();
		
		// return the results
		return userDonations;
	}

	@Override
	public UserDonation getUserDonation(int theUserDonationId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		UserDonation theUserDonation = currentSession.get(UserDonation.class, theUserDonationId);
		
		return theUserDonation;
	}

	@Override
	public List<UserDonation> getUserDonationsConfirmed(int theDonationId) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query..
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation where status=1 and donationId=:theDonationId order by id desc", UserDonation.class);
		theQuery.setParameter("theDonationId", theDonationId);
		
		// execute query and get result list
		List<UserDonation> userDonations = theQuery.getResultList();
		
		// return the results
		return userDonations;
	}
	
}
