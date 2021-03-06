package com.java.levo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.jasper.tagplugins.jstl.core.If;





public class MainController extends HttpServlet {
	
	public DataSource dataSource;
	public static Map<String, String> map = new HashMap<String, String>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext initialContext = new InitialContext();
			Context context = (Context) initialContext.lookup("java:comp/env");
			dataSource = (DataSource) context.lookup("jdbc/shopingphone");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection connection = null;
		try {
			connection = dataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
         String action = req.getParameter("action");
        
         String sql = "";
         if (action == null || action.equals("home")) {
        	 req.getRequestDispatcher("home.jsp").forward(req, resp);	 
         }else {
             if (action.equals("iphone")) {
            	 sql = "SELECT * FROM shopingphone.products where product_brand = 'iphone'";
            	 req.setAttribute("sql_query", sql);
            	 req.getRequestDispatcher("home.jsp").forward(req, resp);	 
             }else {
            	 if (action.equals("nokia")) {
            		 sql = "SELECT * FROM shopingphone.products where product_brand = 'nokia'";
                	 req.setAttribute("sql_query", sql);
                	 req.getRequestDispatcher("home.jsp").forward(req, resp);	 
            	 }else {
            		 if (action.equals("realme")) {
                		 sql = "SELECT * FROM shopingphone.products where product_brand = 'realme'";
                    	 req.setAttribute("sql_query", sql);
                    	 req.getRequestDispatcher("home.jsp").forward(req, resp);	 
                	 }else {
                		 if (action.equals("samsung")) {
                    		 sql = "SELECT * FROM shopingphone.products where product_brand = 'samsung'";
                        	 req.setAttribute("sql_query", sql);
                        	 req.getRequestDispatcher("home.jsp").forward(req, resp);	 
                    	 }else {
                    		 if (action.equals("xiaomi")) {
                        		 sql = "SELECT * FROM shopingphone.products where product_brand = 'xiaomi'";
                            	 req.setAttribute("sql_query", sql);
                            	 req.getRequestDispatcher("home.jsp").forward(req, resp);	 
                        	 }else {
                        		 if (action.equals("oppo")) {
                            		 sql = "SELECT * FROM shopingphone.products where product_brand = 'oppo'";
                                	 req.setAttribute("sql_query", sql);
                                	 req.getRequestDispatcher("home.jsp").forward(req, resp);	 
                            	 }else {
                            		 if (action.equals("vsmart")) {
                                		 sql = "SELECT * FROM shopingphone.products where product_brand = 'vsmart'";
                                    	 req.setAttribute("sql_query", sql);
                                    	 req.getRequestDispatcher("home.jsp").forward(req, resp);	 
                                	 }else {
                            			 String value = action.toLowerCase();
                            			 if ("iphone".indexOf(value) > -1) {
                            				 sql = "SELECT * FROM shopingphone.products where product_brand = 'iphone'";
                            			 }else {
                            				 if ("samsung".indexOf(value) > -1) {
                                				 sql = "SELECT * FROM shopingphone.products where product_brand = 'samsung'";
                                			 }else {
                                				 if ("xiaomi".indexOf(value) > -1) {
                                    				 sql = "SELECT * FROM shopingphone.products where product_brand = 'xiaomi'";
                                    			 }else {
                                    				 if ("oppo".indexOf(value) > -1) {
                                        				 sql = "SELECT * FROM shopingphone.products where product_brand = 'oppo'";
                                        			 }else {
                                        				 if ("vsmart".indexOf(value) > -1) {
                                            				 sql = "SELECT * FROM shopingphone.products where product_brand = 'vsmart'";
                                            			 }else {
                                            				 if ("nokia".indexOf(value) > -1) {
                                                				 sql = "SELECT * FROM shopingphone.products where product_brand = 'nokia'";
                                                			 }else {
                                                				 if ("realme".indexOf(value) > -1) {
                                                    				 sql = "SELECT * FROM shopingphone.products where product_brand = 'realme'";
                                                    			 }else {           
                                                                     if (action.equals("price1")) {
                                                                    	 sql= "SELECT * FROM shopingphone.products where  product_price < 3000000 order by product_price desc";             
                                                                     }else {
                                                                    	 if (action.equals("price2")) {
                                                                        	 sql= "SELECT * FROM shopingphone.products where  product_price >= 3000000 and product_price < 6000000  order by product_price desc";             
                                                                         }else {
                                                                        	 if (action.equals("price3")) {
                                                                            	 sql= "SELECT * FROM shopingphone.products where  product_price >= 6000000 and product_price < 15000000  order by product_price desc";             
                                                                             }else {
                                                                            	 if (action.equals("price4")) {
                                                                                	 sql= "SELECT * FROM shopingphone.products where  product_price >= 15000000 and product_price < 30000000  order by product_price desc";             
                                                                                 }else {
                                                                                	 if (action.equals("price5")) {
                                                                                    	 sql= "SELECT * FROM shopingphone.products where  product_price >= 30000000 order by product_price desc";             
                                                                                     }else {
                                                                                    	 if (action.equals("product")) {
                                                                                    		 String product_id = req.getParameter("product_id");
                                                                                    		 String name_account = req.getParameter("name_account");
                                                                                    		 String counter = req.getParameter("counter");
                                                                                    		 req.setAttribute("product_id", product_id); 
                                                                                    		 req.setAttribute("name_account", name_account); 
                                                                                    		 req.setAttribute("counter", counter);
                                                                                    		 req.getRequestDispatcher("product.jsp").forward(req, resp);	      
                                                                                         } else {
                                                                                        	 if (action.equals("login")) {                   
                                                                                        		 req.setAttribute("email", "");
                                                                                 				 req.setAttribute("password", "");
                                                                                 				 req.setAttribute("re_password", "");
                                                                                 				 req.setAttribute("message", "Welcome to my system");
                                                                                        		 req.getRequestDispatcher("login.jsp").forward(req, resp);	      
                                                                                             }else {
                                                                                            	 if(action.equals("register")) {
                                                                                            		 req.setAttribute("user_email", "");
                                                                                     				 req.setAttribute("password", "");
                                                                                     				 req.setAttribute("account_role", "");
                                                                                     				 req.setAttribute("user_name", "");
                                                                                    				 req.setAttribute("user_address", "");
                                                                                    				 req.setAttribute("user_phone", "");
                                                                                     				 req.setAttribute("message", "Register to my system");
                                                                                     				 req.getRequestDispatcher("register.jsp").include(req, resp);   
                                                                                            	 }else {
                                                                                            		 if(action.equals("order_items")) {
                                                                                            			 Account account = new Account(connection);
                                                                                            			 String name = req.getParameter("name_account");
                                                                                            			 String phoneId = req.getParameter("phoneId");
                                                                                            			
                       
                                                                                            			 try {
                                                                                            				 String email = account.getEmailAccount(name);
                                                                                            				 
                                                                                            				 account.addItems(phoneId, email);
                                                                                            				 int counter = account.getNumber(email);
                                                                                            				 System.out.println(phoneId+" "+email+" " +counter);
                                                                                            				 req.setAttribute("counter", counter);
                                                                                            				 req.setAttribute("email", email);
                                                                                            				 req.setAttribute("name_account", name);
                                                                                            				 req.getRequestDispatcher("home.jsp?counter="+counter).forward(req, resp);
																										} catch (SQLException e) {
																											// TODO Auto-generated catch block
																											e.printStackTrace();
																										}
	 
                                                                                            		 }else {
                                                                                            			 if(action.equals("book")) {
                                                                                            				 System.out.println("dfsdfsdfsdfsdfsdfsd");
                                                                                            				 Account account = new Account(connection);
                                                                                                			 String phone_product_id = req.getParameter("phone_product_id");
                                                                                                			 String name_account = req.getParameter("name_account");
                                                                                                			 try {
																												String email =  account.getEmailAccount(name_account);
																												account.bookPhone(phone_product_id);
																												int counter = account.getNumber(email);
																												System.out.println(counter);
																												 req.setAttribute("counter", counter);
	                                                                                            				 req.setAttribute("email", email);
	                                                                                            				 req.setAttribute("name_account", name_account);

	                                                                                            			    } catch (SQLException e) {
																												// TODO Auto-generated catch block
																												e.printStackTrace();
																											}
                                                                                            				 req.getRequestDispatcher("home.jsp").forward(req, resp);
                                                                                            			 }else {
                                                                                            				  
                                                                                            				  map.put("action",action);
                                                                                            				  sql = "SELECT * FROM shopingphone.products where product_name = '"+action+"'";  
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
                                                			 }
                                            			 }
                                        			 }
                                    			 }
                                			 }
                            			 }
                            			 req.setAttribute("sql_query", sql);
                                    	 req.getRequestDispatcher("home.jsp").forward(req, resp);	 
                                	 }
                            	 }
                        	 }
                    	 }
                	 }
            	 }
             }
         }
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter printWriter = resp.getWriter();
		Connection connection = null;
		try {
			connection = dataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//get data in login file
		String action = req.getParameter("action");
		System.out.println(action);
		if (action.equals("dologin")) {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String re_password = req.getParameter("re_password");
			User user = new User(email, password);
			if (!password.equals(re_password)) {
				req.setAttribute("email", user.getUser_email());
				req.setAttribute("password", "");
				req.setAttribute("re_password", "");
				req.setAttribute("message", "PassWord not mark");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}else {
				Account account = new Account(connection);
				try {
					if(account.login(user.getUser_email(), user.getPassword())) {
						String name_account = account.getNameAccount(email);
						System.out.println(name_account);
						int counter = account.getNumber(email);
						req.setAttribute("name_account", name_account);
						req.setAttribute("counter", counter);
						req.getRequestDispatcher("home.jsp").forward(req, resp);
					}else {
						req.setAttribute("email", user.getUser_email());
						req.setAttribute("password", "");
						req.setAttribute("re_password", "");
						req.setAttribute("message", "PassWord right or account not exits");
						req.getRequestDispatcher("login.jsp").forward(req, resp);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}else {
			if(action.equals("doUpdate")) {
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				String role = req.getParameter("role");
				String fullName = req.getParameter("fullName");
				String address = req.getParameter("address");
				String phone = req.getParameter("phone");
				Account account = new Account(connection);
				try {
					account.updateAccount(email, password, role, fullName, address, phone, email);
					int counter = account.getNumber(email);
					req.setAttribute("counter", counter);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				req.setAttribute("name_account", fullName);
				req.getRequestDispatcher("home.jsp").forward(req, resp);
			}else {
				if(action.equals("doRegister")) {
					System.out.println(action);
					String email = req.getParameter("email");
					String password = req.getParameter("password");
					String role = req.getParameter("role");
					String fullName = req.getParameter("fullName");
					String address = req.getParameter("address");
					String phone = req.getParameter("phone");
					User user= new User(email, password, role, fullName, address, phone);
					Account account = new Account(connection);
					if(!user.validating()) {
						 req.setAttribute("user_email", email);
        				 req.setAttribute("password", password);
        				 req.setAttribute("account_role", role);
        				 req.setAttribute("user_name", fullName);
       				     req.setAttribute("user_address", address);
       				     req.setAttribute("user_phone", phone);
        				 req.setAttribute("message", user.getMessage());
        				 req.getRequestDispatcher("register.jsp").forward(req, resp);
					}else {
						 try {
							if (account.checkEmail(email)) {
								 req.setAttribute("user_email", email);
		        				 req.setAttribute("password", password);
		        				 req.setAttribute("account_role", role);
		        				 req.setAttribute("user_name", fullName);
		       				     req.setAttribute("user_address", address);
		       				     req.setAttribute("user_phone", phone);
		        				 req.setAttribute("message", "Email arealdy exited");
		        				 req.getRequestDispatcher("register.jsp").forward(req, resp);
							}else {
								req.setAttribute("email", "");
                 				req.setAttribute("password", "");
                 				req.setAttribute("re_password", "");
                 				req.setAttribute("message", "Your register success, please login to system");
								account.registerAccount(email, password, role, fullName, address, phone);

								req.getRequestDispatcher("login.jsp").forward(req, resp);	
							}
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
					try {
						account.updateAccount(email, password, role, fullName, address, phone, email);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}			
					
			}
		}
	}
	
}
