<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增角色</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>新增角色</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="editForm">
                        <input type="hidden" name="id" value="${role.id }">
                        	<div class="form-group">
                                <label class="col-sm-2 control-label">角色名字</label>
                                <div class="col-sm-10">
                                    <input name="roleName" value="${role.roleName }" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                            <c:set value="${role.powerRoleRelation }" var="cps"/>
                                <label class="col-sm-2 control-label">角色权限</label>
                                	<div class="col-sm-10">
                                	<c:forEach  var="p" items="${powers}"> 
                                	
                       				<c:if test="${p.parentId==0 }">
                                		<div>          
	                                    		<label class="checkbox-inline i-checks">
	                                    		<c:set value="" var="ic"/>  
	                                    		
	                                      				<c:forEach items="${cps }" var="cp" >
	                                    				<c:if test="${cp.powerId==p.id }">
	                                    				<c:set value="checked" var="ic"/>  
	                                    				               				
	                                    				</c:if>
	                                    		       </c:forEach>	                                    			                           		
	                                      			<input name="powerId" value="${p.id }" type="checkbox" ${ic} >${p.powerName }
	                                      			
	                                      		</label>
	                                      		
	                                    	</div>
		                                	<div style="margin-left:20px;">
		                                	
		                                	<c:forEach  items="${p.subPowers}" var="sp">
		                                	
		                                	<label class="checkbox-inline i-checks">
		                                	<c:set value="" var="ischecked"/>
		                                	
		                                	<c:forEach items="${cps }" var="cp">
		                                       <c:forEach items="${cp.power.subPowers }" var="s">
	                                    			<c:if test="${s.id==sp.id }">
	                                    				<c:set value="checked" var="ischecked"/>
	                                    			</c:if>
	                                    		</c:forEach>
	                                    	</c:forEach> 
	                                    	                 	
		                                       		<input name="powerId" value="${sp.id}" type="checkbox" ${ischecked }>
		                                       		${sp.powerName }
		                                       
		                                       	</label>
		                                       	
		                                	</c:forEach>
		                                    	
		                                       	
		                                 	</div>
                                
                                		</c:if>
                                	</c:forEach>
                                			
                                	</div>
                                	<label class="col-sm-2 control-label"></label>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" onclick="edit()" type="button">保存内容</button>
                                    <button class="btn btn-white" type="reset">取消</button>
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
	//修改或者增加角色
	function edit() {
		$.post("/shop-admin/role/update",$("#editForm").serialize(),function(data){
			if(data=='success'){
				swal({
	                   title: "操作成功！",
	                   text: "",
	                   type: "success"
	               },function(){
	            	   window.location.href="/shop-admin/role/torole";
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
