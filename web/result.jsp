<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/7/23
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>

<%@page language="java" import="java.util.*" pageEncoding="GB2312"%>
<html>
<head>
  <title>
    result.jsp file
  </title>
</head>

<body bgcolor="ffffff">
<%@  page   import= "javaweb.*"%>


<%
  request.setCharacterEncoding("GB2312");
  String[] number1=request.getParameterValues("longth");
  String[] number2=request.getParameterValues("width");
  String shapes[];
  String lens[];
  String areas[];

  shapes = new String[number1.length];
  for (int i = 0;i < number1.length;i++){
      String shape =request.getParameter(String.format("shape" + (i + 1)));
      shapes[i] = shape;
  }

  double len, area;
  Transfer t = new Transfer();
  DBconnector d = new DBconnector();
  lens = new String [number1.length];
  areas = new String [number1.length];

    for (int i = 0;i < number1.length;i++){
        len = t.LengthOutput(Double.valueOf(number1[i]),Double.valueOf(number2[i]),shapes[i]);
        lens[i] = String.format("%.2f",len);
        area = t.AreaOutput(Double.valueOf(number1[i]),Double.valueOf(number2[i]),shapes[i]);
        areas[i] = String.format("%.2f",area);
        d.InsertData(i,shapes[i],Double.valueOf(number1[i]),Double.valueOf(number2[i]),len,area);
        out.print(""+Double.valueOf(number1[i]) +" "+shapes[i]);
    }

    try {
        WritexmlByDom.WriteShapes(shapes,number1,number2,lens,areas,"C:\\Users\\Lenovo\\IdeaProjects\\javaweb_exercise\\web\\shapeoutput.xml");

    } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }




%>

计算完毕！<br/>

长（长半轴）：<%
    for(String n1: number1)
    {
        //n1=new String(n1.getBytes("iso-8859-1"),"GB2312");
        out.print(n1+" ");
    }
%>

长（长半轴）：<%
    for(String n2: number2)
    {
        //n2=new String(n2.getBytes("iso-8859-1"),"GB2312");
        out.print(n2+" ");
    }
%>
形状：<%
    for(String n2: shapes)
    {
        //n2=new String(n2.getBytes("iso-8859-1"),"GB2312");
        out.print(n2+" ");
    }
%>

周长：<%
    for(String n2: lens)
    {
        //n2=new String(n2.getBytes("iso-8859-1"),"GB2312");
        out.print(n2+" ");
    }
%>
面积：<%
    for(String n2: areas)
    {
        //n2=new String(n2.getBytes("iso-8859-1"),"GB2312");
        out.print(n2+" ");
    }
%>




</body>

</html>

