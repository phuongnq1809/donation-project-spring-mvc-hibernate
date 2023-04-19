package phuongnq.prj321x.asm1.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phuongnq.prj321x.asm1.entity.Donation;
import phuongnq.prj321x.asm1.entity.UserDonation;
import phuongnq.prj321x.asm1.service.DonationService;
import phuongnq.prj321x.asm1.service.UserDonationService;
import phuongnq.prj321x.asm1.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;
	
	@RequestMapping("/home")
	public String homeUser(Model theModel) {

		List<Donation> theDonations = donationService.getDonations();
		theModel.addAttribute("donations", theDonations);
		
		return "user/home-user";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/index.jsp";
	}
	
	// chi tiet 1 dot quyen gop
	@RequestMapping("/donationDetail")
	public String donationDetail(@RequestParam("donationId") int theDonationId, Model theModel) {
		
		Donation theDonation = donationService.getDonation(theDonationId);
		
		List<UserDonation> theUserDonations = userDonationService.getUserDonationsConfirmed(theDonationId);
		
		theModel.addAttribute("donation", theDonation);
		theModel.addAttribute("userdonations", theUserDonations);
		
		return "user/donation-detail";
	}
	
	// xu ly viec quyen gop
	@PostMapping("/donateProcess")
	public String donateProcess(@RequestParam("name") String theName,
								@RequestParam("money") int theMoney,
								@RequestParam("text") String theText,
								@RequestParam("donation_id") int theDonationId,
								@RequestParam("user_id") int theUserId) {
		
		//String currentDate = (new Date()).toString();
		String currentDate = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(Calendar.getInstance().getTime());
		
		UserDonation theUserDonation = new UserDonation(currentDate, theMoney, theName, 0, theText, theUserId, theDonationId);
		
		// Cap nhat thong tin vao database
		userDonationService.saveUserDonation(theUserDonation);
		
		return "user/donate-success";
	}

	
}
