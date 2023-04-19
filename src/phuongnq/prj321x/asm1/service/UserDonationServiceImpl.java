package phuongnq.prj321x.asm1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import phuongnq.prj321x.asm1.dao.UserDonationDAO;
import phuongnq.prj321x.asm1.entity.UserDonation;

@Service
public class UserDonationServiceImpl implements UserDonationService {
	
	@Autowired
	private UserDonationDAO userDonationDAO;

	@Override
	@Transactional
	public void saveUserDonation(UserDonation theUserDonation) {
		userDonationDAO.saveUserDonation(theUserDonation);		
	}

	@Override
	@Transactional
	public List<UserDonation> getUserDonations(int theDonationId) {
		return userDonationDAO.getUserDonations(theDonationId);
	}

	@Override
	@Transactional
	public UserDonation getUserDonation(int theUserDonationId) {
		return userDonationDAO.getUserDonation(theUserDonationId);
	}

	@Override
	@Transactional
	public List<UserDonation> getUserDonationsConfirmed(int theDonationId) {
		return userDonationDAO.getUserDonationsConfirmed(theDonationId);
	}

}
