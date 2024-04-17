
var projectName = '虚拟商品管理系统';
/**
 * 轮播图配置
 */
var swiper = {
	// 设定轮播容器宽度，支持像素和百分比
	width: '100%',
	height: '400px',
	// hover（悬停显示）
	// always（始终显示）
	// none（始终不显示）
	arrow: 'none',
	// default（左右切换）
	// updown（上下切换）
	// fade（渐隐渐显切换）
	anim: 'default',
	// 自动切换的时间间隔
	// 默认3000
	interval: 2000,
	// 指示器位置
	// inside（容器内部）
	// outside（容器外部）
	// none（不显示）
	indicator: 'outside'
}

/**
 * 个人中心菜单
 */
var centerMenu = [{
	name: '个人中心',
	url: '../' + localStorage.getItem('userTable') + '/center.jsp'
}, 
{
	name: '我的订单',
	url: '../shop-order/list.jsp'
},

{
	name: '我的地址',
	url: '../shop-address/list.jsp'
},

{
	name: '我的收藏',
	url: '../storeup/list.jsp'
}
]


var indexNav = [

{
	name: '促销商品',
	url: './pages/cuxiaoshangpin/list.jsp'
}, 
{
	name: '商品信息',
	url: './pages/shangpinxinxi/list.jsp'
}, 

{
	name: '公告信息',
	url: './pages/news/list.jsp'
},
]

var adminurl =  "http://localhost:8080/jspm14vic/index.jsp";

var cartFlag = false

var chatFlag = false


cartFlag = true


var menu = [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["新增","查看","修改","删除"],"menu":"用户","menuJump":"列表","tableName":"yonghu"}],"menu":"用户管理"},{"child":[{"appFrontIcon":"cuIcon-album","buttons":["新增","查看","修改","删除","查看评论"],"menu":"促销商品","menuJump":"列表","tableName":"cuxiaoshangpin"}],"menu":"促销商品管理"},{"child":[{"appFrontIcon":"cuIcon-attentionfavor","buttons":["新增","查看","修改","删除","查看评论"],"menu":"商品信息","menuJump":"列表","tableName":"shangpinxinxi"}],"menu":"商品信息管理"},{"child":[{"appFrontIcon":"cuIcon-keyboard","buttons":["新增","查看","修改","删除"],"menu":"商品类型","menuJump":"列表","tableName":"shangpinleixing"}],"menu":"商品类型管理"},{"child":[{"appFrontIcon":"cuIcon-full","buttons":["查看","修改"],"menu":"轮播图管理","tableName":"config"},{"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"menu":"公告信息","tableName":"news"}],"menu":"系统管理"},{"child":[{"appFrontIcon":"cuIcon-goods","buttons":["查看","日销额","月销额","年销额"],"menu":"未支付订单","tableName":"orders/未支付"},{"appFrontIcon":"cuIcon-time","buttons":["查看","日销额","月销额","年销额"],"menu":"已取消订单","tableName":"orders/已取消"},{"appFrontIcon":"cuIcon-flashlightopen","buttons":["查看","发货","日销额","月销额","年销额"],"menu":"已支付订单","tableName":"orders/已支付"},{"appFrontIcon":"cuIcon-skin","buttons":["查看","日销额","月销额","年销额"],"menu":"已退款订单","tableName":"orders/已退款"},{"appFrontIcon":"cuIcon-goodsnew","buttons":["查看","日销额","月销额","年销额"],"menu":"已完成订单","tableName":"orders/已完成"},{"appFrontIcon":"cuIcon-full","buttons":["查看","日销额","月销额","年销额"],"menu":"已发货订单","tableName":"orders/已发货"}],"menu":"订单管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-camera","buttons":["查看","查看评论"],"menu":"促销商品列表","menuJump":"列表","tableName":"cuxiaoshangpin"}],"menu":"促销商品模块"},{"child":[{"appFrontIcon":"cuIcon-clothes","buttons":["查看","查看评论"],"menu":"商品信息列表","menuJump":"列表","tableName":"shangpinxinxi"}],"menu":"商品信息模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-favor","buttons":["查看","删除"],"menu":"我的收藏管理","tableName":"storeup"}],"menu":"我的收藏管理"},{"child":[{"appFrontIcon":"cuIcon-full","buttons":["查看"],"menu":"已发货订单","tableName":"orders/已发货"},{"appFrontIcon":"cuIcon-goods","buttons":["查看"],"menu":"未支付订单","tableName":"orders/未支付"},{"appFrontIcon":"cuIcon-time","buttons":["查看"],"menu":"已取消订单","tableName":"orders/已取消"},{"appFrontIcon":"cuIcon-flashlightopen","buttons":["查看"],"menu":"已支付订单","tableName":"orders/已支付"},{"appFrontIcon":"cuIcon-skin","buttons":["查看"],"menu":"已退款订单","tableName":"orders/已退款"},{"appFrontIcon":"cuIcon-goodsnew","buttons":["查看"],"menu":"已完成订单","tableName":"orders/已完成"}],"menu":"订单管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-camera","buttons":["查看","查看评论"],"menu":"促销商品列表","menuJump":"列表","tableName":"cuxiaoshangpin"}],"menu":"促销商品模块"},{"child":[{"appFrontIcon":"cuIcon-clothes","buttons":["查看","查看评论"],"menu":"商品信息列表","menuJump":"列表","tableName":"shangpinxinxi"}],"menu":"商品信息模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"用户","tableName":"yonghu"}]


var isAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].backMenu.length;j++){
                for(let k=0;k<menus[i].backMenu[j].child.length;k++){
                    if(tableName==menus[i].backMenu[j].child[k].tableName){
                        let buttons = menus[i].backMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}

var isFrontAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].frontMenu.length;j++){
                for(let k=0;k<menus[i].frontMenu[j].child.length;k++){
                    if(tableName==menus[i].frontMenu[j].child[k].tableName){
                        let buttons = menus[i].frontMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}
