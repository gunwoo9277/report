<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String postId = request.getParameter("postId");
    String userId = request.getParameter("userId");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDatabaseName", "yourUsername", "yourPassword");

        // 이미 '좋아요'를 눌렀는지 확인
        String checkQuery = "SELECT * FROM Likes WHERE postId = ? AND userId = ?";
        pstmt = conn.prepareStatement(checkQuery);
        pstmt.setString(1, postId);
        pstmt.setString(2, userId);
        rs = pstmt.executeQuery();

        if (!rs.next()) {

            String insertQuery = "INSERT INTO Likes (postId, userId) VALUES (?, ?)";
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, postId);
            pstmt.setString(2, userId);
            pstmt.executeUpdate();


            String updateQuery = "UPDATE Posts SET likes = likes + 1 WHERE id = ?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, postId);
            pstmt.executeUpdate();
        }


        response.sendRedirect("postDetails.jsp?postId=" + postId);

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>