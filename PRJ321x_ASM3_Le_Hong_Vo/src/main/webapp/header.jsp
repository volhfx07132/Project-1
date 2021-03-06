<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${name_account == null}">
    <c:set var="full_name" value="Login"></c:set>
     <c:set var="link_account" value="mainController?action=login"></c:set>
     <c:set var="link_list_phone" value="mainController?action=login"></c:set>
</c:if>

<c:if test="${param.name_account != null}">
      <c:set var="full_name" value="${param.name_account}"></c:set>
      <c:set var="counter" value="${param.counter}"></c:set>
      <c:set var="link_account" value="account.jsp?action=${param.name_account}"></c:set>
      <c:set var="link_list_phone" value="show_phone.jsp?name_account=${param.name_account}&counter=${param.counter}"></c:set>
</c:if>


<c:if test="${name_account != null}">
      <c:set var="full_name" value="${name_account}"></c:set>
      <c:set var="link_account" value="account.jsp?action=${name_account}"></c:set>
      <c:set var="link_list_phone" value="show_phone.jsp?name_account=${name_account}&counter=${counter}"></c:set>
</c:if>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Document</title>
    <link rel="stylesheet" href="Style/body.css">
</head>
<body>
    
 <nav id="home" class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <img class="logo_image" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAnFBMVEXgBSv////gACfmPFfgACX85+vlRVfeAADeAAn53N762N7gACnfAB/fACPfABzfABj+8vXfABPlSVv+9/j97O/3yM/ufY/hAC773uTwnKbyo67jK0X0tb774ub2v8fkDTrrcYPkOk/hEjTyp7DuiJfkMEvsYnr5zdXoXGz1sLznQFvsa3/nTGPvkJ3reYbtf4/nV2rxlqPmMFDjM0lEMLLyAAAGeklEQVR4nO3da3eiOhQG4EChUENARKWK91ptC631zP//b8fOTEewKlGTnZC1328znTX6rFTY5LIlqzvDQ+6YbXbInU0MDwqbHxQ2PyhsflDY/KCw+UHh3zj6RazQ6dzrlg4vkU/otV3d0vbECi39gkIUolB9UIhCFKoPClGIQvVBIQpRqD4oRCEK1QeFKESh+qAQhSgsJ3mQn65SYcvzZcdbtZUKfc4Xuz6UDQwXEuq9Gi4kNFobLiSsMzZcSKKXygXVQCGJPkwX0rh8tTFRSOx0ZLiQsHnLcCEJ3kwXkig3XUjJwHAhcRY9w4XE9l3DhYQVXcOFlPUTs4W72uYdWsj7YqJC4wmssB2zG97uNbGzFuxc23jOvetaUIIO8B7hdQZNjD4Czn8paL6050GfahC8V79+RriXQo8ib4TNeQ9TKvu9Xhdxs/pDT0+iwHWLPtOSKFCYbGwdiSLXnpJVJPvtXhGxq2sF700KMGKF7Rf9iIJXSMfP2hFFrwG3tSMKX+VuZdAPGjURv44/WehVv0nYqdAKtTpbzCf0W/WwfYapTkQ+oZ3lo3rZnqhTccN5ltsO/OlwXG/7m0GkD5H/PL4dT98nCSdxqU8VfknHATucFoc7Ik4kmcXy3vNluayngs3ioO/yDGTyoUsVfnHXCBqmH6MfG5SOEF80IV7RF8MO02Jbbxy/hRLe7+W5qvMHdSIvb/3cTFeN+6lFiXp1b5OAFaOa28dYi/rt+u4tlNH5xj1L7C00qMJv6U9DndArJud+WVvgc+E/c2sHHhYXw/Vp4kR9FX57jyHGso/Txtfg4AXAax0RXZTswJuOTn0ih1UTzUJgo6A+UXaUvZ8YyGGlfnM+lynsfVJYJywnzF6OF60zvzRqNH0d970Q8AIksNeXHcTp9uFn0ZpsnBLxaz9MdzOHM4rtZmZHi83PJ6z2rFyi/t599zh4joCusqL7tdnBojM8NCZZ+aPHnr/+zh2kMchDpPiOdJTFUe5WK/P2Z7m4CYs/P30t7EC+UUrPPRo4+Wul1hnflYnB7M8ot19z+Z9HSV0FaUA7y7JxHJUo1Ol/D+468yWPo7S+iV9F66q3R47LJSr1hv9+0JotpJZ2UjtDBmHx9PgtmUxLL2UvJvvxnSynEosAub0vKWPz/NtY2ZHiTMsPl+7Kj2R9IGV396RO4P83+vPLWpkLd6JKJZtsfzE5Roj+pY7/tv1dtA4XpYtKUFSL9cdBx5fxZmA6tO6K1vxr8/KmXKKy/KAy6D4tfEf4hRWqB60d+OnAtfq0JIhX1mEmRSp6+gqwy+7uCWvTy8tj5P84NmklozwSO7kD2kd4Z5yX/0zTIyta7XXhH04M3BLgTsl29eXs8OiiXSvPxBkV94K20+Nrr+tlKmqBTnW366BzfFo5eVhGkZALq2ohCe9Pzir37/l7Wp+OciGJDm+L+7hPz/HNRvVCEi9PCXfGUebfOBOggZBGZ4iW9fS5uOkJUgNh6cTd8YvO5IXdUOjoINzdFs/v12mvV97VN0gthPtDhSfzOPt15UyAHkLCOo81RKu1nF5VBGgiLB9hPj2O7/EVRYAuQhIVHBs8rO29c+mThzZCSjc8+3Tcp+LCKVZthIQGZ+8Z/9IdTS8qAvQRHmmycyq9F8JfBGgkJHZWd8/4l9EH5SXqJCTsmXuDZ/LAe/hYKyFxIt7tnaLPAYMl+KzbS9Z0IQ36vKPYUCGh/sxw4e6B+Ml0YWXhzUghcRjXbbHBwt0o1j5KNVy4u2ec37fafOFhez0DhSTMTReSeGu6kIZ1xKYLqx0EjRQSh5y/2jRfSLzz08QGCGsOrqLwOyhUGBRy/jecQhWnekGFVEUTKFBhNFHQBApU6FkD8ZsG6wIsrJ4KAQmw0Eqm0OdBoYXW+Bn4PCi40OotYO+d8EJrCNuJVYHQ6gMcU9pHhTDJIa82KoS7qw0gUYnQ6gK2SVAjtEZwPaAUCa0tWIMkVUJrCVW+KRMmBdB5emVC63EO03dGnRCqe7dCoTUBKd9UCq33GOCCqlSYbACaBSgVWl2ALldqhZYrv1WAYqHVmsomqhZaIyb560dBV9eOCZOx7O+PPb+HD78PGIUoVB8UohCF6oNCFKJQfVCIQhSqDwpRiEL1QSEKUag+KEQhCtVHsLDt6hbB363udO51S4d3+ZLzRImjXziBOp8KEhQUNj8obH5Q2PygsPlBYfODwubHeOH/ukKg/CQqhd0AAAAASUVORK5CYII=" alt="logo">  
            <a class="navbar-brand" href="#">CellPhoneS</a>
          </div>
          <ul class="nav navbar-nav">
           <li><a href="mainController?action=home">Home</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Product
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="mainController?action=iphone&name_account=${full_name}&counter=${counter}">IPhone</a></li>
                  <li><a href="mainController?action=samsung&name_account=${full_name}&counter=${counter}">SamSung</a></li>
                  <li><a href="mainController?action=xiaomi&name_account=${full_name}&counter=${counter}">Xiaomi</a></li>
                  <li><a href="mainController?action=oppo&name_account=${full_name}&counter=${counter}">Oppo</a></li>
                  <li><a href="mainController?action=vsmart&name_account=${full_name}&counter=${counter}">Vsmart</a></li>
                  <li><a href="mainController?action=nokia&name_account=${full_name}&counter=${counter}">Nokia</a></li>
                  <li><a href="mainController?action=realme&name_account=${full_name}&counter=${counter}">Realme</a></li>
                </ul>
              </li>
            <li><a href="#">About Us</a></li>
          </ul>
       
          <ul class="nav navbar-nav navbar-right" >
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Filter
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="mainController?action=price1&name_account=${full_name}&counter=${counter}"><span class="glyphicon glyphicon-arrow-down"></span>&nbsp;3.000.000 VND</a></li>
                  <li><a href="mainController?action=price2&name_account=${full_name}&counter=${counter}">3.000.000 VND<span class="glyphicon glyphicon-arrow-right"></span>6.000.000 VND</a></li>
                  <li><a href="mainController?action=price3&name_account=${full_name}&counter=${counter}">6.000.000 VND<span class="glyphicon glyphicon-arrow-right"></span>15.000.000 VND</a></li>
                  <li><a href="mainController?action=price4&name_account=${full_name}&counter=${counter}">15.000.000 VND<span class="glyphicon glyphicon-arrow-right"></span>30.000.000 VND</a></li>
                  <li><a href="mainController?action=price5&name_account=${full_name}&counter=${counter}"><span class="glyphicon glyphicon-arrow-up"></span>&nbsp; 30.000.000 VND</a></li>             
                </ul>
              </li>  
            <li><a href="${link_list_phone}"><span class="glyphicon glyphicon-shopping-cart">&nbsp;${counter}</span></a></li>
            <li><a href="${link_account}"><span class="glyphicon glyphicon-login"></span>&nbsp;${full_name}</a></li>
            <li><a href="register.jsp"><span class="glyphicon glyphicon-plus"></span>&nbsp;Register</a></li>
            <li><a href="home.jsp"><span class="glyphicon glyphicon-logout"></span>&nbsp;Logout</a></li>
          
          </ul>
          <form class="navbar-form navbar-right" action="mainController">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search hear" name="action">
              <div class="input-group-btn">
                <button class="btn btn-default" type="submit">
                  <i class="glyphicon glyphicon-search"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </nav>
      
       <div class="box_hotSale">
           <table>
                 <tr>
                     <td class="tr_hotSale">
                         <a href="#">
                             <img class="image_hotSale" src="https://cdn.cellphones.com.vn/media/resized//ltsoft/promotioncategory/XIAOMI_CH_NH_H_NG_595_100-a.png" alt="">  
                         </a>
                         
                     </td>
                     <td class="tr_hotSale">
                          <a href="#">
                             <img class="image_hotSale" src="https://cdn.cellphones.com.vn/media/resized//ltsoft/promotioncategory/11lite-595-100-max.png" alt="">
                          </a>              
                     </td>
                 </tr>
                 <tr>
                    <td class="tr_hotSale">
                          <a href="#">
                             <img class="image_hotSale" src="https://cdn.cellphones.com.vn/media/resized//ltsoft/promotioncategory/asrog-595X100_1_.png" alt="">
                          </a>
                    </td>
                    <td class="tr_hotSale">
                         <a href="#">
                           <img class="image_hotSale"   src="https://cdn.cellphones.com.vn/media/resized//ltsoft/promotioncategory/s20fe-c-595x100_7_.png" alt="">
                         </a>
                    </td>
                </tr>
           </table>
      </div>
	<div class="button_brand">
		<table>
			<tr class="tr_brand">
				<td class="td_brand"><a href="mainController?action=iphone&name_account=${full_name}&counter=${counter}"><img class="input_brand"
						src="https://cellphones.com.vn/media/icons/brands/brand-286.svg"
						alt=""></a></td>
				<td class="td_brand"><a href="mainController?action=samsung&name_account=${full_name}&counter=${counter}"><img class="input_brand"
						src="https://cellphones.com.vn/media/icons/brands/brand-211.svg"
						alt=""></a></td>
				<td class="td_brand"><a href="mainController?action=xiaomi&name_account=${full_name}&counter=${counter}"><img class="input_brand"
						src="https://cellphones.com.vn/media/icons/brands/brand-274.svg"
						alt=""></a></td>
				<td class="td_brand"><a href="mainController?action=oppo&name_account=${full_name}&counter=${counter}"><img class="input_brand"
						src="https://cellphones.com.vn/media/icons/brands/brand-769.svg"
						alt=""></a></td>
				<td class="td_brand"><a href="mainController?action=vsmart&name_account=${full_name}&counter=${counter}"><img class="input_brand"
						src="https://cellphones.com.vn/media/icons/brands/brand-vsmart.svg"
						alt=""></a></td>
				<td class="td_brand"><a href="mainController?action=nokia&name_account=${full_name}&counter=${counter}"><img class="input_brand"
						src="https://cellphones.com.vn/media/icons/brands/brand-1214.svg"
						alt=""></a></td>
				<td class="td_brand"><a href="mainController?action=realme&name_account=${full_name}&counter=${counter}"><img class="input_brand"
						src="https://cellphones.com.vn/media/icons/brands/brand-721.svg"
						alt=""></a></td>
			</tr>
		</table>
	</div>
	<div id="box" class="box_phone_title">
        <div class="box_information">
    <!-- Body hear -->
    
    
    <!-- Footer hear -->
  