<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<html>
    <head>
           <title>第二个 JSP 程序-连接数据库</title>
    </head>
    <body>
   <%-- JDBC 驱动及数据库 url 需要输入数据库的用户名和密码 --%>
    <%
      try{
        Class.forName("com.mysql.jdbc.Driver");//记载数据库驱动，注册到驱动管理器
        String url="jdbc:mysql://localhost:3306/test";
        // url指向要访问的数据库名test
        String username="root";
        String password="root123";
        Connection conn=DriverManager.getConnection(url,username,password);
        if(conn!=null){
            out.println("数据库连接成功！！！");
        }else{
            out.println("数据库连接失败！！！");
        }
      }catch(ClassNotFoundException e){
        // e 是Throwable的实例异常对象，catch语句总相当于一个对象，一旦try发现异常，就把异常交给e。
        e.printStackTrace();
      }
   %>
    </body>
</html>
