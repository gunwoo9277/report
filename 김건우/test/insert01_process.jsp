<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html lang="ko">
<head>
<title>회원가입 처리</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .container h2 {
        margin-top: 0;
    }
    .container p {
        margin-bottom: 20px;
    }
    .container a {
        display: inline-block;
        padding: 10px 20px;
        margin-top: 10px;
        border: none;
        border-radius: 4px;
        background-color: #007BFF;
        color: #fff;
        text-decoration: none;
        cursor: pointer;
    }
    .container a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
Statement stmt = null;
try {
    String sql = "INSERT INTO Member(id, passwd, name) VALUES('" + id + "','" + passwd + "', '" + name + "')";
    stmt = conn.createStatement();
    stmt.executeUpdate(sql);
    out.println("<h2>회원가입을 완료했습니다.</h2>");
    out.println("<p><a href='index.html'>로그인 페이지로 이동</a></p>");
} catch (SQLException ex) {
    out.println("<h2>회원가입에 실패했습니다.</h2>");
    out.println("<p>SQLException: " + ex.getMessage() + "</p>");
    out.println("<p><a href='insert.jsp'>다시 시도</a></p>");
} finally {
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
}
%>
</div>
</body>
</html>