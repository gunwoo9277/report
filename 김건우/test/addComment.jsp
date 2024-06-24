<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
String postId = request.getParameter("post_id");
String comment = request.getParameter("comment");

String insertCommentSQL = "INSERT INTO comments (post_id, comment) VALUES (?, ?)";
try (PreparedStatement pstmt = conn.prepareStatement(insertCommentSQL)) {
    pstmt.setInt(1, Integer.parseInt(postId));
    pstmt.setString(2, comment);
    pstmt.executeUpdate();
} catch (SQLException e) {
    e.printStackTrace();
}

response.sendRedirect("postDetails.jsp?post_id=" + postId);
%>