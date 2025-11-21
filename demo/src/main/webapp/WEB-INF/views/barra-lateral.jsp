<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String currentPath = request.getRequestURI();
    pageContext.setAttribute("currentPath", currentPath);
%>

<div class="barra-lateral">
    <div>
        <div class="logo">
            <i class="fa-solid fa-dumbbell"></i> GymPro
        </div>

        <div class="subtitulo">Sistema de gestión</div>

        <a href="${pageContext.request.contextPath}/plan/list"
           class="menu-item ${fn:contains(currentPath, '/plan/list') ? 'activo' : ''}">
            <i class="fas fa-box"></i>
            <span>Planes</span>
        </a>

        <a href="${pageContext.request.contextPath}/usuario/miembros/list"
           class="menu-item ${fn:contains(currentPath, '/usuario/miembros/list') ? 'activo' : ''}">
            <i class="fas fa-users"></i>
            <span>Miembros</span>
        </a>

        <a href="${pageContext.request.contextPath}/suscripcion/list"
           class="menu-item ${fn:contains(currentPath, '/suscripcion/list') ? 'activo' : ''}">
            <i class="fas fa-credit-card"></i>
            <span>Suscripciones</span>
        </a>

        <a href="${pageContext.request.contextPath}/asistencia"
           class="menu-item ${fn:contains(currentPath, '/asistencia') ? 'activo' : ''}">
            <i class="fas fa-calendar-check"></i>
            <span>Asistencia</span>
        </a>

        <a href="${pageContext.request.contextPath}/usuario/personal/list"
           class="menu-item ${fn:contains(currentPath, 'usuario/personal/list') ? 'activo' : ''}">
            <i class="fas fa-user-tie"></i>
            <span>Personal</span>
        </a>

        <a href="${pageContext.request.contextPath}/metricas"
           class="menu-item ${fn:contains(currentPath, '/metricas') ? 'activo' : ''}">
            <i class="fas fa-chart-line"></i>
            <span>Métricas</span>
        </a>
    </div>

    <div class="seccion-admin">
        <div class="avatar-admin">AD</div>
        <div class="nombre-admin">Administrador</div>
        <div class="correo-admin">admin@gympro.com</div>

        <a href="${pageContext.request.contextPath}/logout"
           class="menu-item"
           onclick="return confirm('¿Seguro que deseas cerrar sesión?');">
            <i class="fas fa-sign-out-alt"></i> Cerrar sesión
        </a>
    </div>
</div>
