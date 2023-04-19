<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Donation Detail</title>
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
    
    <link href="${pageContext.request.contextPath}/resources/datatables/tableCustomCss.css" rel="stylesheet">
	
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
                    <a href="${pageContext.request.contextPath}/admin/donationsManagement" class="ms-2"><i class="fa fa-th me-2"></i>Quản lý đợt quyên góp</a>
					
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
                
                  <h5 class="mb-2 font-weight-bold text-primary">Chi tiết đợt quyên góp: ${donation.name}</h5>
                  
                  <div class="row g-3">
					  <div class="col-md-6">
					    <label for="code" class="form-label">Mã đợt quyên góp:</label>
					    <input type="text" class="form-control" id="code" value="${donation.code}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="name" class="form-label">Tên đợt quyên góp:</label>
					    <input type="text" class="form-control" id="name" value="${donation.name}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="startDate" class="form-label">Ngày bắt đầu:</label>
					    <input type="text" class="form-control" id="startDate" value="${donation.startDate}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="endDate" class="form-label">Ngày kết thúc:</label>
					    <input type="text" class="form-control" id="endDate" value="${donation.endDate}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="totalMoney" class="form-label">Tổng tiền quyên góp (VND):</label>
					    <input type="text" class="form-control" id="totalMoney" value="${donation.getMoneyFormatted()}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="status" class="form-label">Trạng thái:</label>
					    <c:choose>
	       					<c:when test="${donation.status == 1}">
	       						<input type="text" class="form-control" id="status" value="Mới tạo" readonly="readonly">
	       					</c:when>
	       					<c:when test="${donation.status == 2}">
	       						<input type="text" class="form-control" id="status" value="Đang quyên góp" readonly="readonly">
	       					</c:when>
	       					<c:when test="${donation.status == 3}">
	       						<input type="text" class="form-control" id="status" value="Kết thúc" readonly="readonly">
	       					</c:when>
	       					<c:otherwise>
	       						<input type="text" class="form-control" id="status" value="Đã đóng" readonly="readonly">
	       					</c:otherwise>
           				</c:choose>
					  </div>
					  
					  <div class="col-md-6">
					    <label for="organization" class="form-label">Tổ chức:</label>
					    <input type="text" class="form-control" id="organization" value="${donation.organizationName}" readonly="readonly">
					  </div>
					  <div class="col-md-6">
					    <label for="phoneNumber" class="form-label">Số điện thoại:</label>
					    <input type="text" class="form-control" id="phoneNumber" value="${donation.phoneNumber}" readonly="readonly">
					  </div>
					  <div class="col-12">
					    <label for="content" class="form-label">Nội dung:</label>
					    <input type="text" class="form-control" id="content" value="${donation.description}" readonly="readonly">
					  </div>
				  </div>
				  
				  <h5 class="mt-4">Danh sách những người quyên góp</h5>
				  
				  <!-- DataTales -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered tableCustomCss" id="dataTable" width="100%" cellspacing="0">
                                   <thead>
                                       <tr>
                                            <th>Họ tên</th>
                                            <th>Tiền quyên góp (VND)</th>
                                            <th>Ngày quyên góp</th>	
                                            <th>Nội dung</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    	<!-- hien thi du lieu tu model "userDonations" -->
                                    	<c:forEach var="tempUserDonation" items="${userDonations}" varStatus="vs">
											
                                    		<!-- construct an "confirm" link with donation id -->
											<c:url var="confirmLink" value="/admin/confirmDonate">
												<c:param name="userDonationId" value="${tempUserDonation.id}" />
											</c:url>
											
											<!-- construct an "cancel confirm" link with donation id -->
											<c:url var="cancelConfirmLink" value="/admin/cancelConfirmDonate">
												<c:param name="userDonationId" value="${tempUserDonation.id}" />
											</c:url>
											
                                    	
                                    		<tr>
                                    			<td>${tempUserDonation.name}</td>
                                    			<td>${tempUserDonation.getMoneyFormatted()}</td>
                                    			<td>${tempUserDonation.created}</td>
                                    			<td>${tempUserDonation.text}</td>
                                    			<td>
                                    				<c:choose>
                                    					<c:when test="${tempUserDonation.status == 0}">
                                    						<span>Chờ xác nhận</span>
                                    					</c:when>
                                    					<c:otherwise>
                                    						<span>Đã xác nhận</span>
                                    					</c:otherwise>
                                    				</c:choose>
                                    			</td>
                                    			
                                    			<td>
                                    				
                                   					<c:choose>
                                   						<c:when test="${tempUserDonation.status == 0}">
                                   							<button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#confirmDonateModal${vs.index}">
													           Xác nhận
													        </button>
                                   						</c:when>
                                   						<c:otherwise>
                                   							<button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#cancelConfirmDonateModal${vs.index}">
													           Hủy xác nhận
													        </button>
                                   						</c:otherwise>
                                   					 </c:choose>
                                   					 
                                   					 <!-- Modal Confirm Donate -->
	                                   				<div class="modal fade" id="confirmDonateModal${vs.index}" tabindex="-1"
								                         aria-labelledby="confirmDonateModalLabel" aria-hidden="true">
								                      <div class="modal-dialog">
								                        <div class="modal-content">
								                          <div class="modal-header">
								                            <h5 class="modal-title" id="confirmDonateModalLabel">Bạn chắc chắn muốn xác nhận?</h5>
								                            <button type="button" class="btn-close" data-bs-dismiss="modal"
								                                    aria-label="Close"></button>
								                          </div>
								                          <div class="modal-body">
								                            <span>Họ tên: ${tempUserDonation.name}</span> <br />
								                            <span>Số tiền quyên góp (VND): ${tempUserDonation.getMoneyFormatted()}</span><br />
								                            <span>Ngày quyên góp: ${tempUserDonation.created}</span><br />
								                            <span>Nội dung: ${tempUserDonation.text}</span>
								                            
								                              <div class="modal-footer" style="margin-top: 20px">
								                                <button type="button" class="btn btn-secondary btn-sm"
								                                        data-bs-dismiss="modal">
								                                  Close
								                                </button>
								                                <a href="${confirmLink}" class="btn btn-success btn-sm">Xác nhận</a>
								                              </div>
								                          </div>
								
								                        </div>
								                      </div>
								                    </div>
								                    <!-- End of Modal Confirm Donate -->
								                    
								                    <!-- Modal Cancel Confirm Donate -->
	                                   				<div class="modal fade" id="cancelConfirmDonateModal${vs.index}" tabindex="-1"
								                         aria-labelledby="cancelConfirmDonateModalLabel" aria-hidden="true">
								                      <div class="modal-dialog">
								                        <div class="modal-content">
								                          <div class="modal-header">
								                            <h5 class="modal-title" id="cancelConfirmDonateModalLabel">Bạn chắc chắn muốn hủy xác nhận?</h5>
								                            <button type="button" class="btn-close" data-bs-dismiss="modal"
								                                    aria-label="Close"></button>
								                          </div>
								                          <div class="modal-body">
								                            <span>Họ tên: ${tempUserDonation.name}</span> <br />
								                            <span>Số tiền quyên góp (VND): ${tempUserDonation.getMoneyFormatted()}</span><br />
								                            <span>Ngày quyên góp: ${tempUserDonation.created}</span><br />
								                            <span>Nội dung: ${tempUserDonation.text}</span>
								                            
								                              <div class="modal-footer" style="margin-top: 20px">
								                                <button type="button" class="btn btn-secondary btn-sm"
								                                        data-bs-dismiss="modal">
								                                  Close
								                                </button>
								                                <a href="${cancelConfirmLink}" class="btn btn-danger btn-sm">Hủy xác nhận</a>
								                              </div>
								                          </div>
								
								                        </div>
								                      </div>
								                    </div>
								                    <!-- End of Modal Cancel Confirm Donate -->
		
                                    			</td>
                                    		</tr>
                                    	</c:forEach>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- end data table -->
				  
				  <div class="mt-3 ms-0">
                  	<a href="${pageContext.request.contextPath}/admin/donationsManagement" class="btn btn-success">Trở lại danh sách đợt quyên góp</a>
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
    
    <!-- Data Tables JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/datatables/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/datatables.js"></script>
</body>

</html>