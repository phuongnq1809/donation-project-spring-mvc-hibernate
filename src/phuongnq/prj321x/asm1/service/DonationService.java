package phuongnq.prj321x.asm1.service;

import java.util.List;

import phuongnq.prj321x.asm1.entity.Donation;

public interface DonationService {

	public List<Donation> getDonations();

	public Donation getDonation(int theId);

	public void saveDonation(Donation donation);

	public void deleteDonation(int theId);

	public void changeDonationStatus(int theId, int updateStatus);

	public void updateDonation(String theCode, String theName, String theStartDate, String theEndDate,
			String theOrganization, String thePhone, String theDescription, int theId);


}
