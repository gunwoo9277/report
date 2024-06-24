<%@ page contentType="text/html; charset=utf-8"%>
<html lang="ko">
<head>
<title>회원가입 페이지</title>
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
    }
    .container h2 {
        margin-top: 0;
        text-align: center;
    }
    .container form {
        display: flex;
        flex-direction: column;
    }
    .container form input[type="text"],
    .container form input[type="password"] {
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .container form input[type="submit"] {
        padding: 10px;
        border: none;
        border-radius: 4px;
        background-color: #007BFF;
        color: #fff;
        cursor: pointer;
        margin-top: 10px;
    }
    .container form input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <h2>회원가입</h2>
    <form method="post" action="insert01_process.jsp">
        <label for="id">아이디 :</label>
        <input type="text" id="id" name="id">
        <label for="passwd">비밀번호 :</label>
        <input type="password" id="passwd" name="passwd">
        <label for="name">이름 :</label>
        <input type="text" id="name" name="name">
        <input type="submit" value="전송">
    </form>
</div>
</body>
</html>