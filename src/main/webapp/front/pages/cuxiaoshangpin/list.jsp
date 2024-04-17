<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 促销商品 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>促销商品</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		html::after {
			position: fixed;
			top: 0;
			right: 0;
			left: 0;
			bottom: 0;
			content: '';
			display: block;
			background-attachment: fixed;
			background-size: cover;
			background-position: center;
		}
		#app {
			position: relative;
			z-index: 1;
		}
		#test1 {
			overflow: hidden;
		}
		#test1 .layui-carousel-ind li {
			width: 16px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 3px;
			background-color: #f7f7f7;
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
		#test1 .layui-carousel-ind li.layui-this {
			width: 24px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 0;
			background-color: rgba(110,22,64,1);
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
	
		// 列表
		.recommend {
			padding: 10px 0;
			display: flex;
			justify-content: center;
			background-repeat: no-repeat;
			background-position: center center;
			background-size: cover;
		}
		.recommend .box {
		    width: 1002px;
			margin: 0 auto;
		}
		.recommend .box .title {
			padding: 10px 5px;
			display: flex;
			justify-content: space-between;
			align-items: center;
			box-sizing: border-box;
		}
		.recommend .box .title span {
			padding: 0 10px;
			font-size: 16px;
			line-height: 1.4;
		}
	
		.recommend .box .filter {
			padding: 0 10px;
			display: flex;
			align-items: center;
			box-sizing: border-box;
			width: 100%;
			flex-wrap: wrap;
		}
		.recommend .box .filter .item-list {
			display: flex;
			align-items: center;
		}
		.recommend .box .filter .item-list .lable {
			font-size: 14px;
			color: #333;
			box-sizing: border-box;
		}
		.recommend .box .filter .item-list input {
			padding: 0 10px;
			box-sizing: border-box;
			outline: none;
		}
		.recommend .box .filter button {
			display: flex;
			padding: 0 10px;
			box-sizing: border-box;
			align-items: center;
			justify-content: center;
			outline: none;
		}
		.recommend .box .filter button i {
			margin-right: 4px;
		}
	
		.recommend .box .list {
			display: flex;
			flex-wrap: wrap;
		}
	
		.recommend .box .list .list-item {
			flex: 0 0 20%;
			padding: 0 5px;
			box-sizing: border-box;
		}
		.recommend .box .list .list-item .list-item-body {
			cursor: pointer;
			border: 1px solid rgba(0, 0, 0, 3);
			padding: 5px;
			box-sizing: border-box;
		}
		.recommend .box .list .list-item-body img {
			width: 100%;
			height: 100px;
			display: block;
			margin: 0 auto;
		}
	
		.recommend .box .list .list-item-body .info {
			display: flex;
			flex-wrap: wrap;
		}
		.recommend .box .list .list-item-body .info .price {
			padding-top: 5px;
			color: red;
			font-size: 14px;
			text-align: center;
			box-sizing: border-box;
		}
	
		.recommend .box .list .list-item-body .info .name {
			padding-top: 5px;
			color: red;
			font-size: 14px;
			text-align: center;
			box-sizing: border-box;
		}
	
		.recommend .box .list .list-item3 {
			flex: 0 0 33.33%;
		}
	
		.recommend .box .list .list-item5 {
			flex: 0 0 20%;
		}
	
		.recommend .box .news {
			display: flex;
			flex-wrap: wrap;
			padding: 0;
	width: 100%;
		}
	
		.recommend .box .news .list-item {
			flex: 0 0 $var4%;
			padding: 0 10px;
			box-sizing: border-box;
		}
		.recommend .box .news .list-item .list-item-body {
			cursor: pointer;
			border: 1px solid rgba(0, 0, 0, 3);
			padding: 10px;
			box-sizing: border-box;
			display: flex;
		}
	
		.recommend .box .news .list-item .list-item-body img {
			width: 120px;
			height: 100%;
			display: block;
			margin: 0 auto;
		}
	
		.recommend .box .news .list-item .list-item-body .item-info {
			flex: 1;
			display: flex;
			justify-content: space-between;
			flex-direction: column;
			padding-left: 10px;
			box-sizing: border-box;
		}
	
		.recommend .box .news .list-item .list-item-body .item-info .name {
			padding-top: 5px;
			color: red;
			font-size: 14px;
			box-sizing: border-box;
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 1;
			-webkit-box-orient: vertical;
		}
	
		.recommend .box .news .list-item .list-item-body .item-info .time {
			padding-top: 5px;
			color: red;
			font-size: 14px;
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 1;
			-webkit-box-orient: vertical;
			box-sizing: border-box;
		}
	
		.recommend .box .news .list-item1 {
			flex: 0 0 100%;
		}
	
		.recommend .box .news .list-item3 {
			flex: 0 0 33.33%;
		}
	
		.index-pv1 .animation-box:hover {
			transform: perspective(1000px) translate3d(0px, 0px, 0px) scale(1.1) rotate(0deg) skew(0deg, 0deg);
			transition: all 0.3s;
		}
		
		.index-pv1 .animation-box img:hover {
			transform: perspective(1000px) translate3d(0px, 0px, 0px) scale(1) rotate(0deg) skew(0deg, 0deg);
			transition: all 0.3s;
		}
	  
	  .layui-laypage .layui-laypage-count {
	    padding: 0 10px;
	  }
	  .layui-laypage .layui-laypage-skip {
	    padding-left: 10px;
	  }
	  
		.titles {
			padding: 10px 5px;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		}
	</style>
	<body>

		<div id="app">
			<!-- 轮播图 -->
			<!-- <div class="layui-carousel" id="swiper">
				<div carousel-item id="swiper-item">
					<div v-for="(item,index) in swiperList" v-bind:key="index">
						<img class="swiper-item" :src="item.img">
					</div>
				</div>
			</div> -->
			<div class="layui-carousel" id="swiper" :style='{"boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
				<div carousel-item>
					<div v-for="(item,index) in swiperList" :key="index">
						<img style="width: 100%;height: 100%;object-fit:cover;" :src="item.img" />
					</div>
				</div>
			</div>
			<!-- 轮播图 -->

			<!-- 图文列表 -->
			<div class="recommend index-pv1" :style='{"padding":"10px 0 10px 0","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0px 0 0 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","background":"#fff","borderStyle":"solid"}'>
				<div class="box" style='width:80%'>
										<div class="titles" :style='{"padding":"4px 12px","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"10px 0","borderColor":"rgba(167, 148, 255, 1)","backgroundColor":"rgba(121, 107, 191, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"","alignItems":"flex-start","borderWidth":"0 0 10px","fontSize":"16px","borderStyle":"solid"}'>
					  <span>DATA SHOW</span><span>促销商品展示</span>
					</div>
					
					<form class="layui-form filter" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"10px 0 10px 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"4px","borderWidth":"0","borderStyle":"solid","justifyContent":"flex-end","height":"64px"}'>

						<div class="item-list">
							<div class="lable" :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"rgba(0, 0, 0, 1)","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"auto","fontSize":"16px","borderStyle":"solid"}'>商品名称</div>
							<input type="text" :style='{"boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(121, 107, 191, 1)","backgroundColor":"#fff","color":"#333","borderRadius":"0","textAlign":"center","borderWidth":"1px","width":"140px","fontSize":"14px","borderStyle":"solid","height":"44px"}' name="shangpinmingcheng" id="shangpinmingcheng" placeholder="商品名称" autocomplete="off" class="layui-input">
						</div>
					<div class="item-list">
						<div class="lable" :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"rgba(0, 0, 0, 1)","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"auto","fontSize":"16px","borderStyle":"solid"}'>商品类型</div>
						<select :style='{"boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(121, 107, 191, 1)","backgroundColor":"#fff","color":"#333","borderRadius":"0","textAlign":"center","borderWidth":"1px","width":"140px","fontSize":"14px","borderStyle":"solid","height":"44px"}' style="display:block" name="shangpinleixing" id="shangpinleixing" lay-filter="shangpinleixing">
							<option value="">请选择</option>
							<option v-for="(item,index) in shangpinleixingOptions" v-bind:key="index" :value="item">{{item}}</option>
						</select>
					</div>
						<div class="item-list">
							<div class="lable" :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,0)","backgroundColor":"transparent","color":"rgba(0, 0, 0, 1)","borderRadius":"0","textAlign":"right","borderWidth":"0","width":"auto","fontSize":"16px","borderStyle":"solid"}'>生产地</div>
							<input type="text" :style='{"boxShadow":"0 0 6px rgba(255,0,0,0)","borderColor":"rgba(121, 107, 191, 1)","backgroundColor":"#fff","color":"#333","borderRadius":"0","textAlign":"center","borderWidth":"1px","width":"140px","fontSize":"14px","borderStyle":"solid","height":"44px"}' name="shengchandi" id="shengchandi" placeholder="生产地" autocomplete="off" class="layui-input">
						</div>

						<button :style='{"padding":"0 15px","boxShadow":"0 0 0px rgba(0,0,0,0)","margin":"0 0 0 10px","borderColor":"#409EFF","backgroundColor":"rgba(121, 107, 191, 1)","color":"#fff","borderRadius":"4px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"40px"}' id="btn-search" type="button" class="layui-btn layui-btn-normal">
						  <i v-if="true" class="layui-icon layui-icon-search"></i>搜索
						</button>
						<button :style='{"padding":"0 15px","boxShadow":"0 0 0px rgba(0,0,0,0)","margin":"0 0 0 10px","borderColor":"#409EFF","backgroundColor":"rgba(121, 107, 191, 1)","color":"#fff","borderRadius":"4px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"40px"}' v-if="isAuth('cuxiaoshangpin','新增')" @click="jump('../cuxiaoshangpin/add.jsp')" type="button" class="layui-btn btn-theme">
						  <i v-if="true" class="layui-icon">&#xe654;</i>添加
						</button>
					</form>
						
						<!-- 样式一 -->
						<div class="list" style="position: relative;">
		<div v-if="1 == 1" style="position: absolute;left: 0;top: 0;transform: translate3d(-100%, 0, 0);" :style='{"padding":"10px 0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,1)","backgroundColor":"rgba(246, 239, 250, 1)","borderRadius":"0","borderWidth":"0","width":"120px","borderStyle":"solid","height":"auto"}'>
	    		<div style="text-align: center;cursor: pointer;box-sizing: border-box;" class="category-search" :index="-1" :style='swiperIndex==-1?{"padding":"0 10px","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"4px 5%","borderColor":"rgba(167, 148, 255, 1)","backgroundColor":"rgba(121, 107, 191, 1)","color":"#fff","borderRadius":"0","borderWidth":"0 0 6px","width":"90%","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}:{"padding":"0 10px","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"4px 5%","borderColor":"rgba(213, 213, 213, 1)","backgroundColor":"rgba(180, 180, 180, 1)","color":"rgba(0, 0, 0, 1)","borderRadius":"0","borderWidth":"0 0 6px","width":"90%","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}'>全部</div>
			<div v-for="(item,index) in categoryList" :key="index" >
				<div style="text-align: center;cursor: pointer;box-sizing: border-box;" :style='swiperIndex==index?{"padding":"0 10px","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"4px 5%","borderColor":"rgba(167, 148, 255, 1)","backgroundColor":"rgba(121, 107, 191, 1)","color":"#fff","borderRadius":"0","borderWidth":"0 0 6px","width":"90%","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}:{"padding":"0 10px","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"4px 5%","borderColor":"rgba(213, 213, 213, 1)","backgroundColor":"rgba(180, 180, 180, 1)","color":"rgba(0, 0, 0, 1)","borderRadius":"0","borderWidth":"0 0 6px","width":"90%","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}' :index="index" class="category-search">{{categoryList[index]}}</div>
			</div>
		</div>
							<div @click="jump('../cuxiaoshangpin/detail.jsp?id='+item.id)" v-for="(item,index) in dataList" :key="index" class="list-item" :class="5=='3'?'list-item3':5=='5'?'list-item5':''">
								<div class="list-item-body animation-box" :style='{"padding":"0 0 30px","boxShadow":"0 0 0px rgba(110,22,64,.8)","margin":"0 6px 10px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(248, 248, 248, 1)","borderRadius":"150px 150px 0 0","borderWidth":"0","borderStyle":"solid"}'>
									<img :style='{"boxShadow":"0 0 0px rgba(110,22,64,.8)","borderColor":"rgba(232, 232, 232, 1)","borderRadius":"150px","borderWidth":"5px","width":"100%","borderStyle":"solid","height":"290px"}' :src="item.shangpintupian?baseurl+item.shangpintupian.split(',')[0]:''">
									<div class="info">
										<div v-if="item.price" :style='{"padding":"0","margin":"10px 0","backgroundColor":"rgba(0,0,0,0)","color":"rgba(255, 69, 0, 1)","borderRadius":"0","textAlign":"center","width":"100%","fontSize":"16px"}' class="price"><span :style='{"fontSize":"12px"}'>￥</span>{{item.price.toFixed(2)}}</div>
										<div v-if="item.vipprice&&item.vipprice>0" :style='{"padding":"0","margin":"10px 0","backgroundColor":"rgba(0,0,0,0)","color":"rgba(255, 69, 0, 1)","borderRadius":"0","textAlign":"center","width":"100%","fontSize":"16px"}' class="price"><span :style='{"fontSize":"12px"}'>￥</span>{{item.vipprice.toFixed(2)}} <span :style='{"fontSize":"12px"}'>会员价</span></div>
										<div v-if="true" :style='{"isshow":true,"padding":"0","margin":"5px 0 0 0","backgroundColor":"rgba(248, 248, 248, 1)","color":"rgba(0, 0, 0, 1)","borderRadius":"0","textAlign":"center","width":"100%","fontSize":"16px"}' class="name">{{item.shangpinmingcheng}}</div>
									</div>
								</div>
							</div>
						</div>
				
					<div class="pager" id="pager" :style="{textAlign:2==1?'left':2==2?'center':'right'}"></div>
				</div>
			</div>
			<!-- 图文列表 -->
		</div>


		<!-- layui -->
		<script src="../../layui/layui.js"></script>
		<!-- vue -->
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script>
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					categoryList: [],

				        shangpinleixingOptions: [],
					baseurl: '',
					dataList: []
				},
				methods: {
					isAuth(tablename, button) {
						return isFrontAuth(tablename, button)
					},
					jump(url) {
						jump(url)
					}
				}
			})

			layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery','laydate'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var laypage = layui.laypage;
				var http = layui.http;
				var jquery = layui.jquery;
        			var laydate = layui.laydate;

				var limit = 8;
                limit = 5 * 2;
				vue.baseurl = http.baseurl;
				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						let swiperList = [];
						res.data.list.forEach(element => {
						  if (element.value != null) {
						    swiperList.push({
						      img: http.baseurl+element.value
						    });
						  }
						});
						vue.swiperList = swiperList;
						
						vue.$nextTick(() => {
						  carousel.render({
						  	elem: '#swiper',
										width: '100%',
						  	height: '400px',
						  	arrow: 'hover',
						  	anim: 'default',
						  	autoplay: 'true',
						  	interval: '3000',
						  	indicator: 'none'
						  });
						
						})
					}
				});
        			http.request(`option/shangpinleixing/shangpinleixing`,'get',{},(res)=>{
                			vue.shangpinleixingOptions = res.data
        			});

				//类型查询
			      categoryList();
				//类型搜索
			      $(document).on("click", ".category-search", function(e){
					  vue.swiperIndex = $(this).attr('index')
				  pageList(e.target.innerText);
			      });

			      function categoryList() {
				  // 获取列表数据
				  http.request('option/shangpinleixing/shangpinleixing', 'get', {}, function(res) {
				    vue.categoryList = res.data
				  })

				}
			      var vCategory = '';


				// 分页列表
				pageList();

				// 搜索按钮
				jquery('#btn-search').click(function(e) {
					pageList();
				});

				function pageList(category) {
					var param = {
						page: 1,
						limit: limit
					}
				if(category!=null && category!='全部') {
					vCategory = category;
					if (jquery('#shangpinmingcheng').val()) {
						param['shangpinmingcheng'] = '';
					}
					if (jquery('#shangpinleixing').val()) {
						param['shangpinleixing'] = '';
					}
					if (jquery('#shengchandi').val()) {
						param['shengchandi'] = '';
					}
				}
				if(vCategory!='' && category!='全部') {
					param['shangpinleixing'] = category;
				}

			        if (jquery('#shangpinmingcheng').val()) {
			          param['shangpinmingcheng'] = jquery('#shangpinmingcheng').val() ? '%' + jquery('#shangpinmingcheng').val() + '%' : '';
			        }
			        if (jquery('#shangpinleixing').val()) {
			          param['shangpinleixing'] = jquery('#shangpinleixing').val() ? jquery('#shangpinleixing').val() : '';
			        }
			        if (jquery('#shengchandi').val()) {
			          param['shengchandi'] = jquery('#shengchandi').val() ? '%' + jquery('#shengchandi').val() + '%' : '';
			        }


				if (jquery('#shangpinmingcheng').val()) {
					param['shangpinmingcheng'] = jquery('#shangpinmingcheng').val() ? '%' + jquery('#shangpinmingcheng').val() + '%' : '';
				}  
				if (jquery('#shangpinleixing').val()) {
					param['shangpinleixing'] = jquery('#shangpinleixing').val() ? '%' + jquery('#shangpinleixing').val() + '%' : '';
				}  
				if (jquery('#shengchandi').val()) {
					param['shengchandi'] = jquery('#shengchandi').val() ? '%' + jquery('#shengchandi').val() + '%' : '';
				}  

					// 获取列表数据
					http.request('cuxiaoshangpin/list', 'get', param, function(res) {
						vue.dataList = res.data.list
						// 分页
						laypage.render({
							elem: 'pager',
							count: res.data.total,
							limit: limit,
							groups: 5,
							layout: ["prev","page","next"],
							theme: '#796BBF',
							jump: function(obj, first) {
								param.page = obj.curr;
								//首次不执行
								if (!first) {
									http.request('cuxiaoshangpin/list', 'get', param, function(res) {
										vue.dataList = res.data.list
									})
								}
							}
						});
					})
				}
			});
		</script>
	</body>
</html>
