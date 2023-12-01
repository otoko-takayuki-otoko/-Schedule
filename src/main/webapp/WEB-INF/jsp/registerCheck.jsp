<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.RegisterBean" %>
<%
RegisterBean event = (RegisterBean) session.getAttribute("event");
RegisterBean EventList = (RegisterBean) session.getAttribute("EventList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>確認</title>
</head>
<body>
<p>タイトル<%=event.getTitle() %></p>
<p>スタート<%=event.getStart() %></p>
<p>エンド<%=event.getEnd() %></p>
<p>日にち<%=event.getAllDay() %></p>
<p>object<%=EventList %>
</body>
</html>