<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%-- <%@ page import="java.sql.*"%> --%>
<%-- <!DOCTYPE html> --%>
<html>
    <head>
        <title>第三个 JSP 程序- 数据的增删改查</title>
    </head>
    <body>
    <%-- JDBC 驱动及数据库 url 需要输入数据库的用户名和密码 --%>
    <%
        String url = "jdbc:mysql://localhost:3306/test";//连接数据库地址
        String username = "root";//登陆数据库的用户名
        String password = "root123";//登陆数据库的用户名的密码
        Connection conn = null;
        try {
        Class.forName("com.mysql.jdbc.Driver");//记载数据库驱动，注册到驱动管理器
        conn = DriverManager.getConnection(url, username, password);
          if (conn != null){
            out.println("数据库连接成功！！！"+"<br>");
          } else {
             out.println("数据库连接失败！！！"+"<br>");
          }
        } catch (ClassNotFoundException e){
         // e 是Throwable的实例异常对象，catch语句总相当于一个对象，一旦try发现异常，就把异常交给e。
          e.printStackTrace();
        }

        String testUserId = request.getParameter("userid");
        String testUserName = request.getParameter("username");
        String testPassword = request.getParameter("password");
        String testChoose = "";
        String testUpdate_user = request.getParameter("update_user");
        String testInsert_user = request.getParameter("insert_user");
        String testSelect_user = request.getParameter("select_user");
        String testDelete_user = request.getParameter("delete_user");
        /*if testChoose = ""*/
        // 测试是否可以取到值

          out.println("第一次testUserName="+testUserName+"<br>");
          out.println("第一次testChoose="+testChoose+"<br>");
          out.println("第一次testUpdate_user="+testUpdate_user+"<br>");
          out.println("第一次testInsert_user="+testInsert_user+"<br>");
          out.println("第一次testSelect_user="+testSelect_user+"<br>");
          out.println("第一次testDelete_user="+testDelete_user+"<br>");

              if (testUpdate_user != null){
                  out.println("开始修改数据记录"+"<br>");
                  try {
                    //创建语句对象Statement
                    Statement updateUser = conn.createStatement();
                    // 先做查询，查询了然后对上面的数据根据id进行修改
                    String updateUserRecord = "UPDATE user SET username = '"+testUserName+"' ,password ='"+testPassword+"' WHERE id='"+testUserId+"' ";
                    updateUser.executeUpdate(updateUserRecord);//执行语句
                    out.println("修改用户信息成功"+"<br>");
                  } catch (SQLException e){
                    out.println("修改用户信息失败"+"<br>");
                  }
              } else if (testInsert_user != null){
                  out.println("开始插入数据记录"+"<br>");
                  try {
                    //创建语句对象Statement
                    Statement insertUser = conn.createStatement();
                    String  insertDateUserRecord = "INSERT INTO user(id,username,password) VALUES ('"+testUserId+"','"+testUserName+"','"+testPassword+"')" ;//添加用户
                    insertUser.executeUpdate(insertDateUserRecord);//执行语句
                    out.println("添加用户信息成功"+"<br>");
                  } catch (SQLException e){
                    out.println("添加用户信息失败"+"<br>");
                  }
              } else if (testSelect_user != null){
                  out.println("开始查询数据记录"+"<br>");
                  try {
                  //创建语句对象Statement
                  Statement selectUser = conn.createStatement();
                  // 先做查询，查询了然后对上面的数据根据id进行修改
                  String selectUserRecord = "SELECT id, username, password FROM user WHERE username = '"+testUserName+"' or id='"+testUserId+"' ";
                  //查询user全部
                  //String selectUserRecord = "SELECT * FROM user";
                  ResultSet rs = selectUser.executeQuery(selectUserRecord);//执行语句
                  //打印表头
                  out.println("查询用户信息完成"+"<br>");
                  out.println("<TABLE border>");
                  out.println("<TR>");
                  out.println("<TH width=30>"+"ID");
                  out.println("<TH width=100>"+"用户名");
                  out.println("<TH width=100>"+"PASSWORD");
                  out.println("</TR>");
                  //打印结果查询结果
                  while(rs.next()){
                    out.println("<TR>");
                    out.println("<TD>"+rs.getString(1)+"</TD>");
                    out.println("<TD>"+rs.getString(2)+"</TD>");
                    out.println("<TD>"+rs.getString(3)+"</TD>");
                    out.println("</TR>");
                  }
                  out.println("</TABLE>");
                  rs.close();
                } catch (SQLException e){
                  out.println("查询用户信息失败"+"<br>");
                }
              } else if (testDelete_user !=null){
                  out.println("开始删除数据记录"+"<br>");
                  try {
                  //创建语句对象Statement
                  Statement deleteUser = conn.createStatement();
                  // 先做查询，查询了然后对上面的数据根据id进行修改
                  String deleteUserRecord = "DELETE FROM user WHERE username = '"+testUserName+"' or id='"+testUserId+"'";
                  deleteUser.executeUpdate(deleteUserRecord);//执行语句
                  out.println("删除用户信息成功"+"<br>");
                } catch (SQLException e){
                  out.println("删除用户信息失败"+"<br>");
                }
              } else {
                  out.println("等待命令"+"<br>");
              }
    %>
    </body>
</html>
