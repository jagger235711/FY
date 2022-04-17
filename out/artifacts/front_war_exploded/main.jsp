<%--
  Created by IntelliJ IDEA.
  User: 25258
  Date: 2022/1/10
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
    <link href="./css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href='http://fonts.googleapis.com/css?family=Glegoo' rel='stylesheet' type='text/css'>
    <link href="css/datouwang.css" rel="stylesheet" type="text/css"/>
    <%--    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>--%>
    <script type="text/javascript" src="./js/move-top.js"></script>
    <script type="text/javascript" src="./js/easing.js"></script>
    <script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="./js/koala.min.1.5.js"></script>
    <style>

        #container {

            width: 750px;

            top: 50px;
        }

        #title {
            width: 100%;
            height: 50px;
            text-align: center;
            line-height: 50px;
            font-size: 1.3em;
            background-color: #0FF;
        }

        #scrollBox {
            width: 750px;
            height: 144px;
            overflow: hidden;
        }

        #scrollBox ul {
            height: 144px;
            width: 750px;
        }

        #scrollBox ul li {
            height: 24px;
            width: 100%;
            text-align: left;
            font-size: 24px;
            line-height: 24px;
        }

        #scrollBox ul li a {
            font-size: x-small;
            text-decoration: none;
            color: #f60;
        }

        #scrollBox ul li a:hover {
            color: #000;
            font-size: xx-small;
        }
    </style>
</head>


<body>
<br><br>
<!---start-wrap---->
<div class="wrap">
    <!---start-banner---->
    <div class="banner">
        <div class="banner-img">
            <a href="#"><img src="./images/map.png" title="banner"/></a>
        </div>
        <div class="banner-info">
            <h1>东北非物质文化遗产网</h1>
            <h2>使命：收集、保护、发扬传统文化</h2>
            <p>责任：解决东北非物质文化遗产保护问题，为东北非物质文化遗产的保护与传承创造更多有利条件；动态获取非遗申请信息，关注属于我国的非物质文化遗产，保护本国非遗不被抢注；继承和弘扬中华民族优秀传统文化。</p>
        </div>
        <div class="clear"></div>
    </div>
    <!---End-banner---->
</div>
<br><br><br><br><br>

<!-- 代码 开始 -->
<div id="fsD1" class="focus" style="margin-left:400px">
    <div id="D1pic1" class="fPic">
        <div class="fcon" style="display: none;">
            <a href="http://sc.chinaz.com/"><img src="images/i1.jpg" style="opacity: 1; "></a>
            <span class="shadow"><a href="#">珠算课程讲解</a></span>
        </div>

        <div class="fcon" style="display: none;">
            <a href="http://sc.chinaz.com/"><img src="images/i2.jpg" style="opacity: 1; "></a>
            <span class="shadow"><a href="#">体验中医针灸</a></span>
        </div>

        <div class="fcon" style="display: none;">
            <a href="http://sc.chinaz.com/"><img src="images/i3.jpg" style="opacity: 1; "></a>
            <span class="shadow"><a href="#">观众体验二十四节气立夏称人习俗</a></span>
        </div>

        <div class="fcon" style="display: none;">
            <a href="http://sc.chinaz.com/"><img src="images/i4.jpg" style="opacity: 1; "></a>
            <span class="shadow"><a href="#">端午习俗</a></span>
        </div>
    </div>
    <div class="fbg">
        <div class="D1fBt" id="D1fBt">
            <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>1</i></a>
            <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>2</i></a>
            <a href="javascript:void(0)" hidefocus="true" target="_self" class="current"><i>3</i></a>
            <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>4</i></a>
        </div>
    </div>
    <span class="prev"></span>
    <span class="next"></span>
</div>

<div class="content">
    <div class="wrap">
        <div class="about" id="about">
            <h3>关于我们</h3>
            <p class="para">来自五湖四海却都被东北文化深深吸引的四个普通大学生
            </p>
            <a href="#"><img src="./images/i5.jpg" title="name"/></a>
            <h4>Hello！东北</h4>
            <p class="para">在了解之前，我们从不知道东北三省的文化底蕴有如此深厚：200余项已被刊录的非物质文化遗产，包含了文学、音乐、舞蹈、戏曲等10多个大项。
            </p>
            <h1>公告与新闻</h1>
            <div id="container">
                <div id="title"><a href="#">更多</a></div>
                <div id="scrollBox">
                    <ul>
                        <li><a href="https://www.ihchina.cn/news_2_details/24581.html">财政部 文化和旅游部关于印发《国家非物质文化遗产保护资金管理办法》的通知（财教〔2021〕314号）</a></li>
                        <li><a href="https://www.ihchina.cn/news_2_details/24557.html">河北省非物质文化遗产保护中心关于公布2021年度河北省非遗优秀实践案例的公告</a></li>
                        <li><a href="https://www.ihchina.cn/news_2_details/24522.html">宁夏回族自治区文化和旅游厅关于公布第六批自治区级非物质文化遗产代表性项目代表性传承人的通知</a></li>
                        <li><a href="https://www.ihchina.cn/news_2_details/24503.html">辽宁省文化和旅游厅关于印发《辽宁省“十四五”非物质文化遗产保护规划》的通知</a></li>
<%--                        <li><a href="#">5:jquery学习</a></li>--%>
<%--                        <li><a href="#">6:htmll5和css3学习</a></li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
<script type="text/javascript">
    Qfast.add('widgets', {path: "js/terminator2.2.min.js", type: "js", requires: ['fx']});
    Qfast(false, 'widgets', function () {
        K.tabs({
            id: 'fsD1',   //焦点图包裹id
            conId: "D1pic1",  //** 大图域包裹id
            tabId: "D1fBt",
            tabTn: "a",
            conCn: '.fcon', //** 大图域配置class
            auto: 1,   //自动播放 1或0
            effect: 'fade',   //效果配置
            eType: 'click', //** 鼠标事件
            pageBt: true,//是否有按钮切换页码
            bns: ['.prev', '.next'],//** 前后按钮配置class
            interval: 3000  //** 停顿时间
        })
    })
</script>
<script type="text/javascript">
    $(document).ready(function () {
        /*
        var defaults = {
                containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({easingType: 'easeOutQuart'});

    });
</script>
<script type="text/javascript">


    //window.onload=function(){
    //获取滚动部分
    var area = document.getElementById("scrollBox");
    //设置全局定时器
    var timer = null;
    //定义延迟
    var delay = 2000;
    //获取高度
    var oLiHeight = $("#scrollBox li").height();
    //速度
    var speed = 50;
    area.scrollTop = 0;
    area.innerHTML += area.innerHTML;

    function startScroll() {//开始运动
        timer = setInterval("scrollUp()", speed);
        area.scrollTop++;
    }

    function scrollUp() {//循环运动
        if (area.scrollTop % oLiHeight === 0) {
            clearInterval(timer)
            setTimeout(startScroll, delay);
        } else {
            area.scrollTop++;
            if (area.scrollTop >= area.scrollHeight / 2) {
                area.scrollTop = 0;
            }
        }
    }

    //页面加载两秒后运动
    setTimeout(startScroll, delay)
    //鼠标事件
    // $("#scrollBox").mouseover(function () {
    //     clearInterval(timer)
    // });
    // $("#scrollBox").mouseout(function () {
    //     timer = setInterval('scrollUp()', speed)
    // });


</script>
<!---End-copy-right---->
<!---start-wrap---->
</body>
</html>


