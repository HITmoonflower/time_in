package action;

import model.UserModel;
import service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	private UserModel user = new UserModel();
	private UserService userService = new UserService();

	public UserModel getUser() {
		return user;
	}

	public void setUser(UserModel user) {
		this.user = user;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String loginUser() {
		int res = userService.login(user);
		if(res == -1)
			return "error";
		return SUCCESS;
	}
	
	public String registerUser() {
		int res = userService.register(user);
		if(res == -1)
			return "error";
		return SUCCESS;
	}
}
