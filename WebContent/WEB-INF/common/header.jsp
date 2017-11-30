<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- banner -->
  <div id="banner" class="col-sm">
    <img src="img/ebook.png" width="70" height="70" />
    <h4>THƯ VIỆN ĐỀ THI</h4>
    <span id="cs_call">
    	<span class="cs_call_des">Call:</span> +84988565410 | 
    	<span class="cs_call_des">Email:</span> Luu@gmail.com
    </span>
  </div>
<!--Sheet2-->
  <nav class="navbar navbar-expand-md bg-dark navbar-dark sheet2">
     <a class="navbar-brand" href="../index.jsp">
        <span class="material-icons">home </span>Home
    </a>
    <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
    <!-- Dropdown -->
    <li class="nav-item dropdown">
    	<!-- Dropdown button -->
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <span class="material-icons">person</span>
      </a>
      <!-- Dropdown panel -->
      <div class="dropdown-menu" id="cs_dropdown">
        <table class="table table-responsive-md table-hover dropdown-item">
        		<tr>
        			<td>
        				<strong>Tên đăng nhập:</strong>
        			</td>      				
        			<td>
        				${ sessionScope.loginBean.username }
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<strong>Họ tên:</strong>
        			</td>
        			<td>
        				${sessionScope.loginBean.name}
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<strong>Số điện thoại:</strong>
        			</td>
        			<td>
        				${sessionScope.loginBean.phoneNumber}
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<strong>Email:</strong>
        			</td>
        			<td>
        				${sessionScope.loginBean.email}
        			</td>
        		</tr>
        	</table>
        <hr />
        <a href="Logout" style="text-decoration: none;">
        	<button type="submit" class="btn btn-block btn-danger">Đăng xuất</button>
        </a>
      </div>
    </li>
  </ul>
  </div>
  </nav>