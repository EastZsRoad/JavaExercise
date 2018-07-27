<%@ page import="javaweb.Shape" %>
<%@ page import="java.util.List" %>
<%@ page import="javaweb.ReadxmlByDom" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/7/23
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html; charset=GB2312"%>
<html>
<head>
  <title>
    index jsp file
  </title>
</head>


<h2 style="font-family:arial;color:#000000;font-size:25px;text-align:center">计算周长和面积</h2>



<form action="result.jsp" method="get" align="center">
  <div id="div0">
  <%--&nbsp;形状：<input type="radio" name="shape" value="矩形" onclick="doSm(1)">矩形--%>
  <%--&nbsp;<input type="radio" name="shape" value="圆形" onclick="doSm(2)">圆形<br/><br/>--%>

  <%--长（长半轴）：<input id = "p1" type="number" name="longth" size="20" value="" maxlength="20"><br/>--%>
  <%--宽（短半轴）：<input id = "p2" type="number" name="width" size="20" value="" maxlength="20"><br/><br/>--%>

</div>

    <input type="submit" name="submit" value="计算" >
    <input type="reset"  name="reset" value="重置">
    <input type="button" name="button" value="添加" onclick="addfunc()"><br/>

</form>


<%--<body onload=addfunc()>--%>
<%--</body>--%>

</html>




<script>

    var countflg = 1;

    function addfunc(){

        var textNode1 = document.createTextNode("形状：");
        var textNode2 = document.createTextNode("矩形");
        var textNode3 = document.createTextNode("圆形");
        var textNode4 = document.createTextNode("长（长半轴）：");
        var textNode5 = document.createTextNode("宽（短半轴）：");

        var divid = "div"+countflg.toString();
        var radio1 = "1b"+countflg.toString();
        var radio2 = "2b"+countflg.toString();
        var shapename = "shape"+countflg.toString();
        var textid1 = "1t"+countflg.toString();
        var textid2 = "2t"+countflg.toString();
        if (countflg < 10) {

            var div = document.createElement("div");
            div.id = divid;
            var currentdiv = document.getElementById("div0");

            currentdiv.appendChild(div);
            alert(divid);

            div.appendChild(textNode1);
            var ipt1 = document.createElement("input");

            ipt1.setAttribute("id", radio1);
            ipt1.setAttribute("type", "radio");
            ipt1.setAttribute("name", shapename);
            ipt1.setAttribute("value", "SQUA");
            ipt1.setAttribute("onclick", "doSm(1)");
            div.appendChild(ipt1);
            div.appendChild(textNode2);


            var ipt2 = document.createElement("input");
            ipt2.setAttribute("id", radio2);
            ipt2.setAttribute("type", "radio");
            ipt2.setAttribute("name", shapename);
            ipt2.setAttribute("value", "CIRC");
            ipt2.setAttribute("onclick", "doSm(2)");

            div.appendChild(ipt2);
            div.appendChild(textNode3);
            div.appendChild(document.createElement("br"));
            div.appendChild(document.createElement("br"));

            div.appendChild(textNode4);
            var ipt3 = document.createElement("input");
            ipt3.setAttribute("id", textid1);
            ipt3.setAttribute("type", "number");
            ipt3.setAttribute("name", "longth");
            ipt3.setAttribute("size", "20");
            ipt3.setAttribute("value", "");
            ipt3.setAttribute("maxlength", "20");
            div.appendChild(ipt3);
            div.appendChild(document.createElement("br"));
            div.appendChild(textNode5);

            var ipt4 = document.createElement("input");
            ipt3.setAttribute("id", textid2);
            ipt4.setAttribute("type", "number");
            ipt4.setAttribute("name", "width");
            ipt4.setAttribute("size", "20");
            ipt4.setAttribute("value", "");
            ipt4.setAttribute("maxlength", "20");
            div.appendChild(ipt4);
            div.appendChild(document.createElement("br"));
            countflg ++;
        }
        function infunc(a,b,c){
            var textNode1 = document.createTextNode("形状：");
            var textNode2 = document.createTextNode("矩形");
            var textNode3 = document.createTextNode("圆形");
            var textNode4 = document.createTextNode("长（长半轴）：");
            var textNode5 = document.createTextNode("宽（短半轴）：");

            var divid = "div"+countflg.toString();
            var radio1 = "1b"+countflg.toString();
            var radio2 = "2b"+countflg.toString();
            var shapename = "shape"+countflg.toString();
            var textid1 = "1t"+countflg.toString();
            var textid2 = "2t"+countflg.toString();
            if (countflg < 10) {

                var div = document.createElement("div");
                div.id = divid;
                var currentdiv = document.getElementById("div0");

                currentdiv.appendChild(div);
                alert(divid);

                div.appendChild(textNode1);
                var ipt1 = document.createElement("input");

                ipt1.setAttribute("id", radio1);
                ipt1.setAttribute("type", "radio");
                ipt1.setAttribute("name", shapename);
                ipt1.setAttribute("value", "SQUA");
                ipt1.setAttribute("onclick", "doSm(1)");
                div.appendChild(ipt1);
                div.appendChild(textNode2);


                var ipt2 = document.createElement("input");
                ipt2.setAttribute("id", radio2);
                ipt2.setAttribute("type", "radio");
                ipt2.setAttribute("name", shapename);
                ipt2.setAttribute("value", "CIRC");
                ipt2.setAttribute("onclick", "doSm(2)");

                div.appendChild(ipt2);
                div.appendChild(textNode3);
                div.appendChild(document.createElement("br"));
                div.appendChild(document.createElement("br"));

                div.appendChild(textNode4);
                var ipt3 = document.createElement("input");
                ipt3.setAttribute("id", textid1);
                ipt3.setAttribute("type", "number");
                ipt3.setAttribute("name", "longth");
                ipt3.setAttribute("size", "20");
                ipt3.setAttribute("value", "");
                ipt3.setAttribute("maxlength", "20");
                div.appendChild(ipt3);
                div.appendChild(document.createElement("br"));
                div.appendChild(textNode5);

                var ipt4 = document.createElement("input");
                ipt3.setAttribute("id", textid2);
                ipt4.setAttribute("type", "number");
                ipt4.setAttribute("name", "width");
                ipt4.setAttribute("size", "20");
                ipt4.setAttribute("value", "");
                ipt4.setAttribute("maxlength", "20");
                div.appendChild(ipt4);
                div.appendChild(document.createElement("br"));
                countflg ++;

        }

        function doSm(flg){
            switch(flg){
                case 1:
                    alert("矩形");
                    var div1 = document.getElementById("div2");
                    div1.style.color = "#000";
                    break;

                case 2:
                    alert("圆形");
                    //字体颜色
                    var div2 = document.getElementById("div2");
                    div2.style.color = "#f00";
                    break;

            }
        }

    }


</script>

<script type="text/javascript">
    function F_Open_dialog()
    {
        document.getElementById("btn_file").click();
    }
</script>
<div  id="diva"  align="center">
    <input type="file" id="btn_file" style="display:none">
    <button type="button" onclick="F_Open_dialog()">选择文件</button>
</div>

<script type="text/javascript">
    function parseXml(fileName)
    {
        try{//Internet Explorer
            xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            //加载 XML文档,获取XML文档对象
            xmlDoc.load(fileName);
        }catch(e){//Firefox, Mozilla, Opera, etc.
            try{
                xmlDoc=document.implementation.createDocument("","",null);
                xmlDoc.async = "false";
                //加载 XML文档,获取XML文档对象
                xmlDoc.load(fileName);
            }catch(e){
                try{//Google Chrome
                    var xmlhttp=new window.XMLHttpRequest();
                    xmlhttp.open("get",fileName,false);
                    xmlhttp.send(null);
                    xmlDoc=xmlhttp.responseXML;
                }catch(e){
                    alert("您的浏览器不能正常加载文件。请切换到兼容模式，或者更换浏览器");
                }
            }
        }
        return xmlDoc;
    }

    a = parseXml("shape.xml");
    document.write("<table border='1'>");
    var x=a.getElementsByTagName("shape");
    for (i=0;i<x.length;i++)
    {
        document.write("<tr><td>");
        document.write(x[i].getElementsByTagName("shapetype")[0].childNodes[0].nodeValue);
        document.write("</td><td>");
        document.write(x[i].getElementsByTagName("number1")[0].childNodes[0].nodeValue);
        document.write("</td><td>");
        document.write(x[i].getElementsByTagName("number2")[0].childNodes[0].nodeValue);
        document.write("</td></tr>");

    }
    document.write("</table>");
</script>

