package phuongnq.prj321x.asm1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import phuongnq.prj321x.asm1.dao.DonationDAO;
import phuongnq.prj321x.asm1.entity.Donation;

@Service
public class DonationServiceImpl implements DonationService {
	
	@Autowired
	private DonationDAO donationDAO;

	@Override
	@Transactional
	public List<Donation> getDonations() {
		return donationDAO.getDonations();
	}

	@Override
	@Transactional
	public Donation getDonation(int theId) {
		return donationDAO.getDonation(theId);
	}

	@Override
	@Transactional
	public void saveDonation(Donation donation) {
		donationDAO.saveDonation(donation);
	}

	@Override
	@Transactional
	public void deleteDonation(int theId) {
		donationDAO.deleteDonation(theId);		
	}

	@Override
	@Transactional
	public void changeDonationStatus(int theId, int updateStatus) {
		donationDAO.changeDonationStatus(theId,updateStatus);		
	}

	@Override
	@Transactional
	public void updateDonation(String theCode, String theName, String theStartDate, String theEndDate,
			String theOrganization, String thePhone, String theDescription, int theId) {
		donationDAO.updateDonation(theCode, theName, theStartDate, theEndDate, theOrganization, thePhone, theDescription, theId);		
	}

}
