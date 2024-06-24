<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 저장</title>
</head>
<body>
    <form action="savePost.jsp" method="post" enctype="multipart/form-data">
        <input type="text" name="title" placeholder="제목"><br>
        <input type="text" name="content" placeholder="내용"><br>
        <input type="file" name="file"><br>
        <button type="submit">저장</button>
    </form>

    <%
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Part filePart = request.getPart("file");

        if (filePart != null) {
            String fileName = filePart.getSubmittedFileName();
            String filePath = "uploads/" + fileName;
            try (InputStream fileContent = filePart.getInputStream()) {
                // 파일 저장 로직
                // 예: Files.copy(fileContent, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
                out.println("파일이 성공적으로 업로드되었습니다: " + fileName);
            } catch (Exception e) {
                out.println("파일 업로드 중 오류 발생: " + e.getMessage());
            }
        } else {
            out.println("파일이 업로드되지 않았습니다.");
        }
    %>
</body>
</html>