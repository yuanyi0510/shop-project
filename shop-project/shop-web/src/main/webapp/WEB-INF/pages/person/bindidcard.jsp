<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>实名认证</title>

<link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="/css/personal.css" rel="stylesheet" type="text/css">
<link href="/css/stepstyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/css/sweetalert/sweetalert.css"
	type="text/css">
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script src="/js/postAjax.js"></script>
<script src="/js/sweetalert/sweetalert.min.js"></script>

	</head>

	<body>
		<jsp:include page="../common/include_top.jsp" />
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">实名认证</strong> / <small>Real&nbsp;authentication</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">实名认证</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form class="am-form am-form-horizontal" id="smrzForm">
						<div class="am-form-group bind">
							<label for="user-info" class="am-form-label">账户名</label>
							<div class="am-form-content">
								<span id="user-info"></span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-name" class="am-form-label">真实姓名</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="请输入您的真实姓名">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-IDcard" class="am-form-label">身份证号</label>
							<div class="am-form-content">
								<input type="tel" id="user-IDcard" placeholder="请输入您的身份证信息">
							</div>
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger">保存修改</div>
						</div>

					</form>

				</div>
				<!--底部-->
				<jsp:include page="../common/footer.jsp" />
			</div>

			<jsp:include page="../common/include_menu.jsp" />
		</div>

	</body>
<script type="text/javascript">
</script>
</html>