<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Hearder Hear -->

<c:import url="header.jsp"></c:import>
<sql:setDataSource var="databases" dataSource="jdbc/shopingphone" />
<sql:query dataSource="${databases}" var="results" sql="SELECT * FROM shopingphone.products where product_id = '${product_id}'"/>


<c:forEach var="phone" items="${results.rows}" varStatus="row">

<c:if test="${name_account == 'Login'}">
     <c:set var="full_name" value="Login"></c:set>
     <c:set var="link_account" value="mainController?action=login"></c:set>
</c:if>

<c:if test="${name_account != 'Login' }">
      <c:set var="full_name" value="${name_account}"></c:set>
      <c:set var="link_account" value="mainController?action=order_items&phoneId=${phone.product_id}&name_account=${name_account}&counter=${counter}"></c:set>
</c:if>

<c:if test="${param.name_account != '' && name_account == ''}">
      <c:set var="full_name" value="${name_account}"></c:set>
       <c:set var="counter" value="${param.counter}"></c:set>
      <c:set var="link_account" value="mainController?action=order_items&phoneId=${phone.product_id}&name_account=${name_account}&counter=${param.counter}"></c:set>
</c:if>


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
		<a id ="input_submit_product" href="${link_account}">Add To Cart</a>
	</div>
</div>

</c:forEach>

<!-- Body Hear -->

<!-- Footer Hear -->
<c:import url="footer.jsp"></c:import>