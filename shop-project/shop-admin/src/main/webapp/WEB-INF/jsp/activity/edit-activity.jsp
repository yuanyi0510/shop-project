<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布活动</title>
    <jsp:include page="../common/include_css.jsp" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><small>发布活动</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" id="editForm">
                        <input type="hidden" name="id" id="activityId" value="${activity.id}"/>
                        	<div class="form-group">
                                <label class="col-sm-2 control-label">当前活动</label>
                                <div class="col-sm-10">
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" value="1" name="isCurrent" 
                                            		${activity.isCurrent==1?'checked':'' } > 
                                            		<i></i> 是</label>
                                    </div>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" value="0" name="isCurrent" 
                                            	${activity.isCurrent==0?'checked':'' }  /> 
                                            	<i></i> 否</label>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group" id="data_5">
                                <label class="col-sm-2 control-label">活动时间</label>
				                <div class="input-daterange input-group" id="datepicker" style="padding-left:15px;">
				                    <input type="text" name="startTime" value="<fmt:formatDate value="${activity.startTime}" /> "
				                    	readonly="readonly" class="input form-control"  />
				                    
				                    <span class="input-group-addon">到</span>
				                    <input type="text" name="endTime" value="<fmt:formatDate value="${activity.endTime}" /> "
				                    	readonly="readonly"  class="input form-control"  />
				                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">添加优惠券</label>
                                <div class="col-sm-4">
                                	<a href="javascript:void(0);" onclick="addCoupon()" class="btn btn-primary ">添加优惠券</a>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                            	<div class="ibox-content">
            						<div  class="dataTables_wrapper form-inline" role="grid">
            							<table class="table table-striped table-bordered table-hover dataTables-example">
                            				<thead>
	                   							<tr>
	                    							<th>类型</th>
	                     						    <th>优惠金额</th>
	                     							<th>满额</th>
	                     							<th>开始时间</th>
	                     							<th>结束时间</th>
	                     							<th>张数</th>
	                     							<th>操作</th>
	                    						</tr>
	                						</thead>
	                						<tbody id="couponBody">		
	                						<c:set value="${activity.aCouponRelations }" var="acr"/>				
	                						<c:forEach begin="0" end="${acr.size()}" var="i" >
	                						<c:if test="${acr[i]!=null }">
	                						<input type="hidden" name="aCouponRelations[${i}].id" value="${acr[i].id }"/>
	                						<input type="hidden" name="aCouponRelations[${i}].couponId" value="${acr[i].couponId }"/>
	                						<input type="hidden" name="aCouponRelations[${i}].activityId" value="${acr[i].activityId }"/>
	                						<tr>
	                						<td>
	                						<c:if test="${acr[i].coupon.couponType ==0}">
		                            		 满减卷
		                            		 </c:if>
		                            		  <c:if test="${acr[i].coupon.couponType ==1}">
		                            		运费卷
		                            		</c:if>
		                            		
	                						</td>
	                						<td>
	                						${acr[i].coupon.couponPrice}
	                						</td>
	                						<td>
	                						${acr[i].coupon.couponMaxPrice }
	                						</td>
	                						<td>
	                						
	                						<fmt:formatDate value="${acr[i].coupon.useStartTime }" type="both"/>	                										                 
	                						</td>
	                						<td>	                						
	                						<fmt:formatDate value="${acr[i].coupon.useEndTime }" type="both"/>
				                   
	                						</td>
	                						<td style="width: 5px;">
	                						<input type="text"    name="aCouponRelations[${i}].couponCount" value="${acr[i].couponCount }" class="form-control">
	                						</td>
	                						<td align="center"> <a href="javascript:;" onclick="add(${i})">
		                            		 		<i class="fa fa-plus"></i>
		                            		 	</a>&nbsp;&nbsp;&nbsp;&nbsp;  
		                            		 	<a href="javascript:;" onclick="sub(${i},${acr[i].couponId})">
		                            		 		<span style=" color: #337AB7;width: 4px ;height: 1px;font-weight: 900;font-size:25px;">
		                            				 <b>-</b>
		                            		 		</span>
		                            		 	</a>
		                            		 	</td>
	                						</tr>
	                						</c:if>
	                						</c:forEach>
	                						</tbody>
                            			</table>
                            		</div>
                            	</div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" onclick="editActivity()" type="button">保存内容</button>
                                    <button class="btn btn-white" type="reset">取消</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div id="diaLogDiv" style="display:none;">
		<div class="ibox-content">
            <div  class="dataTables_wrapper form-inline" role="grid">
            	<table class="table table-striped table-bordered table-hover dataTables-example">
						<thead>
	                   		<tr>
	                    		<th>类型</th>
	                     		<th>优惠金额</th>
	                     		<th>满额</th>
	                     		<th>开始时间</th>
	                     		<th>结束时间</th>
	                     		<th>操作</th>
	                    	</tr>
	                	</thead>
	                <tbody id="tbody">
	                	
	                </tbody>
	             </table>
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
			
			$('.i-checks').iCheck({
			    checkboxClass: 'icheckbox_square-green',
			    radioClass: 'iradio_square-green',
			});
		})
		
		
//--------------------------------未实现---------------------------------------------------
		//当修改活动为当前活动，判断是否有其他的活动正在进行
		function isCurrent(){
			alert(123);
			$.post("/activity/isCurrent",function(data){
				if(data=='fail'){
					swal({
		                   title: "警告",
		                   text: "当前有其他活动正在进行，不能将此活动设置为当前活动",
		                   type: "error"
		               });
				}
			})
		}
//-----------------------------------------------------------------------------------
		//修改或者增加活动
		function editActivity() {
			$.post("/shop-admin/activity/update",$("#editForm").serialize(),function(data){
				if(data=='success'){
					swal({
		                   title: "操作成功！",
		                   text: "",
		                   type: "success"
		               },function(){
		            	   window.location.href="/shop-admin/activity/toactivity";
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

		 function transferTime(cTime) {
		       //将json串的一串数字进行解析
		       var jsonDate = new Date(parseInt(cTime));
		      
		       //为Date对象添加一个新属性，主要是将解析到的时间数据转换为我们熟悉的“yyyy-MM-dd hh:mm:ss”样式
		       Date.prototype.format = function(format) {
		       var o = {

		       //获得解析出来数据的相应信息，可参考js官方文档里面Date对象所具备的方法

		       "y+" : this.getFullYear(),//得到对应的年信息
		       "M+" : this.getMonth() + 1, //得到对应的月信息，得到的数字范围是0~11，所以要加一
		       "d+" : this.getDate(), //得到对应的日信息
		       "h+" : this.getHours(), //得到对应的小时信息 
		       "m+" : this.getMinutes(), //得到对应的分钟信息
		       "s+" : this.getSeconds(), //得到对应的秒信息
		 
		   }

		     //将年转换为完整的年形式
		    if (/(y+)/.test(format)) {
		   format = format.replace(RegExp.$1,
		   (this.getFullYear() + "")
		  .substr(4 - RegExp.$1.length));
		   }

		   //连接得到的年月日 时分秒信息
		   for ( var k in o) {
		  if (new RegExp("(" + k + ")").test(format)) {
		  format = format.replace(RegExp.$1,
		  RegExp.$1.length == 1 ? o[k] : ("00" + o[k])
		 .substr(("" + o[k]).length));
		  }
		 }
		 return format;
		 }
		var newDate = jsonDate.format("yyyy-MM-dd hh:mm:ss");
		return newDate;
		}        


		function addCoupon() {
			$.post("/shop-admin/activity/selectCoupon",function(data){
				$("#tbody").empty();
				console.log(data);
				for(var i=0;i<data.length;i++){					
					var html="<tr>";
					html+="<td>"+data[i].couponType+"</td>";
					html+="<td>"+data[i].couponPrice+"</td>";
					html+="<td>"+data[i].couponMaxPrice+"</td>";
					html+="<td>"+transferTime(data[i].useStartTime) +"</td>";
					html+="<td>"+transferTime(data[i].useEndTime) +"</td>";
					html+="<td><button onclick='addcp("+data[i].id+")' class='btn btn-primary btn-sm' type='button'>选择</button></td>";
					html+="</tr>";
					$("#tbody").append(html); 
				}
				$("#diaLogDiv").show();
			})
			
		}
		
		//为当前活动添加优惠券
		function addcp(cid){
			var id=$("#activityId").val();
			alert(id);
			$.post("/shop-admin/activity/addCoupon?id="+id+"&cid="+cid,function(data){
				if(data=='success'){
					swal({
		                   title: "操作成功！",
		                   text: "",
		                   type: "success"
		               },function(){
		            	   window.location.reload();
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
		//添加优惠券的数量
		function add(i) {
			var num=$("input[name='aCouponRelations["+i+"].couponCount']")[0].value;
			
			$("input[name='aCouponRelations["+i+"].couponCount']")[0].value=parseInt(num) + 1;
		}
		//减少优惠券的数量
		function sub(i,id) {
			var num=$("input[name='aCouponRelations["+i+"].couponCount']")[0].value;
			if(parseInt(num)==1){
				$.post("/shop-admin/activity/deleteCouponById?id="+id,function(data){
					if(data=='success'){
					window.location.reload();
					return;
					}
				})
			}
			$("input[name='aCouponRelations["+i+"].couponCount']")[0].value=parseInt(num) - 1;;
		}
	</script>
</body>
</html>