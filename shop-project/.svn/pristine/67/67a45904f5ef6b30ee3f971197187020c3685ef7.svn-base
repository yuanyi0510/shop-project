<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>权限管理</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>权限管理</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<div  class="dataTables_wrapper form-inline" role="grid">
                    		<!-- 查询条件 -->
	                    	<form id="searchForm" method="post" action="/shop-admin/power/topower">
		                    	<div class="row">
		                    		<div class="col-sm-6">
		                    			<div class="dataTables_length">
		                    				<a href="/shop-admin/power/toupdate" class="btn btn-primary ">新增权限</a>
		                    			</div>
		                    		</div>
		                    		<div class="col-sm-6">
		                    			<div class="input-group" style="float:right;">
				                            <input type="text" name="powerName" class="form-control" placeholder="权限名字">
				                            <div class="input-group-btn">
				                                <button type="submit" class="btn btn-primary">搜索</button>
				                            </div>
				                        </div>
		                    		</div>
		                    	</div>
	                    	</form>
                    		<!-- 查询条件结束 -->
	                        <table class="table table-striped table-bordered table-hover dataTables-example">
	                            <thead>
	                                <tr>
	                                    <th>权限名字</th>
	                                    <th>权限链接</th>
	                                    <th>是否开启</th>
	                                    <th>排序</th>
	                                    <th>操作</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                               <c:forEach items="${list }" var="p">
	                               <tr class="gradeA">
		                            		 <td>
		                            		 	<a href="javascript:;" onclick="dialogShow(${p.id})">
		                            		 		<i class="fa fa-plus">${p.powerName }</i>
		                            		 	</a>
		                            		 </td>
		                            		 <td>${p.powerUrl }</td>
		                            		 <td>${p.isOn==1?'是':'否'  }</td>
		                            		 <td>${p.powerOrder}</td>
			                                 <td>
			                                 	<a href="/shop-admin/power/toupdate?id=${p.id }"><i style="margin-left:5px;" class="fa fa-edit"></i></a>
			                                 	<a href="javascript:;" onclick="delPower(${p.id })"><i style="margin-left:5px;" class="fa fa-trash"></i></a>
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

	<!-- 弹窗 -->
	<div id="diaLogDiv" style="display:none;">
		<div class="ibox-content">
            <div  class="dataTables_wrapper form-inline" role="grid">
            	<table class="table table-striped table-bordered table-hover dataTables-example">
	                <thead>
	                   <tr>
	                     <th>权限名字</th>
	                     <th>权限链接</th>
	                     <th>是否开启</th>
	                     <th>排序</th>
	                     <th>操作</th>
	                    </tr>
	                </thead>
	                <tbody id="tbody">
	                	<!-- 循环到这里 -->
	                </tbody>
	             </table>
            </div>
        </div>
	</div>
	
    <!-- Page-Level Scripts -->
    <script>
		function dialogShow(id){
			$.post("/shop-admin/power/selectSub?parentId="+id,function(data){
				var html="";
				for(var i=0;i<data.length;i++){
					html+="<tr class='gradeA'>";
					html+="<td>"+data[i].powerName+"</td>";
					html+="<td>"+data[i].powerUrl+"</td>";
					if(data[i].isOn==1){
						html+="<td>是</td>";
					}else{
						html+="<td>否</td>";
					}
					
					html+="<td>"+data[i].powerOrder+"</td>";
					html+="<td>";
					html+="<a href='/shop-admin/power/toupdate?id="+data[i].id+" '><i style='margin-left:5px;' class='fa fa-edit'></i></a><a href='javascript:;' onclick='delPower("+data[i].id+" )'><i style='margin-left:5px;' class='fa fa-trash'></i></a>";
					html+="</td>";
					html+="</tr>";
				}
				$("#tbody").append(html);
				layer.open({
					type : 1,
					skin : 'layui-layer-rim', //加上边框
					area : [ '880px', '440px' ], //宽高
					//获取id为diaLogDiv的元素，并且获取该元素中的
					//所有html代码
					content : $("#diaLogDiv").html() //内容
				});
			})
			
			
		}
		
		//删除
		function delPower(id) {
		  swal({
		        title: "您确定要删除这条信息吗",
		        text: "删除后将无法恢复，请谨慎操作！",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {
		    	$.post("/shop-admin/power/delPower?id="+id,function(data){
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
