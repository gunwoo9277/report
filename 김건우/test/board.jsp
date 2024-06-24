board


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>SNS 만들기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1, h2 {
            color: #333;
        }
        a {
            color: #4285f4;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #4285f4;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .container {
            width: 80%;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4285f4;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            margin: 10px 0;
        }
        .btn:hover {
            background-color: #3367d6;
        }
        .comment-area {
            margin-top: 10px;
        }
        .like-btn {
            background-color: #ff4081;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>SNS</h1>
    <a href="writePost.jsp" class="btn">글 쓰기</a>
    <h2>게시물 목록</h2>
    <%
    String query = "SELECT * FROM posts";
    try (PreparedStatement pstmt = conn.prepareStatement(query);
         ResultSet rs = pstmt.executeQuery()) {
    %>
    <table>
        <tr>
            <th>제목</th>
            <th>내용</th>
            <th>첨부 파일</th>
            <th>수정</th>
            <th>삭제</th>
            <th>좋아요</th>
        </tr>
    <%
        while (rs.next()) {
            int postId = rs.getInt("id");
    %>
        <tr>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("content") %></td>
            <td><a href="downloadFile.jsp?id=<%= postId %>"><%= rs.getString("file_name") %></a></td>
            <td><a href="editPost.jsp?id=<%= postId %>">수정</a></td>
            <td><a href="deletePost.jsp?id=<%= postId %>">삭제</a></td>
            <td>
                <form action="likePost.jsp" method="POST">
                    <input type="hidden" name="post_id" value="<%= postId %>">
                    <button type="submit" class="like-btn">하트</button>
                </form>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <div class="comment-area">
                    <form action="addComment.jsp" method="POST">
                        <input type="hidden" name="post_id" value="<%= postId %>">
                        <textarea name="comment" rows="2" cols="60" placeholder="댓글을 입력하세요"></textarea>
                        <button type="submit" class="btn">댓글 달기</button>
                    </form>
                    <h3>댓글</h3>
                    <%
                        String commentQuery = "SELECT * FROM comments WHERE post_id = ?";
                        try (PreparedStatement commentPstmt = conn.prepareStatement(commentQuery)) {
                            commentPstmt.setInt(1, postId);
                            try (ResultSet commentRs = commentPstmt.executeQuery()) {
                                while (commentRs.next()) {
                    %>
                        <p><%= commentRs.getString("comment") %> - <%= commentRs.getTimestamp("created_at") %></p>
                    <%
                                }
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                </div>
            </td>
        </tr>
    <%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    %>
    </table>
</div>
</body>
</html>