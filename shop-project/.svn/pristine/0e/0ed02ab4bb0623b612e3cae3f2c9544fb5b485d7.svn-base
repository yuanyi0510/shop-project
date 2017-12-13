<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>用户</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="editForm" >
                        <input type="hidden" name="id" value="${user.id }">
                        	<div class="form-group">
                                <label class="col-sm-2 control-label">用户名</label>

                                <div class="col-sm-10">
                                    <input  type="text" name="username" value="${user.username }" class="form-control" placeholder="用户名">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input  type="text"  name="password" value="${user.password }" class="form-control" placeholder="密码">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">真实姓名</label>
                                <div class="col-sm-10">
                                    <input  type="text" name="truename" value="${user.truename }" class="form-control" placeholder="真实姓名">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">角色</label>
                                <div class="col-sm-10">
                                    <select class="form-control m-b" name="roleId">
                                    	<c:forEach items="${rolelist }" var="r">
                                    		<option value="${r.id }" ${user.roleId==r.id?'selected':'' }>${r.roleName }</option>
                                    	</c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="button" onclick="edit()">保存</button>
                                    <button class="btn btn-white" type="reset" onclick="">取消</button>
                                </div>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/include_js.jsp" />

</body>
<script type="text/javascript">
	$(document).ready(function () {
	    $('.i-checks').iCheck({
	        checkboxClass: 'icheckbox_square-green',
	        radioClass: 'iradio_square-green',
	    });
	});
	
	function edit() {
		$.post("/shop-admin/user/update",$("#editForm").serialize(),function(data){
			if(data=='success'){
				swal({
	                   title: "操作成功！",
	                   text: "",
	                   type: "success"
	               },function(){
	            	   window.location.href="/shop-admin/user/touserlist";
	               });
				
			}else{
				swal({
	                   title: "操作失败",
	                   text: "",
	                   type: "error"
	               });
			}
		})
	}
</script>
</html>
