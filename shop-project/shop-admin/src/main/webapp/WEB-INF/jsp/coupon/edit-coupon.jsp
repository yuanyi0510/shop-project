<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增优惠券</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>新增优惠券</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="editForm">
                        <c:set value="${coupon }" var="c"/>
                        <input type="hidden" value="${c.id }" name="id">
                           	<div class="form-group">
                                <label class="col-sm-2 control-label">类型</label>
                                <div class="col-sm-10">
                                    <select class="form-control m-b" name="couponType">
                                    	<option value="0" ${c.couponType==0?'selected':''}>满减卷</option>
                                    	<option value="1"${c.couponType==1?'selected':''}>运费卷</option>
                                    </select>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">优惠金额</label>
                                <div class="col-sm-10">
                                    <input type="text" name="couponPrice" value="${c.couponPrice}" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">满额</label>
                                <div class="col-sm-10">
                                    <input type="text" name="couponMaxPrice" value="${c.couponMaxPrice}" class="form-control">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group" id="data_5">
                                <label class="col-sm-2 control-label">时间</label>
				                <div class="input-daterange input-group" id="datepicker" style="padding-left:15px;">
				                    <input type="text" name="useStartTime" value="<fmt:formatDate value='${c.useStartTime}' />" readonly="readonly" class="input form-control"/>
				                   
				                    <span class="input-group-addon">到</span>
				                    <input type="text" name="useEndTime" value="<fmt:formatDate value='${c.useEndTime}'/>"  readonly="readonly"   class="input form-control" />
				             
				                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button onclick="editCoupon()" class="btn btn-primary" type="button">保存内容</button>
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
	<script type="text/javascript">
		$(function(){
			$('#data_5 .input-daterange').datepicker({
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });
		})
		
		function editCoupon() {
			$.post("/shop-admin/coupon/updateCoupon",$("#editForm").serialize(),function(data){
				if(data=='success'){
					swal({
		                   title: "操作成功！",
		                   text: "",
		                   type: "success"
		               },function(){
		            	   window.location.href="/shop-admin/coupon/tocoupon";
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
</body>
</html>