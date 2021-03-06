<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!-- Hearder Hear -->

<c:import url="header.jsp"></c:import>
<!-- Body Hear -->
<c:if test="${name_account == null}">
    <c:set var="full_name" value="Login"></c:set>     
     <c:set var="counter_product" value="0"></c:set>
</c:if>
<c:if test="${name_account != null}">
      <c:set var="full_name" value="${name_account}"></c:set>
</c:if>

<c:if test="${param.name_account != null}">
      <c:set var="full_name" value="${param.name_account}"></c:set>
      <c:set var="counter_product" value="${param.counter}"></c:set>
</c:if>



<sql:setDataSource var="databases" dataSource="jdbc/shopingphone" />

<c:if test="${sql_query == null}">
	<c:set var="sql" value="SELECT * FROM shopingphone.products"></c:set>
</c:if>
<c:if test="${sql_query != null}">
	<c:set var="sql" value="${sql_query}"></c:set>
</c:if>

<sql:query dataSource="${databases}" var="results"
	sql="${sql}" />
	
<c:set var="courterDown" value="0"></c:set>			
<table>
	<c:set var="tableWidth" value="4"></c:set>
	<c:forEach var="phone" items="${results.rows}" varStatus="row">
     	<c:set var="courterDown" value="1"></c:set>		
	</c:forEach>
	<c:if test="${courterDown == 0}">
	   <img style="margin-left: 250px;" id="cart_empty" src="https://rtworkspace.com/wp-content/plugins/rtworkspace-ecommerce-wp-plugin/assets/img/empty-cart.png"/>
	</c:if>
	<c:if test="${courterDown != 0}">
	      <c:forEach var="phone" items="${results.rows}" varStatus="row">
     	<c:set var="courter" value="1"></c:set>		
		<c:if test="${row.index % tableWidth == 0}">
			<tr>
		</c:if>
		<td>
		<img class="hot_sale" src="https://img.icons8.com/color/50/000000/sale--v3.png" /> 
		
		<a href="mainController?action=product&product_id=${phone.product_id}&name_account=${full_name}&counter=${counter_product}">
		<img class="image_phone" src="${phone.product_img}">
		
		</a>
			<button class="button_sale">-5%</button>
			<p class="name_phone">${phone.product_name}</p>
			<p class="price_phone"><fmt:formatNumber type="number" groupingUsed="true" value="${phone.product_price}"/>&nbsp;VND</p>                                        
			<div>
				<img class="star"
					src="https://img.icons8.com/emoji/48/000000/star-emoji.png" /> <img
					class="star"
					src="https://img.icons8.com/emoji/48/000000/star-emoji.png" /> <img
					class="star"
					src="https://img.icons8.com/emoji/48/000000/star-emoji.png" /> <img
					class="star"
					src="https://img.icons8.com/emoji/48/000000/star-emoji.png" /> <img
					class="star"
					src="https://img.icons8.com/emoji/48/000000/star-emoji.png" />
				<p class="text_reviewer">${phone.Reviewer}&nbsp;ReView</p>
			</div>
			
			</td>
		<c:if test="${row.index+1 % tableWidth == 0}">
			</tr>
		</c:if>
	</c:forEach>
	</c:if>
	
</table>
<!-- Footer Hear -->
<c:import url="footer.jsp"></c:import>
