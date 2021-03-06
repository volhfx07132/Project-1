<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Hearder Hear -->
<!-- Check account email ${name_account_login}-->


<c:set var="name_account_login" value="${param.action}"></c:set>
<sql:setDataSource var="databases" dataSource="jdbc/shopingphone" />
<sql:query dataSource="${databases}" var="account" sql="SELECT * FROM shopingphone.account where user_name = '${param.action}'"/>
<c:import url="header.jsp"></c:import>
<c:forEach var="person" items="${account.rows}" varStatus="row">
 <div class="box_login">
    <div class="box_login_account">
         <p class="action">Information Your Account</p>
         <form action="mainController" method="post">
              <input class="input_action" type="hidden" name="action" value="doUpdate">
              <table>
             <thead>
                 <tr class="table_action_login">
                     <td class="td_name_information">
                         Name
                     </td>
                     <td class="td_action">
                         <input class="input_action" type="email" name="email" value='${person.user_email}' placeholder="Email">
                     </td>
                 </tr>
                 <tr class="table_action_login">
                    <td class="td_name_information">
                        Password
                    </td>
                    <td class="td_action">
                        <input class="input_action" type="text" name="password" value='${person.password}' placeholder="Password">
                    </td>
                </tr>
                <tr class="table_action_login">
                    <td class="td_name_information">
                        Account role
                    </td>
                    <td class="td_action">
                        <input class="input_action" type="text" name="role" value='${person.account_role}' placeholder="Role">
                    </td>
                </tr>
                <tr class="table_action_login">
                    <td class="td_name_information">
                        Full name
                    </td>
                    <td class="td_action">
                        <input class="input_action" type="text" name="fullName" value='${person.user_name}' placeholder="Full name">
                    </td>
                </tr>
                <tr class="table_action_login">
                    <td class="td_name_information">
                        Address
                    </td>
                    <td class="td_action">
                        <input class="input_action" type="text" name="address" value='${person.user_address}' placeholder="Address">
                    </td>
                </tr>
                <tr class="table_action_login">
                  <td class="td_name_information">
                      Phone number
                  </td>
                  <td class="td_action">
                      <input class="input_action" type="text" name="phone" value='${person.user_phone}' placeholder=" Phone number">
                  </td>
              </tr>
                <tr class="table_action_login">
                    <td class="td_name">
                    
                    </td>
                    <td class="td_action">
                        <input class="input_action_button" type="submit" value="Update">
                    </td>
                </tr>
             </thead>
         </table>         
            <p class="action_notification"></p>   
         </form>
    </div>
 </div>
</c:forEach>

<!-- Body Hear -->
	
<!-- Footer Hear -->
<c:import url="footer.jsp"></c:import>