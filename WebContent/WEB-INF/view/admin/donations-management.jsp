<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Donations Management</title>
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


            <!-- Donations Management Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row bg-light rounded mx-0">
                    <div class="col-12 p-3">
                    
                    <h5 class="mb-2 font-weight-bold text-primary">Danh sách các đợt quyên góp</h5>
                    
                    <!-- DataTales -->
                    <div class="card shadow mb-4">
                    
                        <div class="card-header py-3">
                            <!-- <a href="${pageContext.request.contextPath}/admin/addDonation" class="btn btn-success">Thêm mới</a> -->
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addDonationModal">
				              Thêm mới
				            </button>
				            
				            <!-- Modal Add-->
				            <div class="modal fade" id="addDonationModal" tabindex="-1" aria-labelledby="addDonationModalLabel"
				                 aria-hidden="true">
				              <div class="modal-dialog modal-lg">
				                <div class="modal-content">
				                  <div class="modal-header">
				                    <h5 class="modal-title" id="">Thêm mới đợt quyên góp</h5>
				                    <button type="button" class="btn-close" data-bs-dismiss="modal"
				                            aria-label="Close"></button>
				                  </div>
				                  <div class="modal-body">
				                    <form action="addDonationProcess" method="post">
				                      <div class="row">
				                        <div class="col-6">
				                          <label for="addcode"
				                                 class="col-form-label">Mã đợt quyên góp:</label>
				                          <input type="text" class="form-control"
				                                 id="addcode" name="code" required>
				                        </div>
				                        <div class="col-6">
				                          <label for="addname"
				                                 class="col-form-label">Tên đợt quyên góp:</label>
				                          <input type="text" class="form-control"
				                                 id="addname" name="name" required>
				                        </div>
				                      </div>
				                      <div class="row">
				                        <div class="col-6">
				                          <label for="addStartDate"
				                                 class="col-form-label">Ngày bắt đầu:</label>
				                          <input type="date" class="form-control"
				                                 id="addStartDate" name="startDate" required>
				                        </div>
				                        <div class="col-6">
				                          <label for="addEndDate"
				                                 class="col-form-label">Ngày kết thúc:</label>
				                          <input type="date" class="form-control"
				                                 id="addEndDate" name="endDate" required>
				                        </div>
				                      </div>
				                      <div class="row">
				                        <div class="col-6">
				                          <label for="addOrganization"
				                                 class="col-form-label">Tổ chức:</label>
				                          <input type="text" class="form-control"
				                                 id="addOrganization" name="organization" required>
				                        </div>
				                        <div class="col-6">
				                          <label for="addphone"
				                                 class="col-form-label">Số điện thoại:</label>
				                          <input type="number" class="form-control"
				                                 id="addphone" name="phone" required>
				                        </div>
				                        <div class="col-12">
				                          <label for="ct_id" class="col-form-label">Nội dung:</label>
				                          <textarea name="description" class="form-control" cols="50" rows="5">Nhập nội dung</textarea>
				                        </div>
				                      </div>
				                      <div class="modal-footer">
				                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
				                        <button type="submit" class="btn btn-primary">Thêm </button>
				                      </div>
				                    </form>
				                  </div>
				
				                </div>
				              </div>
				            </div>
				            <!-- End of Modal Add-->
				            
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered tableCustomCss" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Tên</th>
                                            <th>Ngày bắt đầu</th>
                                            <th>Ngày kết thúc</th>
                                            <th>Tổ chức</th>
                                            <th>Số điện thoại</th>
                                            <th>Tổng tiền (VND)</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	
                                    	<!-- hien thi du lieu tu model "donations" -->
                                    	<c:forEach var="tempDonation" items="${donations}" varStatus="vs">
                                    		
                                    		<!-- construct an "update" link with donation id -->
											<c:url var="updateLink" value="/admin/updateDonation">
												<c:param name="donationId" value="${tempDonation.id}" />
											</c:url>
											
											<!-- construct an "detail" link with donation id -->
											<c:url var="detailLink" value="/admin/donationDetail">
												<c:param name="donationId" value="${tempDonation.id}" />
											</c:url>
											
											<!-- construct an "delete" link with donation id -->
											<c:url var="deleteLink" value="/admin/deleteDonation">
												<c:param name="donationId" value="${tempDonation.id}" />
											</c:url>
											
											<!-- construct an "change status" link with donation id -->
											<c:url var="changeStatusLink" value="/admin/changeDonationStatus">
												<c:param name="donationId" value="${tempDonation.id}" />
											</c:url>
                                    	
                                    		<tr>
                                    			<td>${tempDonation.code}</td>
                                    			<td>${tempDonation.name}</td>
                                    			<td>${tempDonation.startDate}</td>
                                    			<td>${tempDonation.endDate}</td>
                                    			<td>${tempDonation.organizationName}</td>
                                    			<td>${tempDonation.phoneNumber}</td>
                                    			<td>${tempDonation.getMoneyFormatted()}</td>
                                    			
                                    			<td>
                                    				<c:choose>
                                    					<c:when test="${tempDonation.status == 1}">
                                    						<strong style="color: #198754;">Mới tạo</strong>
                                    					</c:when>
                                    					<c:when test="${tempDonation.status == 2}">
                                    						<strong style="color: #198754;">Đang quyên góp</strong>
                                    					</c:when>
                                    					<c:when test="${tempDonation.status == 3}">
                                    						<strong style="color: #198754;">Kết thúc</strong>
                                    					</c:when>
                                    					<c:otherwise>
                                    						<strong style="color: red;">Đã đóng</strong>
                                    					</c:otherwise>
                                    				</c:choose>
                                    			</td>
                                    			<td>
                                    				
                                    					<!-- neu dot quyen gop o trang thai "da dong" thi ko hien thi btn cap nhat thong tin -->
                                    					<c:choose>
                                    						<c:when test="${tempDonation.status == 4}">
                                    							<div class="actions"><a href="${detailLink}" class="btn btn-warning btn-sm" id="">Chi tiết</a></div>
                                    						</c:when>
                                    						<c:otherwise>
                                    						<div class="d-flex justify-content-start">
                                    							<button type="button" class="btn btn-primary btn-sm actions_btn" data-bs-toggle="modal" data-bs-target="#updateDonationModal${vs.index}">
														           Cập nhật
														        </button>
													            <div class="actions"><a href="${detailLink}" class="btn btn-warning btn-sm" id="">Chi tiết</a></div>
													         </div>
                                    						</c:otherwise>
                                    					  </c:choose>
                                    					  
                                    							<!-- Modal Update-->
													            <div class="modal fade" id="updateDonationModal${vs.index}" tabindex="-1" aria-labelledby="updateDonationModalLabel"
													                 aria-hidden="true">
													              <div class="modal-dialog modal-lg">
													                <div class="modal-content">
													                  <div class="modal-header">
													                    <h5 class="modal-title" id="">Cập nhật đợt quyên góp</h5>
													                    <button type="button" class="btn-close" data-bs-dismiss="modal"
													                            aria-label="Close"></button>
													                  </div>
													                  <div class="modal-body">
													                    <form action="updateDonationProcess" method="post">
													                      <div class="row">
													                        <div class="col-6">
													                          <label for="addcode"
													                                 class="col-form-label">Mã đợt quyên góp:</label>
													                          <input type="text" class="form-control"
													                                 id="addcode" name="code" value="${tempDonation.code}" required>
													                        </div>
													                        <div class="col-6">
													                          <label for="addname"
													                                 class="col-form-label">Tên đợt quyên góp:</label>
													                          <input type="text" class="form-control"
													                                 id="addname" name="name" value="${tempDonation.name}" required>
													                        </div>
													                      </div>
													                      <div class="row">
													                        <div class="col-6">
													                          <label for="addStartDate"
													                                 class="col-form-label">Ngày bắt đầu:</label>
													                          <input type="date" class="form-control"
													                                 id="addStartDate" name="startDate" value="${tempDonation.startDate}" required>
													                        </div>
													                        <div class="col-6">
													                          <label for="addEndDate"
													                                 class="col-form-label">Ngày kết thúc:</label>
													                          <input type="date" class="form-control"
													                                 id="addEndDate" name="endDate" value="${tempDonation.endDate}" required>
													                        </div>
													                      </div>
													                      <div class="row">
													                        <div class="col-6">
													                          <label for="addOrganization"
													                                 class="col-form-label">Tổ chức:</label>
													                          <input type="text" class="form-control"
													                                 id="addOrganization" name="organization" value="${tempDonation.organizationName}" required>
													                        </div>
													                        <div class="col-6">
													                          <label for="addphone"
													                                 class="col-form-label">Số điện thoại:</label>
													                          <input type="number" class="form-control"
													                                 id="addphone" name="phone" value="${tempDonation.phoneNumber}" required>
													                        </div>
													                        <div class="col-12">
													                          <label for="ct_id" class="col-form-label">Nội dung:</label>
													                          <textarea name="description" class="form-control" cols="50" rows="5">${tempDonation.description}</textarea>
													                        </div>
													                      </div>
													                      
													                      <!-- id cua donation tuong ung -->
													                      <input type="hidden" name="id" value="${tempDonation.id}" />
													                      
													                      <div class="modal-footer">
													                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
													                        <button type="submit" class="btn btn-primary">Cập nhật</button>
													                      </div>
													                    </form>
													                  </div>
													
													                </div>
													              </div>
													            </div>
													            <!-- End of Modal Update-->
                                    						
                                    					
		                                   				
		                                   			
		                                   			<div class="d-flex justify-content-start mt-1">
		                                   				<button type="button" class="btn btn-danger btn-sm actions_btn" data-bs-toggle="modal" data-bs-target="#deleteDonationModal${vs.index}">
												           Xóa
												        </button>
		                                   				
		                                   				<!-- Modal Delete -->
		                                   				<div class="modal fade" id="deleteDonationModal${vs.index}" tabindex="-1"
										                         aria-labelledby="deleteDonationModalLabel" aria-hidden="true">
										                      <div class="modal-dialog">
										                        <div class="modal-content">
										                          <div class="modal-header">
										                            <h5 class="modal-title" id="deleteDonationModalLabel">Bạn chắc chắn muốn xóa?</h5>
										                            <button type="button" class="btn-close" data-bs-dismiss="modal"
										                                    aria-label="Close"></button>
										                          </div>
										                          <div class="modal-body">
										                            Đợt quyên góp : <span>${tempDonation.name}</span>
										                              <div class="modal-footer" style="margin-top: 20px">
										                                <button type="button" class="btn btn-secondary btn-sm"
										                                        data-bs-dismiss="modal">
										                                  Close
										                                </button>
										                                <a href="${deleteLink}" class="btn btn-danger btn-sm">Xóa</a>
										                              </div>
										                          </div>
										
										                        </div>
										                      </div>
										                    </div>
										                    <!-- End of Modal Delete -->
										                    
		                                   				<c:choose>
	                                    					<c:when test="${tempDonation.status == 1}">
	                                    						<div class="actions"><a href="${changeStatusLink}" class="btn btn-success btn-sm" onclick="if(!(confirm('Bạn có chắc chắn muốn thay đổi trạng thái của đợt quyên góp: ${tempDonation.name}?'))) return false">Quyên góp</a></div>
	                                    					</c:when>
	                                    					<c:when test="${tempDonation.status == 2}">
	                                    						<div class="actions"><a href="${changeStatusLink}" class="btn btn-success btn-sm" onclick="if(!(confirm('Bạn có chắc chắn muốn thay đổi trạng thái của đợt quyên góp: ${tempDonation.name}?'))) return false">Kết thúc</a></div>
	                                    					</c:when>
	                                    					<c:when test="${tempDonation.status == 3}">
	                                    						<div class="actions"><a href="${changeStatusLink}" class="btn btn-danger btn-sm" onclick="if(!(confirm('Bạn có chắc chắn muốn thay đổi trạng thái của đợt quyên góp: ${tempDonation.name}?'))) return false">Đóng</a></div>
	                                    					</c:when>
	                                    					<c:otherwise>
	                                    						<!--  -->
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