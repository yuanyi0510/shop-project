<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>

		<title>优惠券</title>

		<link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/css/cpstyle.css" rel="stylesheet" type="text/css">
			
		<script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	</head>

	<body>
		<!--头 -->
		<jsp:include page="../common/include_top.jsp" />
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-coupon">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">优惠券</strong> / <small>Coupon</small></div>
						</div>
						<hr/>

						<div class="am-tabs-d2 am-tabs  am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">可用优惠券</a></li>
								<li><a href="#tab2">已用/过期优惠券</a></li>

							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="coupon-items">
										<div class="coupon-item coupon-item-d">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>购物券</strong>
													</div>
													<div class="c-price">
														<strong>￥8</strong>
													</div>
													<div class="c-limit">
														【消费满&nbsp;95元&nbsp;可用】
													</div>
													<div class="c-time"><span>使用期限</span>2015-12-21--2015-12-31</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">券&nbsp;编&nbsp;号：</span>
																<span class="txt">35730144</span>
															</div>
														</div>
													</div>
													<div class="op-btns">
														<a href="#" class="btn"><span class="txt">立即使用</span><b></b></a>
													</div>
												</div>
											</div>
										</div>
										<div class="coupon-item coupon-item-yf">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>运费券</strong>
													</div>
													<div class="c-price">
														<strong>可抵运费</strong>
													</div>
													<div class="c-limit">
														【不含偏远地区】
													</div>
													<div class="c-time"><span>使用期限</span>2015-12-21--2015-12-31</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">券&nbsp;编&nbsp;号：</span>
																<span class="txt">35728267</span>
															</div>
														</div>

													</div>
													<div class="op-btns">
														<a href="#" class="btn"><span class="txt">立即使用</span><b></b></a>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="am-tab-panel am-fade" id="tab2">
									<div class="coupon-items">
										<div class="coupon-item coupon-item-d">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>购物券</strong>
														<span class="am-icon-trash"></span>
													</div>
													<div class="c-price">
														<strong>￥8</strong>
													</div>
													<div class="c-limit">
														【消费满&nbsp;95元&nbsp;可用】
													</div>
													<div class="c-time"><span>使用期限</span>2015-12-21--2015-12-31</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">券&nbsp;编&nbsp;号：</span>
																<span class="txt">35730144</span>
															</div>
														</div>
													</div>
													<div class="op-btns c-del">
														<a href="#" class="btn"><span class="txt">删除</span><b></b></a>
													</div>
												</div>
												
												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<span><img src="../images/gift_stamp_31.png" /></span>
													</div>
												</li>												
											</div>
										</div>
										<div class="coupon-item coupon-item-yf">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>运费券</strong>
														<span class="am-icon-trash"></span>
													</div>
													<div class="c-price">
														<strong>可抵运费</strong>
													</div>
													<div class="c-limit">
														【不含偏远地区】
													</div>
													<div class="c-time"><span>使用期限</span>2015-12-21--2015-12-31</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">券&nbsp;编&nbsp;号：</span>
																<span class="txt">35728267</span>
															</div>
														</div>

													</div>
													<div class="op-btns c-del">
														<a href="#" class="btn"><span class="txt">删除</span><b></b></a>
													</div>
												</div>
												
												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<span><img src="../images/gift_stamp_21.png" /></span>
													</div>
												</li>
											</div>
										</div>
									</div>
									
								</div>
							</div>

						</div>

					</div>

				</div>
				<!--底部-->
				<jsp:include page="../common/footer.jsp" />
			</div>

			<!-- 菜单 -->
			<jsp:include page="../common/include_menu.jsp" />
		</div>

	</body>

</html>