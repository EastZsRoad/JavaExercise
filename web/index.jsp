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


<h2 style="font-family:arial;color:#000000;font-size:25px;text-align:center">�����ܳ������</h2>


<form action="result.jsp" method="get" onsubmit="return checkall()" align="center" >
  <div id="div0">

</div>


    <input type="submit" name="submit" value="����" >
    <input type="reset"  name="reset" value="����">
    <input type="button" name="button" value="���" onclick="addfunc()">
    <input type="button" name="button" value="����xml" onclick="addurl('http://47.52.164.127/shape.xml')"><br/>
    ����XML<input type="checkbox" id = "ckid" name="ck" onclick="check()" value="">


</form>


</html>


<script>
    function check()
    {
        var check = document.getElementById("ckid");
        if(check.checked ){
            check.value = "1";
        }else{
            check.value = "0";
        }

    }

    var countflg = 1;
    var currentdiv = document.getElementById("div0");

        function addfunc(a, b, c) {
            var textNode1 = document.createTextNode("��״��");
            var textNode2 = document.createTextNode("����");
            var textNode3 = document.createTextNode("Բ��");
            var textNode4 = document.createTextNode("���������ᣩ��");
            var textNode5 = document.createTextNode("���̰��ᣩ��");
            var divid = "div" + countflg.toString();
            var radio1 = "1b" + countflg.toString();
            var radio2 = "2b" + countflg.toString();
            var shapename = "shape" + countflg.toString();
            var textid1 = "1t" + countflg.toString();
            var textid2 = "2t" + countflg.toString();
            if (countflg < 10) {

                var div = document.createElement("div");
                div.id = divid;
                currentdiv.appendChild(div);

                div.appendChild(textNode1);
                var ipt1 = document.createElement("input");

                ipt1.setAttribute("id", radio1);
                ipt1.setAttribute("type", "radio");
                ipt1.setAttribute("name", shapename);
                ipt1.setAttribute("value", "SQUA");
                ipt1.onclick = function () {
                    textNode4.textContent = "��";
                    textNode5.textContent = "��";
                } ;
                div.appendChild(ipt1);
                div.appendChild(textNode2);


                var ipt2 = document.createElement("input");
                ipt2.setAttribute("id", radio2);
                ipt2.setAttribute("type", "radio");
                ipt2.setAttribute("name", shapename);
                ipt2.setAttribute("value", "CIRC");
                ipt2.onclick = function () {
                    textNode4.textContent = "������";
                    textNode5.textContent = "�����";
                } ;

                div.appendChild(ipt2);
                div.appendChild(textNode3);
                div.appendChild(document.createElement("br"));
                div.appendChild(document.createElement("br"));
                switch (a) {
                    case "SQUA":
                        alert("����");
                        ipt1.setAttribute("checked", "true");
                        textNode4.textContent = "��";
                        textNode5.textContent = "��";
                        break;

                    case "CIRC":
                        alert("Բ��");
                        //������ɫ
                        ipt2.setAttribute("checked", "true");
                        textNode4.textContent = "������";
                        textNode5.textContent = "�����";
                        break;

                }
                div.appendChild(textNode4);
                var ipt3 = document.createElement("input");
                ipt3.setAttribute("id", textid1);
                ipt3.setAttribute("type", "number");
                ipt3.setAttribute("name", "longth");
                ipt3.setAttribute("size", "20");
                ipt3.setAttribute("value", b);
                ipt3.setAttribute("maxlength", "20");
                div.appendChild(ipt3);
                div.appendChild(document.createElement("br"));
                div.appendChild(textNode5);

                var ipt4 = document.createElement("input");
                ipt3.setAttribute("id", textid2);
                ipt4.setAttribute("type", "number");
                ipt4.setAttribute("name", "width");
                ipt4.setAttribute("size", "20");
                ipt4.setAttribute("value", c);
                ipt4.setAttribute("maxlength", "20");
                div.appendChild(ipt4);
                div.appendChild(document.createElement("br"));
                countflg++;

            }
        }



    function parseXml(fileName)
    {
        try{//Internet Explorer
            xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            //���� XML�ĵ�,��ȡXML�ĵ�����
            xmlDoc.load(fileName);
        }catch(e){//Firefox, Mozilla, Opera, etc.
            try{
                xmlDoc=document.implementation.createDocument("","",null);
                xmlDoc.async = "false";
                //���� XML�ĵ�,��ȡXML�ĵ�����
                xmlDoc.load(fileName);
            }catch(e){
                try{//Google Chrome
                    var xmlhttp=new window.XMLHttpRequest();

                    xmlhttp.open("get",fileName,false);
                    xmlhttp.send(null);
                    xmlDoc=xmlhttp.responseXML;
                }catch(e){
                    alert("����������������������ļ������л�������ģʽ�����߸��������");
                }
            }
        }
        return xmlDoc;
    }


        function addurl(url) {
            a = parseXml(url);
            var x = a.getElementsByTagName("shape");
            for (i = 0; i < x.length; i++) {
                addfunc(x[i].getElementsByTagName("shapetype")[0].childNodes[0].nodeValue, x[i].getElementsByTagName("number1")[0].childNodes[0].nodeValue, x[i].getElementsByTagName("number2")[0].childNodes[0].nodeValue);
            }

        }
        //
        // a = parseXml("http://47.52.164.127/shape.xml");
        // //a = parseXml("C:\\Users\\Lenovo\\IdeaProjects\\javaweb_exercise\\web\\shape.xml");
        // //document.write("<table border='1'>");
        // var x = a.getElementsByTagName("shape");
        // for (i = 0; i < x.length; i++) {
        //     // document.write("<tr><td>");
        //     // document.write(x[i].getElementsByTagName("shapetype")[0].childNodes[0].nodeValue);
        //     // document.write("</td><td>");
        //     // document.write(x[i].getElementsByTagName("number1")[0].childNodes[0].nodeValue);
        //     // document.write("</td><td>");
        //     // document.write(x[i].getElementsByTagName("number2")[0].childNodes[0].nodeValue);
        //     // document.write("</td></tr>");
        //     infunc(x[i].getElementsByTagName("shapetype")[0].childNodes[0].nodeValue, x[i].getElementsByTagName("number1")[0].childNodes[0].nodeValue, x[i].getElementsByTagName("number2")[0].childNodes[0].nodeValue);
        //
        // }
        // //document.write("</table>");



    function checkall() {
        var name = document.getElementById("div1");
        if(name == null){
            alert("����Ч����");
            return false;
        }

    }

</script>
