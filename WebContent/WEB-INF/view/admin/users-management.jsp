<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Users Management</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/datatables/sb-admin-2.min.css" rel="stylesheet"> 
    
    <link href="${pageContext.request.contextPath}/resources/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> 
    
    <link href="${pageContext.request.contextPath}/resources/css/ah-bootstrap.min.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/resources/css/admin-home.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/resources/datatables/tableCustomCss.css" rel="stylesheet">
    
    
	
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="home" class="navbar-brand mx-4 mb-3">
                    <h4 class="text-primary">QP DONATION</h4>
                </a>
				
                <div class="navbar-nav w-100">
                    <a href="usersManagement" class="ms-2 mb-3"><i class="fa fa-user me-2"></i>Quản lý người dùng</a>
                    <a href="donationsManagement" class="ms-2"><i class="fa fa-th me-2"></i>Quản lý đợt quyên góp</a>
					
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


            <!-- Users Management Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row bg-light rounded mx-0">
                    <div class="col-12 p-3">
                    
                    <h5 class="mb-2 font-weight-bold text-primary">Danh sách người dùng</h5>
                    
                    <!-- DataTales -->
                    <div class="card shadow mb-4">
                    
                        <div class="card-header py-3">
                            <a href="${pageContext.request.contextPath}/admin/addUser" class="btn btn-success">Thêm mới</a>
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered tableCustomCss" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Họ và tên</th>
                                            <th>Email</th>
                                            <th>Số điện thoại</th>
                                            <th>Tài khoản</th>
                                            <th>Vai trò</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	
                                    	<!-- hien thi du lieu tu model "users" -->
                                    	<c:forEach var="tempUser" items="${users}">
                                    		
                                    		<!-- construct an "update" link with user id -->
											<c:url var="updateLink" value="/admin/updateUser">
												<c:param name="userId" value="${tempUser.id}" />
											</c:url>
											
											<!-- construct an "detail" link with user id -->
											<c:url var="detailLink" value="/admin/usersManagement/userDetail">
												<c:param name="userId" value="${tempUser.id}" />
											</c:url>
											
											<!-- construct an "delete" link with user id -->
											<c:url var="deleteLink" value="/admin/deleteUser">
												<c:param name="userId" value="${tempUser.id}" />
											</c:url>
											
											<!-- construct an "change status" link with user id -->
											<c:url var="changeStatusLink" value="/admin/changeUserStatus">
												<c:param name="userId" value="${tempUser.id}" />
											</c:url>
                                    	
                                    		<tr>
                                    			<td>${tempUser.fullName}</td>
                                    			<td>${tempUser.email}</td>
                                    			<td>${tempUser.phoneNumber}</td>
                                    			<td>${tempUser.username}</td>
                                    			<td>${tempUser.role.getRoleName()}</td>
                                    			<td>
                                    				<c:choose>
                                    					<c:when test="${tempUser.status == 1}">
                                    						<strong style="color: #198754;">Hoạt động</strong>
                                    					</c:when>
                                    					<c:otherwise>
                                    						<strong style="color: red;">Đã khóa</strong>
                                    					</c:otherwise>
                                    				</c:choose>
                                    			</td>
                                    			<td>
                                    				<div class="d-flex justify-content-start">
                                    					<div class="actions"><a href="${updateLink}" class="btn btn-primary btn-sm">Sửa</a></div>
		                                   				<div class="actions"><a href="${detailLink}" class="btn btn-warning btn-sm">Chi tiết</a></div>
		                                   				
		                                   				<div class="actions"><a href="${deleteLink}" class="btn btn-danger btn-sm" onclick="if(!(confirm('Bạn có chắc chắn muốn xóa user: ${tempUser.username}?'))) return false">Xóa</a></div>
		                                   				<c:choose>
	                                    					<c:when test="${tempUser.status == 1}">
	                                    						<div class="actions"><a href="${changeStatusLink}" class="btn btn-danger btn-sm" onclick="if(!(confirm('Bạn có chắc chắn muốn khóa user: ${tempUser.username}?'))) return false">Khóa</a></div>
	                                    					</c:when>
	                                    					<c:otherwise>
	                                    						<div class="actions"><a href="${changeStatusLink}" class="btn btn-success btn-sm" onclick="if(!(confirm('Bạn có chắc chắn muốn mở khóa user: ${tempUser.username}?'))) return false">Mở</a></div>
	                                    					</c:otherwise>
                                    					</c:choose>
		                                   				
                                    				</div>
                                    			</td>
                                    		</tr>
                                    	</c:forEach>
                                    
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- end data table -->
                        
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


    <!-- Home admin Javascript -->
    <script src="${pageContext.request.contextPath}/resources/js/admin-home.js"></script>
    
    <!-- Data Tables JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/datatables/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/datatables.js"></script>
    
    
    
    
</body>

</html>