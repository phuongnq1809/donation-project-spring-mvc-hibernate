/*
* Login Controller
*/
package phuongnq.prj321x.asm1.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phuongnq.prj321x.asm1.entity.User;
import phuongnq.prj321x.asm1.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "login";
	}
	
	// xu ly login: kiem tra tai khoan xem co ton tai trong he thong hay khong
	// neu co: tra ve home page theo vai tro tuong ung cua user (admin)
	@PostMapping("/loginProcess")
	public String loginProcess(@RequestParam("username") String uname, 
							   @RequestParam("password") String upass, 
							   Model theModel,
							   HttpSession session) {
		
		User theUser = userService.findUser(uname, upass);
		
		if(theUser == null) {
			String message = "Thông tin tài khoản không đúng hoặc tài khoản đã bị khóa, vui lòng thử lại hoặc liên hệ với quản trị viên!";
			theModel.addAttribute("error_message", message);
			return "login";
		} else {
			session.setAttribute("user", theUser);
			if(theUser.getRole().getRoleName().equals("Admin")) {
				return "redirect:/admin/home";
			} else {
				return "redirect:/user/home";
			}
			
		}
		
	}

	
}
