<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增子分类</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>新增子分类</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="editForm" action="/shop-admin/Pcs/add" method="post">
                        	<div class="form-group">
                                <label class="col-sm-2 control-label">子分类名字</label>
                                <input type="hidden" name="id" value="${pcs.id}">
                                <div class="col-sm-10">
                                    <input type="text"  class="form-control" name="classifySubName" value="${pcs.classifySubName}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >排序</label>
                                <div class="col-sm-10">
                                    <input type="text"  class="form-control" name="subOrder" value="${pcs.subOrder}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否启用</label>
                                <div class="col-sm-10">
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" name="subIsOn" value="1" ${pcs.subIsOn=="1"?'checked':''}> <i></i> 启用</label>
                                    </div>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" name="subIsOn" value="0" ${pcs.subIsOn=="0"?'checked':''}> <i></i> 禁用</label>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" >选择分类</label>
                                <div class="col-sm-10">
                                    <select class="form-control m-b" name="classifyId">
                                    <c:forEach items="${pcNameList}" var="pc">
                                    	<option value="${pc.id}" ${pcs.classifyId==pc.id?'selected':''}>${pc.classifyName}</option>
                                    </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="button" onclick="save()">保存内容</button>
                                    <button class="btn btn-white" type="reset" onclick="cancle()">取消</button>
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
	function save(){
		$("#editForm").submit();
	}
	function cancle(){
		window.location.href("/shop-admin/Pcs/selectAll");
	}
</script>
</html>
