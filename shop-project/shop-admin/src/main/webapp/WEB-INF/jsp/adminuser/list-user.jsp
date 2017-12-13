<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>用户管理</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<div  class="dataTables_wrapper form-inline" role="grid">
                    		<!-- 查询条件 -->
	                    	<form method="post" id="searchForm" action="/shop-admin/user/touserlist">
		                    	<div class="row">
		                    		<div class="col-sm-2">
		                    			<div class="dataTables_length">
		                    				<a href="/shop-admin/user/toupdate" class="btn btn-primary ">新增用户</a>
		                    			</div>
		                    		</div>
		                    		<div class="col-sm-10">
		                    			<div class="input-group">
		                    				<!-- 根据角色查询 -->
		                    				<select class="form-control" name="roleId">
                                    			<option value="-1">无</option>
                                    			<c:forEach items="${rolelist }" var="r">
                                    			<option value="${r.id }">${r.roleName }</option>
                                    			</c:forEach>
                                    		</select>
		                    			</div>
		                    			<div class="input-group" style="float:right;">
		                    				<!-- 真实姓名 -->
				                            <input type="text" name="truename" class="form-control" placeholder="真实姓名">
				                            <div class="input-group-btn">
				                                <button  type="submit" class="btn btn-primary">搜索</button>
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
	                                    <th>用户名</th>
	                                    <th>真实姓名</th>
	                                    <th>角色</th>
	                                    <th>操作</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:forEach items="${list}" var="u">
	                            		<tr class="gradeA">
		                            		 <td>${u.id }</td>
		                            		 <td>${u.username }</td>
		                            		 <td>${u.truename }</td>
		                            		 <td>${u.role.roleName}</td>
			                                 <td>
			                                 	<a href="/shop-admin/user/toupdate?id=${u.id }"><i style="margin-left:5px;" class="fa fa-edit"></i></a>
			                                 	<a href="javascript:;" onclick="delUser(${u.id })"><i style="margin-left:5px;" class="fa fa-trash"></i></a>
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
function delUser(id) {
	  swal({
	        title: "您确定要删除这条信息吗",
	        text: "删除后将无法恢复，请谨慎操作！",
	        type: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#DD6B55",
	        confirmButtonText: "删除",
	        closeOnConfirm: false
	    }, function () {
	    	$.post("/shop-admin/user/delUser?id="+id,function(data){
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
</html>
