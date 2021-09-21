package com.java.levo;
public class User {

	private String user_email ="";
	private String password ="";
	private String account_role ="";
    private String user_name ="";
    private String user_address ="";
	private String user_phone ="";
    private String message ="Welcom to my system";

	public User(String user_email, String password, String account_role, String user_name, String user_address, String user_phone) {
		this.user_email = user_email;
		this.password = password;
		this.account_role = account_role;
		this.user_name = user_name;
		this.user_address = user_address;
		this.user_phone = user_phone;
	}
    
	public User(String user_email, String password) {
		this.user_email = user_email;
		this.password = password;
	}
    
    public User() {
    	
    }

	public String getUser_email() {
		return this.user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount_role() {
		return this.account_role;
	}

	public void setAccount_role(String account_role) {
		this.account_role = account_role;
	}

	public String getUser_name() {
		return this.user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_address() {
		return this.user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_phone() {
		return this.user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
    

	public boolean validating() {
		if (user_email.isEmpty()) {
			message = "Box Email can not empty";
			return false;
		}else {
			if (account_role.isEmpty()) {
				message = "Box role can not empty";
				return false;
			}else {
				if (user_name.isEmpty()) {
					message = "Box full name can not empty";
					return false;
				}else {
					if (user_address.isEmpty()) {
						message = "Box address can not empty";
						return false;
					}
					else{
						if (user_phone.isEmpty()) {
							message = "Box phone number can not empty";
							return false;
						}else {
							if (password.isEmpty()) {
								message = "Password can not empty";
								return false;
							}else {
								if(password.matches("\\w*\\s+\\w*")) {
									message = "Password can not contain space";
									return false;
								}else {
									if (user_email.startsWith("@") || user_email.endsWith("@") || user_email.startsWith(".") || user_email.endsWith(".")) {
										message = "Email not suitable with form email";
										return false;
									}else {
										if (password.length() < 8) {
											message = "Password must be great then 8 character";
											return false;
										}else {
											if(isNumber(user_phone) == false){
												message = "Box phone number can't contant character";
												return false;
											}else{
                                                if (user_phone.length() < 8 ||user_phone.length() >16){
                                                    message = "Box phone number must be great then 10 character and less than 15 character";
                                                    return false;
                                                }else{
                                                    message = "Account is right";
                                                
                                                }
                                            }
										}
									}
								}
							}
						}
					}
		
				}
			}
		}
		return true;
	}

	public static boolean isNumber(String s) {
        for (int i = 0; i < s.length(); i++){
            if (Character.isDigit(s.charAt(i)) == false){
				return false;
			}
     	}	
		 return true;	 
    } 
}
