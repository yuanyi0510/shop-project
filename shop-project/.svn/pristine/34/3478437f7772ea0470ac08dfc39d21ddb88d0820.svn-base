<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增快递</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>新增快递</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content"><span style="display: none;" id="mess">${mess }</span>
                        <form class="form-horizontal" method="post" enctype="multipart/form-data" action="/express/updateExpress">
                        <c:set value="${express}" var="es"/> 
                       <input type="hidden" name="id" value="${es.id }">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">快递名字</label>
                                <div class="col-sm-10">
                                    <input type="text" name="expressName" value="${es.expressName }" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">快递金额</label>
                                <div class="col-sm-10">
                                    <input type="text" name="expressPrice" value="${es.expressPrice }" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">图片</label>
                                <div class="col-sm-10">
                               		<img src="${es.expressImg }" alert="无法显示图片" style="width:180px;height:48px;" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">选择图片（单选）</label>
                                <div class="col-sm-10">
                               		<input type="file" class="form-control" name="file">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="submit">保存内容</button>
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
	<script src="<%=basePath %>resources/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
</body>
<script type="text/javascript">
		$( 'input[type="file"]').prettyFile();
		
		$(function(){
			var mess=$("#mess").html();
			if(mess!=''){
				swal({
	                   title: mess,
	                   text: "",
	                   type: "success"
	               },function(){
	            	   window.location.href="/shop-admin/express/toexpress";
	               });
				
			}
		})
</script>
</html>
