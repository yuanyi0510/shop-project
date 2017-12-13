<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>商品分类管理</title>
<jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							<small>商品分类管理</small>
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
								action="/shop-admin/Pc/selectAll">
								<div class="row">
									<div class="col-sm-6">
										<div class="dataTables_length">
											<a href="/shop-admin/Pc/toAdd" class="btn btn-primary ">添加分类</a>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="input-group" style="float: right;">
											<input type="text" class="form-control" placeholder="分类名字"
												name="classifyName">
											<div class="input-group-btn">
												<button type="button" class="btn btn-primary"
													onclick="submits()">搜索</button>
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
										<th>分类名字</th>
										<th>排序</th>
										<th>是否启用</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${pcList}" var="pc">
										<tr class="gradeA">
											<td>${pc.id}</td>
											<td><a href="javascript:;"
												onclick="dialogShow(${pc.id})"> <i class="fa fa-plus"></i>
											</a> ${pc.classifyName}</td>
											<td>${pc.cOrder}</td>
											<td>${pc.isOn}</td>
											<td><a href="/shop-admin/Pc/toAdd?id=${pc.id}"><i
													style="margin-left: 5px;" class="fa fa-edit"></i></a> <a
												href="javascript:;" onclick="del(${pc.id})"><i
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

	<!-- 弹窗 -->
	<div id="diaLogDiv" style="display: none;">
		<div class="ibox-content">
			<div class="dataTables_wrapper form-inline" role="grid">
				<table
					class="table table-striped table-bordered table-hover dataTables-example">
					<thead>
						<tr>
							<th>ID</th>
							<th>分类名字</th>
							<th>排序</th>
							<th>是否启用</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="tbody">

					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Page-Level Scripts -->
	<script>
    	var layer_index;
		function dialogShow(id){
			$("#tbody").empty();
			$.ajax({
				url:"/shop-admin/Pcs/selectPcsbyId?id="+id,
			    type:"post",
			    success:function(data){
			    	for(var i=0;i<data.length;i++){
			    		$("#tbody").append("<tr>");
			    		$("#tbody").append("<td>"+data[i].id+"</td>");
			    		$("#tbody").append("<td>"+data[i].classifySubName+"</td>");
			    		$("#tbody").append("<td>"+data[i].subOrder+"</td>");
			    		$("#tbody").append("<td>"+data[i].subIsOn+"</td>");
			    		$("#tbody").append("<td><a href='/shop-admin/Pcs/toAdd?id="+data[i].id+"'><i style='margin-left:5px;' class='fa fa-edit'></i></a><a href='javascript:;' onclick='dele("+data[i].id+")'><i style='margin-left:5px;' class='fa fa-trash'></i></a></td>");
			    		$("#tbody").append("</tr>");
			    	}
			    	layer_index = layer.open({
						type : 1,
						skin : 'layui-layer-rim', //加上边框
						area : [ '880px', '540px' ], //宽高
						content : $("#diaLogDiv").html() //内容
					});
			    }
			})
		}
		function submits(){
			$("#searchForm").submit();
		} 
		
		function del(id){
		    swal({
		        title: "您确定要删除这条信息吗",
		        text: "删除后将无法恢复，请谨慎操作！",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {
		    	$.ajax({
					url:"/shop-admin/Pc/del?id="+id,
					type:"post",
					success:function(data){
					if(data=="success"){
		        swal({
			        title: "删除成功",
			        text: "",
			        type: "success"
			         },function(){
		           window.location.reload();
			                     });
					 }else{
						 swal({
						        title: "删除失败",
						        text: "本类中包含子类",
						        type: "error"
						         },function(){ });
					 }
					}
				})
		    });
		}	
		function dele(id){
		    swal({
		        title: "您确定要删除这条信息吗",
		        text: "删除后将无法恢复，请谨慎操作！",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {
		    	$.ajax({
					url:"/shop-admin/Pcs/del?id="+id,
					type:"post",
					success:function(data){
		        swal({
			        title: "删除成功",
			        text: "",
			        type: "success"
			         },function(){
		           window.location.reload();
			                     });
					}
				})
		    });
		}
    </script>
</body>
</html>
