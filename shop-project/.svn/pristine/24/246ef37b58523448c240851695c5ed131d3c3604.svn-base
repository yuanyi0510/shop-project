<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>商品公告管理</title>
<jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							<small>商品公告管理</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="dataTables_wrapper form-inline" role="grid">
							<!-- 查询条件 -->
							<form id="searchForm" method="post"
								action="/shop-admin/shopnotice/toshopNotice">
								<div class="row">
									<div class="col-sm-2">
										<div class="dataTables_length">
											<a href="/shop-admin/shopnotice/toupdateNotic" class="btn btn-primary ">发布公告</a>
										</div>
									</div>
									<div class="col-sm-7">
										<div class="form-group" id="data_5" style="float: right;">
											<label class="font-noraml">范围选择</label>
											<div class="input-daterange input-group" id="datepicker">
												<input type="text" name="createTime" readonly="readonly"
													class="input form-control" /> <span
													class="input-group-addon">到</span> 
							<input type="text"   name="updateTime" readonly="readonly"  class="input form-control" />
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="input-group" style="float: right;">
											<input type="text" name="noticTitle" class="form-control"
												placeholder="公告标题">
											<div class="input-group-btn">
												<button type="button" onclick="search()"
													class="btn btn-primary">搜索</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- 查询条件结束 -->
							<table
								class="table table-striped table-bordered table-hover dataTables-example">
								<thead>
									<tr>
										<th>ID</th>
										<th>公告标题</th>
										<th>发布时间</th>
										<th>发布人</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="n">
										<tr class="gradeA">
											<td>${n.id }</td>
											<td>${n.noticTitle }</td>
											<td><fmt:formatDate value="${n.createTime }" type="both" /></td>
											<td>${n.createUser }</td>
											<td><a href="/shop-admin/shopnotice/toupdateNotic?id=${n.id }"><i
													style="margin-left: 5px;" class="fa fa-edit"></i></a> <a
												href="javascript:;" onclick="delNotice(${n.id })"><i
													style="margin-left: 5px;" class="fa fa-trash"></i></a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
							<!-- 分页 -->
							<jsp:include page="../common/include_page.jsp" />
							<!-- 分页结束 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../common/include_js.jsp" />
	<script type="text/javascript">
		$(function(){
			$('#data_5 .input-daterange').datepicker({
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });
		})
		
	function search() {
		var first=$("input[name='createTime']")[0].value;
		var second=$("input[name='updateTime']")[0].value;
		var flag=true;
		if(first!=''&&second!=''){
			if(first>second){
				flag=false;
			}
			
		}
		
		 if(flag){
			 $("#searchForm").submit();  
		}else{
			swal("请重新选择搜索时间！", "搜索失败", "error");
		}	
	
	}
	function delNotice(id) {
		  swal({
		        title: "您确定要删除这条信息吗",
		        text: "删除后将无法恢复，请谨慎操作！",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {
		    	$.post("/shop-admin/shopnotice/delNotic?id="+id,function(data){
					if(data=='success'){
						swal({
			                   title: "删除成功！",
			                   text: "您已经永久删除了这条信息。",
			                   type: "success"
			               },function(){
			            	   window.location.reload();
			               });
					}else{
						swal("删除失败！", "删除失败", "error");
					}
				})
		       
		    });
		
	}
	</script>
</body>
</html>
