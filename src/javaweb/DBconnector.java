package javaweb;

import java.sql.*;

public class DBconnector {


    public void InsertData(int id, String name, double number1, double number2, double length, double area) {

         final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
         final String DB_URL = "jdbc:mysql://localhost:3306";



        final String USER = "root";
        final String PASS = "!QAZ2wsx";

        Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 打开链接
            System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            // 执行查询
            System.out.println(" 实例化Statement对象...");
            stmt = conn.createStatement();
            String sql;
            sql = "jdbc:mysql://localhost:3306/SHAPEDB?useUnicode=true&characterEncoding=utf-8";
            conn = DriverManager.getConnection(sql, USER, PASS);
            stmt = conn.createStatement();

            stmt.executeUpdate("insert into test values(" + id + ",'" + name + "'," + number1 + "," + number2 + "," + length + "," + area + ")");

            stmt.close();
            conn.close();

        } catch (SQLException se) {
            // 处理 JDBC 错误
            se.printStackTrace();
        } catch (Exception e) {
            // 处理 Class.forName 错误
            e.printStackTrace();
        } finally {
            // 关闭资源
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }// 什么都不做
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        System.out.println("Goodbye!");
    }


    public static void main(String[] args) {

        final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        final String DB_URL = "jdbc:mysql://localhost:3306";



        final String USER = "root";
        final String PASS = "!QAZ2wsx";
        Connection conn = null;
        Statement stmt = null;
        try{

        // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");

            // 打开链接
            System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            // 执行查询
            System.out.println(" 实例化Statement对象...");
            stmt = conn.createStatement();
            String sql;
//            sql = "create database SHAPEDB";
//            stmt.executeUpdate(sql);
//            stmt.close();
//            conn.close();

            sql = "jdbc:mysql://localhost:3306/SHAPEDB?useUnicode=true&characterEncoding=utf-8";
            conn = DriverManager.getConnection(sql,USER,PASS);
            stmt = conn.createStatement();
//            stmt.executeUpdate("drop table test");
//           stmt.executeUpdate("create table test( id int, name varchar(80),number1 double,number2 double ,length double,area double)");
//            stmt.executeUpdate("insert into test values('0','SQUA', '10','20','125.6000000000000','1942.000000000000')");
//            stmt.executeUpdate("insert into test values('2','CIRC', '10','20','94.2','628')");
//            查询数据
            ResultSet result = stmt.executeQuery("select * from test");
            while (result.next())
            {
                System.out.println(result.getInt("id") + " "+ result.getInt("area") + " " + result.getString("length"));
            }

//            关闭数据库
            result.close();
            stmt.close();
            conn.close();

        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }finally{
            // 关闭资源
            try{
                if(stmt!=null) stmt.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }
        System.out.println("Goodbye!");
    }


//
//    public static void main(String[] args) {
//
//        DBconnector a = new DBconnector();
//        a.InsertData(1, "CIRC", 10, 20, 125.6000000000000, 942.000000000000);
//        a.InsertData(2, "CIRC", 10, 20, 125.6000000000000, 942.000000000000);
//        a.InsertData(3, "CIRC", 10, 20, 125.6000000000000, 942.000000000000);
//
//    }
}

