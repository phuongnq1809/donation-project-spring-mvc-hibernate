/*
* Donation DAO
*/
package phuongnq.prj321x.asm1.dao;

import java.util.List;

import phuongnq.prj321x.asm1.entity.Donation;

public interface DonationDAO {

	List<Donation> getDonations();

	Donation getDonation(int theId);

	void saveDonation(Donation donation);

	void deleteDonation(int theId);

	void changeDonationStatus(int theId, int updateStatus);

	void updateDonation(String theCode, String theName, String theStartDate, String theEndDate, String theOrganization,
			String thePhone, String theDescription, int theId);

}
