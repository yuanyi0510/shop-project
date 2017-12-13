<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品属性</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>商品属性</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="editForm" method="post" action="/shop-admin/ProductAttr/add">
                        	<div class="form-group">
                                <label class="col-sm-2 control-label">属性名字</label>
                                <input type="hidden" name="id" value="${Pas.id}">
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="attrName" value="${Pas.attrName}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">属性值</label>
                                <div class="col-md-2">
                                	<a href="javascript:void(0);" onclick="addAttrValue();" class="btn btn-primary ">添加属性值</a>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                            	<div id="valueDiv">
	                            	<!-- 属性值 -->
	                            	<!-- 显示现有属性值-->
		                            <div class='form-group' >
		                            		<label class='col-sm-2 control-label'></label>
		                            		<div class='col-md-8'>
		                            		<input type='text' class='form-control' placeholder='属性值' name="productAttrValues[0].attrValue" value="${Pas.productAttrValues[0].attrValue}">
		                            		</div>
		                            		<input type="hidden" name="productAttrValues[0].id" value="${Pas.productAttrValues[0].id}">
		                            		<div class='col-md-2'>
		                            			<a href='javascript:void(0);' class='btn btn-primary' onclick="delAjax(this)">删除属性值</a>
		                            		</div>
		                            </div>
		                            <c:if test="${Pas!=null}">
		                            <c:forEach var="i" begin="1" end="${fn:length(Pas.productAttrValues)-1}" >
		                            		                            <div class='form-group' >
		                            		<label class='col-sm-2 control-label'></label>
		                            		<div class='col-md-8'>
		                            <input type='text' class='form-control' placeholder='属性值' name="productAttrValues[${i}].attrValue" value="${Pas.productAttrValues[i].attrValue}">
		                            		</div>
		                            		<input type="hidden" name="productAttrValues[${i}].id" value="${Pas.productAttrValues[i].id}">
		                            		<div class='col-md-2'>
		                            			<a href='javascript:void(0);' class='btn btn-primary' onclick="delAjax(this)">删除属性值</a>
		                            		</div>
		                            </div>
		                            </c:forEach>
		                            </c:if>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="button" onclick="save()">保存内容</button>
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
var index;
window.onload = function() {
	if(${Pas!=null}){
		 index =${fn:length(Pas.productAttrValues)};
	}
		else{
index = 1;
		}
} 
		
	$(document).ready(function () {
	    $('.i-checks').iCheck({
	        checkboxClass: 'icheckbox_square-green',
	        radioClass: 'iradio_square-green',
	    });
	});
	
	function addAttrValue(){
		var html = "<div class='form-group' id='attrValue"+index+"'><label class='col-sm-2 control-label'></label>"
				 + "<div class='col-md-8'>"
				 + "<input type='text' class='form-control' name='productAttrValues["+index+"].attrValue'  placeholder='属性值'>"
				 + "</div>"
				 + "<div class='col-md-2'>"
				 + "<a onclick='deleteValue("+index+");' href='javascript:void(0);' class='btn btn-primary '>删除属性值</a>"
				 + "</div></div>";
				 
		index++;
		$("#valueDiv").append(html);
	}
	
	function deleteValue(index){
		$("#attrValue"+index).remove();
	}
	
	
	function delAjax(obj){
		var id=$(obj).parent().prev().val();
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
		$(obj).parent().parent().remove();
		                     });
				}
			})
	    });
	}
	function save(){
		$("#editForm").submit();
	}
</script>
</html>
