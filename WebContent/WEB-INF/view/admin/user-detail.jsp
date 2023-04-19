<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>User Detail</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/ah-bootstrap.min.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/resources/css/admin-home.css" rel="stylesheet">
	
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
                
                  <h5 class="mb-2 font-weight-bold text-primary">Chi tiết người dùng: ${user.username}</h5>
                  
                  <div class="row g-3">
					  <div class="col-md-6">
					    <label for="fullName" class="form-label">Họ và tên:</label>
					    <input type="text" class="form-control" id="fullName" value="${user.fullName}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="address" class="form-label">Địa chỉ:</label>
					    <input type="text" class="form-control" id="address" value="${user.address}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="email" class="form-label">Email:</label>
					    <input type="text" class="form-control" id="email" value="${user.email}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="phoneNumber" class="form-label">Số điện thoại:</label>
					    <input type="text" class="form-control" id="phoneNumber" value="${user.phoneNumber}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="username" class="form-label">Username:</label>
					    <input type="text" class="form-control" id="username" value="${user.username}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="role" class="form-label">Vai trò:</label>
					    <input type="text" class="form-control" id="role" value="${user.role.getRoleName()}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="status" class="form-label">Trạng thái:</label>
					    <c:choose>
	       					<c:when test="${user.status == 1}">
	       						<input type="text" class="form-control" id="status" value="Hoạt động" readonly="readonly">
	       					</c:when>
	       					<c:otherwise>
	       						<input type="text" class="form-control" id="status" value="Đã khóa" readonly="readonly">
	       					</c:otherwise>
           				</c:choose>
					    
					  </div>
					  <div class="col-md-6">
					    <label for="created" class="form-label">Ngày tạo:</label>
					    <input type="text" class="form-control" id="created" value="${user.created}" readonly="readonly">
					  </div>
				  </div>
				  
				  <div class="mt-3 ms-0">
                  	<a href="${pageContext.request.contextPath}/admin/usersManagement" class="btn btn-success">Trở lại danh sách user</a>
                  </div>
                    
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