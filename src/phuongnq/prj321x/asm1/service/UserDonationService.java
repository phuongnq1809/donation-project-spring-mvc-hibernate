package phuongnq.prj321x.asm1.service;

import java.util.List;

import phuongnq.prj321x.asm1.entity.UserDonation;

public interface UserDonationService {
	
	public void saveUserDonation(UserDonation theUserDonation);

	public List<UserDonation> getUserDonations(int theDonationId);

	public UserDonation getUserDonation(int theUserDonationId);

	public List<UserDonation> getUserDonationsConfirmed(int theDonationId);
	
}
