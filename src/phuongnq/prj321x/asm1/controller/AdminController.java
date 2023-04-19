package phuongnq.prj321x.asm1.controller;

import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phuongnq.prj321x.asm1.entity.Donation;
import phuongnq.prj321x.asm1.entity.Role;
import phuongnq.prj321x.asm1.entity.User;
import phuongnq.prj321x.asm1.entity.UserDonation;
import phuongnq.prj321x.asm1.service.DonationService;
import phuongnq.prj321x.asm1.service.RoleService;
import phuongnq.prj321x.asm1.service.UserDonationService;
import phuongnq.prj321x.asm1.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;
	
	// home for admin
	@RequestMapping("/home")
	public String homeAdmin() {
		return "admin/home-admin";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/index.jsp";
	}
	
	// 1. QUAN LY NGUOI DUNG
	
	// quan ly user home page
	@RequestMapping("/usersManagement")
	public String usersManagement(Model theModel) {
		
		List<User> theUsers = userService.getUsers();
		
		theModel.addAttribute("users", theUsers);
		
		return "admin/users-management";
	}
	
	// thong tin chi tiet cua user
	@RequestMapping("/usersManagement/userDetail")
	public String userDetail(@RequestParam("userId") int theId, Model theModel) {
		
		// get the user from our service
		User theUser = userService.getUser(theId);
		
		theModel.addAttribute("user", theUser);
		
		return "admin/user-detail";
	}
	
	// add an initbinder...to convert trim input strings
	// xoa cac ki tu la khoang trang thua o cac field trong form
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true); // true means trim to null
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	// form them moi user
	@RequestMapping("/addUser")
	public String addUser(Model theModel) {
		
		// get role entities from our service
		List<Role> theRoles = roleService.getRoles();
		
		// create model attribute to bind form data
		User theUser = new User();
		
		theModel.addAttribute("roles", theRoles);
		theModel.addAttribute("userAdd", theUser);
		
		return "admin/add-user";
	}
	
	// luu user moi vao database
	@PostMapping(value = "/addUserProcess", produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public String addUserProcess(
			@Valid @ModelAttribute("userAdd") User theUser,
			BindingResult theBindingResult,
			Model theModel) {
		
		// Kiem tra cac truong da valid hay chua
		if(theBindingResult.hasErrors()) {
			// get role entities from our service
			List<Role> theRoles = roleService.getRoles();
			
			theModel.addAttribute("roles", theRoles);
			
			return "admin/add-user";
			
		} else {
			
			// kiem tra xem user da ton tai trong he thong hay chua
			User findUser = userService.getUser(theUser.getUsername());
			
			// neu username da ton tai, tra ve thong bao loi
			if(findUser != null) {
				
				theModel.addAttribute("error_message", "Tên tài khoản đã tồn tại trong hệ thống. Vui lòng nhập lại!");
				
				// get role entities from our service
				List<Role> theRoles = roleService.getRoles();
				
				theModel.addAttribute("roles", theRoles);
				
				return "admin/add-user";
			
			// neu khong, them moi user vao database
			} else {
				
				userService.saveUser(theUser);
		        
				return "admin/add-user-success";
			}
			
			
		}
		
	}
	
	// xoa 1 user
	@RequestMapping("/deleteUser")
	public String deleteUser(@RequestParam("userId") int theId) {
		
		//delete the user
		userService.deleteUser(theId);
		
		return "redirect:/admin/usersManagement";
	}
	
	// Thay doi trang thai (khoa hoac hoat dong) cua 1 user
	@RequestMapping("/changeUserStatus")
	public String changeUserStatus(@RequestParam("userId") int theId) {
		
		// update status trong database thong qua service
		userService.changeUserStatus(theId);
		
		return "redirect:/admin/usersManagement";
	}
	
	// form cap nhat thong tin 1 user
	@RequestMapping("/updateUser")
	public String updateUser(@RequestParam("userId") int theId, Model theModel) {
		
		// lay ve user theo id
		User theUser = userService.getUser(theId);
		
		// lay ve ds vai tro user
		List<Role> theRoles = roleService.getRoles();
		
		theModel.addAttribute("userUpdate", theUser);
		theModel.addAttribute("roles", theRoles);
		
		return "admin/update-user";
	}
	
	// xu ly cap nhat thong tin user
	@RequestMapping(value="/updateUserProcess", produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public String updateUserProcess(@Valid @ModelAttribute("userUpdate") User theUser) {
		
		userService.updateUser(theUser);
        
		return "admin/update-user-success";
		
	}
	
	// 2. QUAN LY DOT QUYEN GOP
	
	// quan ly dot quyen gop home page
	@RequestMapping(value="/donationsManagement")
	public String donationsManagement(Model theModel) {
		
		List<Donation> theDonations = donationService.getDonations();
		
		theModel.addAttribute("donations", theDonations);
		
		return "admin/donations-management";
	}
	
	// thong tin chi tiet cua dot quyen gop
	@RequestMapping("/donationDetail")
	public String donationDetail(@RequestParam("donationId") int theDonationId, Model theModel) {
		
		// get the donation from our service
		Donation theDonation = donationService.getDonation(theDonationId);
		
		// get user donation
		List<UserDonation> userdonations = userDonationService.getUserDonations(theDonationId);
		
		theModel.addAttribute("donation", theDonation);
		theModel.addAttribute("userDonations", userdonations);
		
		return "admin/donation-detail";
	}
	
	// xac nhan so tien quyen gop cua 1 dot quyen gop
	@RequestMapping("/confirmDonate")
	public String confirmDonate(@RequestParam("userDonationId") int theUserDonationId) {
		
		// get user donation object
		UserDonation theUserDonation = userDonationService.getUserDonation(theUserDonationId);
		
		// get donation id tuong ung
		int theDonationId = theUserDonation.getDonationId();
		
		// get so tien quyen gop tuong ung
		int moneyDonate = theUserDonation.getMoney();
		
		Donation donation = donationService.getDonation(theDonationId);
		
		// lay ve so tien hien tai cua dot quyen gop
		int currentMoney = donation.getMoney();
		
		// cong them so tien quyen gop vao so dang co
		int updateMoney = currentMoney + moneyDonate;
		
		// cap nhat so tien quyen gop vao dot quyen gop
		donation.setMoney(updateMoney);
		
		// thay doi trang thai viec quyen gop: cho xac nhan -> da xac nhan
		theUserDonation.setStatus(1);
		
		// cap nhat thong tin vao database
		donationService.saveDonation(donation);
		userDonationService.saveUserDonation(theUserDonation);
		
		return "redirect:/admin/donationDetail?donationId=" + theDonationId;
	}
	
	// huy xac nhan so tien quyen gop cua 1 dot quyen gop
	@RequestMapping("/cancelConfirmDonate")
	public String cancelConfirmDonate(@RequestParam("userDonationId") int theUserDonationId) {
		
		// get user donation object
		UserDonation theUserDonation = userDonationService.getUserDonation(theUserDonationId);
		
		// get donation id tuong ung
		int theDonationId = theUserDonation.getDonationId();
		
		// get so tien quyen gop tuong ung
		int moneyDonate = theUserDonation.getMoney();
		
		Donation donation = donationService.getDonation(theDonationId);
		
		// lay ve so tien hien tai cua dot quyen gop
		int currentMoney = donation.getMoney();
		
		// tru di so tien quyen gop
		int updateMoney = currentMoney - moneyDonate;
		
		// cap nhat so tien quyen gop vao dot quyen gop
		donation.setMoney(updateMoney);
		
		// thay doi trang thai viec quyen gop: da xac nhan -> cho xac nhan
		theUserDonation.setStatus(0);
		
		// cap nhat thong tin vao database
		donationService.saveDonation(donation);
		userDonationService.saveUserDonation(theUserDonation);
		
		return "redirect:/admin/donationDetail?donationId=" + theDonationId;
	}
	
	// them moi dot quyen gop
	@RequestMapping(value="/addDonationProcess", produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public String addDonationProcess(@RequestParam("code") String theCode,
									 @RequestParam("name") String theName,
									 @RequestParam("startDate") String theStartDate,
									 @RequestParam("endDate") String theEndDate,
									 @RequestParam("organization") String theOrganization,
									 @RequestParam("phone") String thePhone,
									 @RequestParam("description") String theDescription) {
		
		
		//String currentDate = (new Date()).toString();
		String currentDate = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(Calendar.getInstance().getTime());
		
		
		// Khoi tao doi tuong Donation
		Donation donation = new Donation(theCode, currentDate, theDescription, theStartDate, theEndDate, 0, theName, theOrganization, thePhone, 1,1);
		
		// Them vao database thong qua service
		donationService.saveDonation(donation);
		
		return "admin/add-donation-success";
	}
	
	// xoa 1 dot quyen gop
	@RequestMapping("/deleteDonation")
	public String deleteDonation(@RequestParam("donationId") int theId) {
		
		donationService.deleteDonation(theId);
		
		return "redirect:/admin/donationsManagement";
	}
	
	// thay doi trang thai cua 1 dot quyen gop (tru truong hop trang thai la "da dong" (status=4) )
	@RequestMapping("/changeDonationStatus")
	public String changeDonationStatus(@RequestParam("donationId") int theId) {
		
		// lay ve donation trong db theo id
		Donation donationFound = donationService.getDonation(theId);
		
		// trang thai hien tai
		int currentStatus = donationFound.getStatus();
		
		// trang thai se cap nhat vao database
		int updateStatus = 0;
		
		if(currentStatus == 1) {
			updateStatus = 2;
		} else if(currentStatus == 2) {
			updateStatus = 3;
		} else if(currentStatus == 3) {
			updateStatus = 4;
		} 
		
		donationService.changeDonationStatus(theId, updateStatus);
		
		return "redirect:/admin/donationsManagement";
	}
	
	// cap nhat thong tin 1 dot quyen gop
	@RequestMapping(value="/updateDonationProcess", produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public String updateDonationProcess(@RequestParam("code") String theCode,
									    @RequestParam("name") String theName,
									    @RequestParam("startDate") String theStartDate,
									    @RequestParam("endDate") String theEndDate,
									    @RequestParam("organization") String theOrganization,
									    @RequestParam("phone") String thePhone,
									    @RequestParam("description") String theDescription,
									    @RequestParam("id") int theId) {
		
		donationService.updateDonation(theCode,theName,theStartDate, theEndDate, theOrganization, thePhone, theDescription, theId);
		
		return "admin/update-donation-success";
	}
	
}
