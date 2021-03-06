<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Hearder Hear -->
<!-- Check account email ${name_account_login}-->
<c:if test="${message == null}">
    <c:set var="email_set" value=""></c:set>
    <c:set var="password_set" value=""></c:set>   
    <c:set var="fullName_set" value=""></c:set>
    <c:set var="address_set" value=""></c:set>
    <c:set var="phone_set" value=""></c:set>
    <c:set var="message_set" value=""></c:set>
</c:if>

<c:if test="${message != null}">
    <c:set var="email_set" value="${user_email}"></c:set>
    <c:set var="password_set" value="${password}"></c:set>
    <c:set var="fullName_set" value="${user_name}"></c:set>
    <c:set var="address_set" value="${user_address}"></c:set>
    <c:set var="phone_set" value="${user_phone}"></c:set>
    <c:set var="message_set" value="${message}"></c:set>
</c:if>

<c:import url="header.jsp"></c:import>
<div class="box_login">
    <div style="height: 780px;" class="box_login_account">
         <p class="action">Create a new Account</p>
        
         <form action="mainController" method="post">
              <input class="input_action" type="hidden" name="action" value="doRegister">
              <table>
             <thead>
                 <tr class="table_action_login">
                     <td class="td_name_information">
                         Email
                     </td>
                     <td class="td_action">
                         <input class="input_action" type="email" name="email" value='${email_set}' placeholder="Email">
                     </td>
                 </tr>
                 <tr class="table_action_login">
                    <td class="td_name_information">
                        Password
                    </td>
                    <td class="td_action">
                        <input class="input_action" type="password" name="password" value='${password_set}' placeholder="Password">
                    </td>
                </tr>
                <tr class="table_action_login">
                    <td class="td_name_information">
                        Account role
                    </td>
                    <td class="td_action">
                        <input class="input_action" type="text" name="role" value="Buyer" placeholder="Role">
                    </td>
                </tr>
                <tr class="table_action_login">
                    <td class="td_name_information">
                        Full name
                    </td>
                    <td class="td_action">
                        <input class="input_action" type="text" name="fullName" value='${fullName_set}' placeholder="Full name">
                    </td>
                </tr>
                <tr class="table_action_login">
                    <td class="td_name_information">
                        Address
                    </td>
                    <td class="td_action">
                        <input class="input_action" type="text" name="address" value='${address_set}' placeholder="Address">
                    </td>
                </tr>
                <tr class="table_action_login">
                  <td class="td_name_information">
                      Phone number
                  </td>
                  <td class="td_action">
                      <input class="input_action" type="text" name="phone" value='${user_phone}' placeholder=" Phone number">
                  </td>
              </tr>
                <tr class="table_action_login">
                    <td class="td_name">
                    
                    </td>
                    <td class="td_action">
                        <input class="input_action_button" type="submit" value="Register">
                    </td>
                </tr>
             </thead>
         </table>         
            <p class="action_notification">${message_set}</p>   
         </form>
    </div>
 </div>
<!-- Body Hear -->
	
<!-- Footer Hear -->
<c:import url="footer.jsp"></c:import>