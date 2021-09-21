<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Hearder Hear -->

<c:import url="header.jsp"></c:import>

<sql:setDataSource var="databases" dataSource="jdbc/shopingphone" />
<sql:query dataSource="${databases}" var="results" sql="select * from shopingphone.products inner join shopingphone.cart 
on shopingphone.products.product_id = shopingphone.cart.product_id 
where shopingphone.cart.user_email = (SELECT user_email FROM shopingphone.account where user_name = '${param.name_account}')"/>
<c:set var="counter_list" value="0"></c:set>    
<c:forEach var="phone" items="${results.rows}" varStatus="row">
     <c:set var="counter_list" value="1"></c:set>    
</c:forEach>
<c:if test="${counter_list == 0}">
	   <img style="margin-left: 250px;" id="cart_empty" src="https://rtworkspace.com/wp-content/plugins/rtworkspace-ecommerce-wp-plugin/assets/img/empty-cart.png"/>
</c:if>

<c:set var="variable_countdown" value= "-1" ></c:set>
 <fmt:parseNumber  var="num" value="${variable_countdown}" type="number"/>
<c:forEach var="phone" items="${results.rows}" varStatus="row">
    
   <c:set var="variable_countdown" value="${num = num+1}"></c:set>
</c:forEach>

<c:if test="${counter_list != 0}">
	   <c:forEach var="phone" items="${results.rows}" varStatus="row">
<div class="box_product_phone">
	<div class="box_phone_image">
		<img class="box_phone_img"
			src="${phone.product_img}" />
	</div>
	<div class="box_phone_informtion">

	    <div class="name_phone_product">
	       <h2> ${phone.product_name}</h2>	
	    </div>
		
		<div class="box_div_name">
		    <h2>Brand/Type </h2>
		</div>
		<div class="box_div_name">
		    <h2>Designer</h2>
		</div>
		<div class="box_div_name">
		    <h2>Price</h2>
		</div>
		<div class="box_div_name">
	     	<h2>Information</h2>
		</div>
		<div class="box_div_value">
		  <h2>${phone.product_brand}</h2>
		</div>
		<div class="box_div_value">
		  <h2>${phone.product_designer}</h2>
		</div>
		<div class="box_div_value">
		  <h2><fmt:formatNumber type="number" groupingUsed="true" value="${phone.product_price}"/>&nbsp;VND</h2>
		</div>
		<div id="box_div_value_infor">
		 <h4>A${phone.product_information}</h4>
		</div>
		<a id ="input_submit_product" href="mainController?action=book&phone_product_id=${phone.product_id}&name_account=${param.name_account}&counter=${num}">Book</a>
		<a id ="input_submit_product" href="mainController?action=book&phone_product_id=${phone.product_id}&name_account=${param.name_account}&counter=${num}"">remove</a>
	</div>
</div>

</c:forEach>
</c:if>




<c:import url="footer.jsp"></c:import>