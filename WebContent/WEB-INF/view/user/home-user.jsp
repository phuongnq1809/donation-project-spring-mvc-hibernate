<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap Core CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    
     <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/datatables/sb-admin-2.min.css" rel="stylesheet"> 
    
    <link href="${pageContext.request.contextPath}/resources/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> 
    
    <link href="${pageContext.request.contextPath}/resources/css/ah-bootstrap.min.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/resources/datatables/tableCustomCss.css" rel="stylesheet">
	
    <!-- Custom styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user-home.css" />

    <title>User Home Page</title>
  </head>
  <body>
    <!-- BANNER -->
    <section class="container-fluid banner">

         <div class="navbar-nav align-items-end mx-auto">
             <div class="nav-item dropdown">
                 <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                     <span class="d-none d-lg-inline-flex fw-bold p-2">Welcome ${user.username}!</span>
                 </a>
                 <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                     <a href="${pageContext.request.contextPath}/user/logout" class="dropdown-item">Log Out</a>
                 </div>
             </div>
         </div>

    </section>

    <!-- DANH SACH CAC DOT QUYEN GOP -->
    <section id="project" class="container-fluid p-0">
      <div class="container py-4">
        <h2 class="text-center">Danh sách các đợt quyên góp</h2>
        
        <!-- DataTales -->
                    <div class="card shadow mb-4">
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered tableCustomCss" id="dataTable" width="100%" cellspacing="0">
                                   <thead>
                                       <tr>
                                            <th>Tên đợt quyên góp</th>
                                            <th>Ngày bắt đầu</th>
                                            <th>Ngày kết thúc</th>	
                                            <th>Tổ chức</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    	<!-- hien thi du lieu tu model "donations" -->
                                    	<c:forEach var="tempDonation" items="${donations}" varStatus="vs">
                                    		
                                    		<!-- construct an "detail" link with donation id -->
											<c:url var="detailLink" value="/user/donationDetail">
												<c:param name="donationId" value="${tempDonation.id}" />
											</c:url>
											
                                    		<!-- construct an "update" link with donation id -->
											<c:url var="updateLink" value="/user/updateDonation">
												<c:param name="donationId" value="${tempDonation.id}" />
											</c:url>
											
											
                                    	
                                    		<tr>
                                    			<td>
                                    				<a href="${detailLink}">${tempDonation.name}</a> <br />
                                    				<c:choose>
                                    					<c:when test="${tempDonation.status == 1}">
                                    						<span class="fst-italic" style="color: #777;">Mới tạo</span>
                                    					</c:when>
                                    					<c:when test="${tempDonation.status == 2}">
                                    						<span class="fst-italic" style="color: #777;">Đang quyên góp</span>
                                    					</c:when>
                                    					<c:when test="${tempDonation.status == 3}">
                                    						<span class="fst-italic" style="color: #777;">Kết thúc</span>
                                    					</c:when>
                                    					<c:otherwise>
                                    						<span class="fst-italic" style="color: #777;">Đã đóng</span>
                                    					</c:otherwise>
                                    				</c:choose>
                                    			</td>
                                    			<td>${tempDonation.startDate}</td>
                                    			<td>${tempDonation.endDate}</td>
                                    			<td>
                                    				${tempDonation.organizationName} <br />
                                    				<span class="fst-italic" style="color: #777;">${tempDonation.phoneNumber}</span>
                                    			</td>
                                    			
                                    			<td>
                                    				
                                    					<c:choose>
                                    						<c:when test="${tempDonation.status == 2}">
	                                    						<div class="d-flex justify-content-start">
	                                    							<button type="button" class="btn btn-success btn-sm actions_btn" data-bs-toggle="modal" data-bs-target="#donateModal${vs.index}">
															           Quyên góp
															        </button>
														         </div>
                                    						</c:when>
                                    						<c:otherwise>
                                    							<!--  -->
                                    						</c:otherwise>
                                    					 </c:choose>
                                    					  
                                    							<!-- Modal Donate-->
													            <div class="modal fade" id="donateModal${vs.index}" tabindex="-1" aria-labelledby="donateModalLabel"
													                 aria-hidden="true">
													              <div class="modal-dialog modal-lg">
													                <div class="modal-content">
													                  <div class="modal-header">
													                    <h5 class="modal-title" id="">Quyên góp: ${tempDonation.name}</h5>
													                    <button type="button" class="btn-close" data-bs-dismiss="modal"
													                            aria-label="Close"></button>
													                  </div>
													                  <div class="modal-body">
													                    <form action="donateProcess" method="post">
													                      <div class="row">
													                        <div class="col-12">
													                          <label for="addname"
													                                 class="col-form-label">Họ và tên:</label>
													                          <input type="text" class="form-control"
													                                 id="addname" name="name" required>
													                        </div>
													                        <div class="col-12">
													                          <label for=""
													                                 class="col-form-label">Số tiền quyên góp (VND):</label>
													                          <input type="text" class="form-control"
													                                 id="typeNumber" name="money" required />
													                        </div>
													                        <div class="col-12">
													                          <label class="col-form-label">Lời nhắn:</label>
													                          <textarea name="text" class="form-control" cols="50" rows="5"></textarea>
													                        </div>
													                      </div>
													                      
													                      <!-- id cua donation tuong ung -->
													                      <input type="hidden" name="donation_id" value="${tempDonation.id}" />
													                      <input type="hidden" name="user_id" value="${user.id}" />
													                      
													                      <div class="modal-footer">
													                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
													                        <button type="submit" class="btn btn-success">Quyên góp</button>
													                      </div>
													                    </form>
													                  </div>
													
													                </div>
													              </div>
													            </div>
													            <!-- End of Modal Donate-->
                                    						
                                    			</td>
                                    		</tr>
                                    	</c:forEach>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- end data table -->
        
      </div>
    </section>

    <!-- FOOTER -->
    <section id="footer" class="container-fluid p-0">
      <div class="footer-container mx-auto text-center">
        &copy; 2023 Quang Phuong Donation | <i>phuongnq1809@gmail.com | 097.9189.790 </i>
      </div>
    </section>

    <!-- Bootstrap Javascript Bundle -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- Data Tables JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/datatables/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/datatables-user-home.js"></script>
    
    <!-- JS for format currency input text donate -->
	<script>
		//
	</script>
	
  </body>
</html>
