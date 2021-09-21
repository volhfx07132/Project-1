<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Hearder Hear -->

<c:import url="header.jsp"></c:import>
<sql:setDataSource var="databases" dataSource="jdbc/shopingphone" />
<sql:query dataSource="${databases}" var="results" sql="select * from shopingphone.products inner join shopingphone.cart 
on shopingphone.products.product_id = shopingphone.cart.product_id where shopingphone.cart.user_email ='volhfx07132@funix.edu.com'"/>
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
		<a id ="input_submit_product" href="#">Add To Cart</a>
	</div>
</div>

</c:forEach>

<!-- Body Hear -->

<!-- Footer Hear -->
<c:import url="footer.jsp"></c:import>