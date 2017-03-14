<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>调用百度地图接口获取位置</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script>
<script>
var x=document.getElementById("demo");
function getLocation(){
    if(navigator.geolocation){
       navigator.geolocation.getCurrentPosition(showPosition);
      }else{
       alert("您的浏览器不支持地理定位");
      }
      
   }
 
function showPosition(position){
    lat=position.coords.latitude;
    lon=position.coords.longitude;
    //var map = new BMap.Map("container");            // 创建Map实例
    var point = new BMap.Point(lon, lat);    // 创建点坐标
    //map.centerAndZoom(point,15);                     // 
    //map.enableScrollWheelZoom(); 
    var gc = new BMap.Geocoder();    
    gc.getLocation(point, function(rs){
       var addComp = rs.addressComponents;
       alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street);
       var local=addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street;
     	document.getElementById("local").value=local;  //查找元
      });
   }
</script>
</head>
<body>
<p id="demo">点击这个按钮，获得您的位置：</p>
<button onclick="getLocation()">试一下</button>
<input type="text" id="local"/>
</body>
</html>
