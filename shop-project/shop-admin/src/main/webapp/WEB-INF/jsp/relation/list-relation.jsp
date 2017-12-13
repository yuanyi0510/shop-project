<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品分类关系</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>商品分类关系</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<div  class="dataTables_wrapper form-inline" role="grid">
                    		<!-- 查询条件 -->
	                    	<form id="searchForm" method="post">
		                    	<div class="row">
		                    		<div class="col-sm-2">
		                    			<div class="dataTables_length">
		                    				<a href="/shop-admin/Cr/toAdd" class="btn btn-primary ">新增关系</a>
		                    			</div>
		                    		</div>
		                    	</div>
	                    	</form>
                    		<!-- 查询条件结束 -->
	                        <table class="table table-striped table-bordered table-hover dataTables-example">
	                            <thead>
	                                <tr>
	                                    <th>ID</th>
	                                    <th>组合名字</th>
	                                    <th>排序</th>
	                                    <th>分类1</th>
	                                    <th>分类2</th>
	                                    <th>操作</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items="${crsList}" var="crs">
	                            		<tr class="gradeA">
		                            		 <td>${crs.id}</td>
		                            		 <td>${crs.productClassify1.classifyName}/${crs.productClassify2.classifyName}</td>
		                            		 <td>${crs.relationOrder}</td>
		                            		 <td>${crs.productClassify1.classifyName}</td>
		                            		 <td>${crs.productClassify2.classifyName}</td>
			                                 <td>
			                                 	<a href="/shop-admin/Cr/toAdd?id=${crs.id}"><i style="margin-left:5px;" class="fa fa-edit"></i></a>
			                                 	<a href="javascript:;" onclick="del(${crs.id})"><i style="margin-left:5px;" class="fa fa-trash"></i></a>
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
    <script type="text/javascript">
    function del(id){
    	$.ajax({
    		type:"post",
    		url:"/shop-admin/Cr/del?id="+id,
    	    success:function(data){
    	    	if(data=="success"){
    	    		window.location.reload();
    	    	}
    	    }
    	})
    }
    </script>
</body>
</html>
