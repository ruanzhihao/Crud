package com.java.ssm.cotroller;

import java.io.IOException;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.java.ssm.entity.User;
import com.java.ssm.service.UserDaoService;

import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
	@Autowired
	private UserDaoService userDaoService;

	@GetMapping(value = "addUser")
	public String addUser() {
		return "insertUserForm";
	}

	@GetMapping(value = "updateUserForm")
	public String returnUpdateForm() {
		return "updateUserForm";
	}

	/*@RequestMapping(value = "saveUser")
	public String insertUser(UserModel userModel, RedirectAttributes redirectAttributes) {
	//使用对象接受必须对象的全部属性赋值
		User user = new User();
		user.setUserName(userModel.getUserName());
		user.setUserPassword(userModel.getUserPassword());
		user.setEmail(userModel.getEmail());
		user.setRoleName(userModel.getRoleName());
		int i = userDaoService.insertUserService(user);
		if (i == 1) {
			redirectAttributes.addFlashAttribute("message", "用户信息保存成功");
		}
		return "redirect:/selectCurUser" + ".do";
	}*/
	@RequestMapping(value = "saveUser")
	public void insertUser(String userName,String userPassword,String roleName,String email, HttpServletResponse response)throws IOException {
		User user = new User();
		/*System.out.println(userModel.toString());
		user.setUserName(userModel.getUserName());
		user.setUserPassword(userModel.getUserPassword());
		user.setEmail(userModel.getEmail());*/
		user.setEmail(email);
		user.setUserName(userName);
		user.setUserPassword(userPassword);
		user.setRoleName(roleName);
		int i = userDaoService.insertUserService(user);
		response.getWriter().print(i);
	}

	@RequestMapping(value = "selectCurUser")
	public String selectUser(Model model) {
		User user = userDaoService.selectCurUserService();
		model.addAttribute("User", user);
		return "userInfoView";
	}

	@RequestMapping(value = "selectAllUser")
	public ModelAndView selectAllUser() {
		ModelAndView mav = new ModelAndView();
		List<User> list = userDaoService.selectAllUserService();
		mav.addObject("Users", list);
		mav.setViewName("userList");
		return mav;
	}

@RequestMapping(value = "selectAllUserJson")
	public void selectAllUserJson(HttpServletResponse response) throws IOException {
		List<User> list = userDaoService.selectAllUserService();
		System.out.println(list);
		System.out.println(JSONArray.toJSON(list));
		response.getWriter().print(JSONArray.toJSON(list));
	}
/*	@RequestMapping(value = "selectAllUserJson")
	@ResponseBody
	public List<User> selectAllUserJson(HttpServletResponse response) throws IOException {
		List<User> list = userDaoService.selectAllUserService();
		return list;
	}*/
/*	@RequestMapping(value = "deleteUser/{id}")
	public String deleteUser(@PathVariable Integer id) {
		userDaoService.deleteUser(id);
		return "redirect:/selectAllUser";
	}*/
@RequestMapping(value = "deleteUser/{id}")
public void  deleteUser(@PathVariable Integer id,HttpServletResponse response) throws IOException {
	int i=userDaoService.deleteUser(id);
	response.getWriter().print(i);
}

	@RequestMapping(value = "updateUser0")
	public String updateUser(User user) {
		userDaoService.updateUser(user);
		return "redirect:/selectAllUser";
	}
	@RequestMapping(value = "updateUser")
	@ResponseBody
	public void updateUser(Long id,String userName,String userPassword,String roleName,String email, HttpServletResponse response)throws IOException {
		User user=new User();
		user.setId(id);
		user.setRoleName(roleName);
		user.setUserPassword(userPassword);
		user.setUserName(userName);
		user.setEmail(email);
	    int row=userDaoService.updateUser(user);
		System.out.println(row);
		response.getWriter().print(row);
	}

	@RequestMapping(value = "selectUser/{id}")
	public String selectUser(@PathVariable Integer id, Model model) {
		User user = userDaoService.selectUserService(id);
		model.addAttribute("User", user);
		return "userInfoView";
	}
	@RequestMapping(value = "selectUserById/{id}")
	public void selectUser(@PathVariable Integer id,HttpServletResponse response)throws IOException {
		User user = userDaoService.selectUserService(id);
		response.getWriter().print(JSONArray.toJSON(user));
	}
}
