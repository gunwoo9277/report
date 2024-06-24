<%@ page pageEncoding="utf-8"%>
<html lang="ko">
<head>
<title>로그인 처리</title>
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
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

if (id.equals("hong") && pw.equals("1234")) {
    response.sendRedirect("board.jsp");
} else {
    out.println("<h2>로그인 실패</h2>");
    out.println("<p>id: " + id + "</p>");
    out.println("<p>pw: " + pw + "</p>");
}
%>
<p><a href="index.html">로그인 화면으로 돌아가기</a></p>
</div>
</body>
</html>