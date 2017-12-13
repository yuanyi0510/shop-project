<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h5><small>商品分类管理</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<div  class="dataTables_wrapper form-inline" role="grid">
                    		<!-- 查询条件 -->
	                    	<form id="searchForm" method="post" action="/shop-admin/Pcs/selectAll">
		                    	<div class="row">
		                    		<div class="col-sm-6">
		                    			<div class="dataTables_length">
		                    				<a href="/shop-admin/Pcs/toAdd" class="btn btn-primary ">添加分类</a>
		                    			</div>
		                    		</div>
		                    		<div class="col-sm-6">
		                    			<div class="input-group" style="float:right;">
				                            <input type="text" class="form-control" placeholder="分类名字" name="classifySubName">
				                            <div class="input-group-btn">
				                                <button type="button" class="btn btn-primary" onclick="search()">搜索</button>
				                            </div>
				                        </div>
		                    		</div>
		                    	</div>
	                    	</form>
                    		<!-- 查询条件结束 -->
	                        <table class="table table-striped table-bordered table-hover dataTables-example">
	                            <thead>
	                                <tr>
	                                    <th>ID</th>
	                                    <th>子分类名称</th>
	                                    <th>排序</th>
	                                    <th>是否启用</th>
	                                    <th>操作</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items="${pcsList}" var="pcs">
	                            		<tr class="gradeA">
		                            		 <td>${pcs.id}</td>
		                            		 <td>${pcs.classifySubName}</td>
		                            		 <td>${pcs.subOrder}</td>
		                            		 <td>${pcs.subIsOn}</td>
			                                 <td>
			                                 	<a href="/shop-admin/Pcs/toAdd?id=${pcs.id}"><i style="margin-left:5px;" class="fa fa-edit"></i></a>
			                                 	<a href="javascript:;" onclick="del(${pcs.id})"><i style="margin-left:5px;" class="fa fa-trash"></i></a>
			                                 </td>
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
</body>
<script type="text/javascript">
	function search(){
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
</html>
