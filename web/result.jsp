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
<%@page import="java.sql.*" %>



<%

        request.setCharacterEncoding("GB2312");
        String[] number1=request.getParameterValues("longth");
        String[] number2=request.getParameterValues("width");
        String  ck  = request.getParameter("ck");
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
        WritexmlByDom a = new WritexmlByDom();
        lens = new String [number1.length];
        areas = new String [number1.length];

    Connection conn = null;
    Statement stmt = null;
    try {
        final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        final String DB_URL = "jdbc:mysql://localhost:3306";
        final String USER = "root";
        final String PASS = "!QAZ2wsx";

        // ע�� JDBC ����
        Class.forName("com.mysql.jdbc.Driver");
        // ������
        System.out.println("�������ݿ�...");
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
        // ִ�в�ѯ
        System.out.println(" ʵ����Statement����...");
        stmt = conn.createStatement();
        String sql;
        sql = "jdbc:mysql://localhost:3306/SHAPEDB?useUnicode=true&characterEncoding=utf-8";
        conn = DriverManager.getConnection(sql, USER, PASS);
        stmt = conn.createStatement();
        for (int i = 0;i < number1.length;i++){
            len = t.LengthOutput(Double.valueOf(number1[i]),Double.valueOf(number2[i]),shapes[i]);
            lens[i] = String.format("%.2f",len);
            area = t.AreaOutput(Double.valueOf(number1[i]),Double.valueOf(number2[i]),shapes[i]);
            areas[i] = String.format("%.2f",area);
            System.out.println("start insert data");
            stmt.executeUpdate("insert into test values(" + i + ",'" + shapes[i] + "'," + Double.valueOf(number1[i]) + "," + Double.valueOf(number2[i]) + "," + Double.valueOf(lens[i]) + "," + Double.valueOf(areas[i]) + ")");
            System.out.println("insert "+i+shapes[i]+(number1[i])+(number2[i])+Double.valueOf(lens[i])+Double.valueOf(areas[i]));
        }
        stmt.close();
        conn.close();


    } catch (Exception e) {
        // ���� Class.forName ����
        e.printStackTrace();
    } finally {
        // �ر���Դ
        try {
            if (stmt != null) stmt.close();
        } catch (SQLException se2) {
        }// ʲô������
        try {
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }

        if (ck != null ){
            try {
                out.print(" xml saved start");
                a.WriteShapes(shapes, number1, number2, lens, areas, "C:\\Users\\Lenovo\\IdeaProjects\\javaweb_exercise\\web\\shapeoutput.xml");
                out.print(" xml saved");
            }
            catch (Exception e) {
                    e.printStackTrace();
                }
          } else{
            out.print("no xml saved :"+ ck);
        }

%>

������ϣ�<br/>


���������ᣩ��<%
    for(String n1: number1)
    {
        out.print(n1+" ");
    }
%>

���̰��ᣩ��<%
    for(String n2: number2)
    {
        out.print(n2+" ");
    }
%>
��״��<%
    for(String n2: shapes)
    {
        out.print(n2+" ");
    }
%>

�ܳ���<%
    for(String n2: lens)
    {
        out.print(n2+" ");
    }
%>
�����<%
    for(String n2: areas)
    {
        out.print(n2+" ");
    }
%>


</body>

</html>

