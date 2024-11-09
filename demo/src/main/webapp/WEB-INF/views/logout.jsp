<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    session.invalidate(); // Invalidate the session
    response.sendRedirect("/login"); // Redirect to login page
%>
