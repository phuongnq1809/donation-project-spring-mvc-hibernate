package phuongnq.prj321x.asm1.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import phuongnq.prj321x.asm1.entity.Donation;

@Repository
public class DonationDAOImpl implements DonationDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Donation> getDonations() {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query..
		Query<Donation> theQuery = currentSession.createQuery("from Donation where visible=1 order by id desc", Donation.class);
		
		// execute query and get result list
		List<Donation> donations = theQuery.getResultList();
		
		// return the results
		return donations;
	}

	@Override
	public Donation getDonation(int theId) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Donation theDonation = currentSession.get(Donation.class, theId);
		
		return theDonation;
	}

	@Override
	public void saveDonation(Donation donation) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/update the donation
		currentSession.saveOrUpdate(donation);
		
	}

	@Override
	public void deleteDonation(int theId) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delte object with primary key
		Query theQuery = 
				currentSession.createQuery("update Donation set visible=0 where id=:donationId");
		theQuery.setParameter("donationId", theId);
		
		theQuery.executeUpdate();
		
	}
	
	// thay doi trang thai dot quyen gop
	@Override
	public void changeDonationStatus(int theId, int updateStatus) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delte object with primary key
		Query theQuery = 
				currentSession.createQuery("update Donation set status=:updateStatus where id=:donationId");
		theQuery.setParameter("updateStatus", updateStatus);
		theQuery.setParameter("donationId", theId);
		
		theQuery.executeUpdate();

	}
	
	// Cap nhat dot quyen gop
	@Override
	public void updateDonation(String theCode, String theName, String theStartDate, String theEndDate,
			String theOrganization, String thePhone, String theDescription, int theId) {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// update object
		Query theQuery = 
				currentSession.createQuery("update Donation set "
						+ "code=:donationCode, "
						+ "name=:donationName, "
						+ "startDate=:donationStartDate, "
						+ "endDate=:donationEndDate, "
						+ "organizationName=:donationOrganization, "
						+ "phoneNumber=:donationPhone, "
						+ "description=:donationDescription "
						+ "where id=:donationId");
		theQuery.setParameter("donationCode", theCode);
		theQuery.setParameter("donationName", theName);
		theQuery.setParameter("donationStartDate", theStartDate);
		theQuery.setParameter("donationEndDate", theEndDate);
		theQuery.setParameter("donationOrganization", theOrganization);
		theQuery.setParameter("donationPhone", thePhone);
		theQuery.setParameter("donationDescription", theDescription);
		theQuery.setParameter("donationId", theId);
		
		theQuery.executeUpdate();
				
	}

}
