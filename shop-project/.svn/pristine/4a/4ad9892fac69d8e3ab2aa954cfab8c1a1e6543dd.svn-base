<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>商品属性管理</title>
<jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							<small>商品属性管理</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="dataTables_wrapper form-inline" role="grid">
							<!-- 查询条件 -->
							<form id="searchForm" method="post" action="/shop-admin/ProductAttr/toProductAttr">
								<div class="row">
									<div class="col-sm-2">
										<div class="dataTables_length">
											<a href="/shop-admin/ProductAttr/toAdd" class="btn btn-primary ">新增属性</a>
										</div>
									</div>
									<div class="col-sm-10">
										<div class="input-group" style="float: right;">
											<input type="text" class="form-control" placeholder="属性名称" name="attrName" value="${productAttr.attrName}">
											<div class="input-group-btn">
												<button type="button" class="btn btn-primary" onclick="save()">搜索</button>
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
										<th>属性名字</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${PaList}" var="pa">
										<tr class="gradeA">
											<td>${pa.id}</td>
											<td>
												<a href="javascript:;"
												onclick="dialogShow(${pa.id})"> <i class="fa fa-plus"></i>
												${pa.attrName}
											</a>
											</td>
											<td><a href="javascript:;"
												onclick="addAttrValue(${pa.id});"><i
													style="margin-left: 5px;" class="fa fa-diamond"></i></a> 
												<a href="/shop-admin/ProductAttr/toAdd?id=${pa.id}"><i
													style="margin-left: 5px;" class="fa fa-edit"></i></a> 
												<a href="javascript:;" onclick="del(${pa.id})"><i style="margin-left: 5px;" class="fa fa-trash"></i></a></td>
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
							<th>属性值</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<td></td>
							<td></td>
							<td><a href='javascript:;'><i class='fa fa-edit'></i></a> 
								<a href='javascript:;'><i style='margin-left: 5px;' class='fa fa-trash'></i></a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	
		function dialogShow(id){
			$("#tbody").empty();
			$.ajax({
				url:"/shop-admin/ProductAttrValue/selectAll?id="+id,
				type:"post",
				success:function(data){
					for(var i=0;i<data.length;i++){
						$("#tbody").append("<tr>");
			    		$("#tbody").append("<td>"+data[i].id+"</td>");
			    		$("#tbody").append("<td>"+data[i].attrValue+"</td>");
			    		$("#tbody").append("<td><a href='/shop-admin/ProductAttr/toAdd?id="+id+"'><i style='margin-left:5px;' class='fa fa-edit'></i></a><a href='javascript:;' onclick='dele("+data[i].id+")'><i style='margin-left:5px;' class='fa fa-trash'></i></a></td>");
			    		$("#tbody").append("</tr>");
					}
					layer.open({
						type : 1,
						skin : 'layui-layer-rim', //加上边框
						area : [ '880px', '540px' ], //宽高
						content : $("#diaLogDiv").html() //内容
					});              
				}
			});

		}
		
		function addAttrValue(attrId){
			swal({   
				title: "新增属性值",   
				text: "",   
				type: "input",   
				showCancelButton: true,   
				closeOnConfirm: false,   
				animation: "slide-from-top",   
				inputPlaceholder: "属性值",
				confirmButtonText: "确定",
                cancelButtonText: "取消",
				//inputValue:"123"  //回显时使用该属性
			}, 
			function(inputValue){   
				if (inputValue === false) 
					return false;      
				if (inputValue === "") {     
					swal.showInputError("属性值不能为空!");     
					return false   
				}else{
					//在这里触发ajax进行新增
					$.ajax({
						url:"/shop-admin/ProductAttrValue/insert?attrValue="+inputValue+"&attrId="+attrId,
						type:"post",
						success:function(data){
							if(data=="success"){
								swal({
					                   title: "操作成功！",
					                   text: "",
					                   type: "success"
					               },function(){
					            	   window.location.href="/shop-admin/ProductAttr/toProductAttr";
					               });
							}
							return false;
						}
					})
				}
				
			});
		}
		
		function editAttrValue(){
					//在ajax的success方法中将查询到的属性值绑定到inputValue属性上
					swal({   
						title: "修改属性值",   
						text: "",   
						type: "input",   
						showCancelButton: true,   
						closeOnConfirm: false,   
						animation: "slide-from-top",   
						inputPlaceholder: "属性值",
						confirmButtonText: "确定",
		                cancelButtonText: "取消",
						inputValue:"123"  //回显时使用该属性
					}, 
					function(inputValue,event){   
						if (inputValue === false) 
							return false;      
						if (inputValue === "") {     
							swal.showInputError("属性值不能为空!");     
							return false   
						}else{
							//在这里触发ajax进行修改
							
						}
					})
		}
		function save(){
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
					url:"/shop-admin/ProductAttr/del?id="+id,
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
					url:"/shop-admin/ProductAttrValue/dele?id="+id,
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
