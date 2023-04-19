<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Add User</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/ah-bootstrap.min.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/resources/css/admin-home.css" rel="stylesheet">
    
    <style>
    	.error {
			color: red;
		}
	</style>
	
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="${pageContext.request.contextPath}/admin/home" class="navbar-brand mx-4 mb-3">
                    <h4 class="text-primary">QP DONATION</h4>
                </a>
				
                <div class="navbar-nav w-100">
                    <a href="${pageContext.request.contextPath}/admin/usersManagement" class="ms-2 mb-3"><i class="fa fa-user me-2"></i>Quản lý người dùng</a>
                    <a href="#" class="ms-2"><i class="fa fa-th me-2"></i>Quản lý đợt quyên góp</a>
					
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="#" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <span class="d-none d-lg-inline-flex">Welcome ${user.username}!</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="${pageContext.request.contextPath}/admin/logout" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


            <!-- Blank Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row bg-light rounded mx-0 p-2">
                
                  <h5 class="mb-2 font-weight-bold text-primary">Thêm mới người dùng</h5>
                  
                  <form:form action="addUserProcess" modelAttribute="userAdd" method="POST">
                  	<div class="row g-3">
					  <div class="col-md-6">
					    <label class="form-label">Họ và tên:</label>
					    <form:input path="fullName" cssClass="form-control" />
					    <form:errors path="fullName" cssClass="error" />
					  </div>
					  <div class="col-md-6">
					    <label class="form-label">Địa chỉ:</label>
					    <form:input path="address" cssClass="form-control" />
					    <form:errors path="address" cssClass="error" />
					  </div>
					  <div class="col-md-6">
					    <label class="form-label">Email:</label>
					    <form:input path="email" cssClass="form-control" />
					    <form:errors path="email" cssClass="error" />
					  </div>
					  <div class="col-md-6">
					    <label class="form-label">Số điện thoại:</label>
					    <form:input path="phoneNumber" cssClass="form-control" />
					    <form:errors path="phoneNumber" cssClass="error" />
					  </div>
					  <div class="col-md-6">
					    <label class="form-label">Tài khoản:</label>
					    <form:input path="username" cssClass="form-control" />
					    <form:errors path="username" cssClass="error" />
					  </div>
					  <div class="col-md-6">
					    <label class="form-label">Mật khẩu:</label>
					    <form:input path="password" cssClass="form-control" />
					    <form:errors path="password" cssClass="error" />
					  </div>
					  <div class="col-md-6">
					    <label class="form-label">Chọn Vai trò:</label>
					    <form:select path="role.id" cssClass="form-select">
					    	<!-- <form:option value="-1">Chọn loại vai trò</form:option> -->
					    	<form:options items="${roles}" itemLabel="roleName" itemValue="id" />
					    </form:select>
					  </div>
					  <div class="col-md-6">
					    <label class="form-label">Ghi chú:</label>
					    <form:input path="note" cssClass="form-control" />
					  </div>
					  
					  <form:hidden path="status" value="1" />
					  <form:hidden path="created" value="<%= (new SimpleDateFormat(\"yyyy-MM-dd HH:mm:ss\")).format(Calendar.getInstance().getTime()) %>" />
					  
				  	</div>
				  	
				  	<p class="error mt-2">${error_message}</p>
				  	
				  	<div class="mt-3 ms-0">
                  		<a href="${pageContext.request.contextPath}/admin/usersManagement" class="btn btn-secondary">Đóng</a>
				  		<input type="submit" class="btn btn-primary" value="Thêm" />
                  	</div>
				  	
                  </form:form>
                    
                </div>
            </div>
            <!-- Blank End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top">
                    <div class="row">
                        <div class="col-12 text-start copyright">

				            &copy; 2023 Quang Phuong Donation |
				            <i>phuongnq1809@gmail.com | 097.9189.790</i>

                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>


    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/js/admin-home.js"></script>
   
</body>

</html>