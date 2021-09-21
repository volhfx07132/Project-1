<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Hearder Hear -->
<!-- Check account email -->
<c:import url="header.jsp"></c:import>
<!-- Body Hear -->
	 <div class="box_login">
        <div class="box_login_web">
             <p class="action">Login to your account</p>
             <form action="mainController" method="post">
                  <input class="input_action" type="hidden" name="action" value="dologin">
                  <table>
                 <thead>
                     <tr class="table_action_login">
                         <td class="td_name">
                             Name
                         </td>
                         <td class="td_action">
                             <input class="input_action" type="email" name="email" value='<%=request.getAttribute("email") %>' placeholder="Email">
                         </td>
                     </tr>
                     <tr class="table_action_login">
                        <td class="td_name">
                            Password
                        </td>
                        <td class="td_action">
                            <input class="input_action" type="password" name="password" value='<%=request.getAttribute("password") %>' placeholder="Password">
                        </td>
                    </tr>
                    <tr class="table_action_login">
                        <td class="td_name">
                            Password
                        </td>
                        <td class="td_action">
                            <input class="input_action" type="password" name="re_password" value='<%=request.getAttribute("re_password") %>' placeholder="Repeat password">
                        </td>
                    </tr>
                    <tr class="table_action_login">
                        <td class="td_name">
                        
                        </td>
                        <td class="td_action">
                            <input class="input_action_button" type="submit" value="Login">
                        </td>
                    </tr>
                 </thead>
             </table>         
                <p class="action_notification"><%=request.getAttribute("message") %></p>   
             </form>
           
        </div>
     </div>
<!-- Footer Hear -->
<c:import url="footer.jsp"></c:import>