package phuongnq.prj321x.asm1.dao;

import java.util.List;

import phuongnq.prj321x.asm1.entity.UserDonation;

public interface UserDonationDAO {

	void saveUserDonation(UserDonation theUserDonation);

	List<UserDonation> getUserDonations(int theDonationId);

	UserDonation getUserDonation(int theUserDonationId);

	List<UserDonation> getUserDonationsConfirmed(int theDonationId);

}
