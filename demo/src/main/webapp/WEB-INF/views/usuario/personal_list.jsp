<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Personal</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/miembro.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<jsp:include page="/WEB-INF/views/barra-lateral.jsp" />

<div class="contenido-principal">
<div class="contenedor-principal">

    <!-- ENCABEZADO -->
    <header class="encabezado">
        <i class="icono fas fa-user-tie"></i>
        <h1>Gestión de Personal</h1>
        <p>Administra los trabajadores del gimnasio</p>
    </header>

    <!-- FORMULARIO -->
    <section class="seccion-formulario">

        <div class="encabezado-seccion">
            <i class="icono fas fa-plus-circle"></i>
            <h2>
                <c:choose>
                    <c:when test="${usuario.id != null}">
                        Editar Personal
                    </c:when>
                    <c:otherwise>
                        Registrar Nuevo Personal
                    </c:otherwise>
                </c:choose>
            </h2>
        </div>

        <form action="${pageContext.request.contextPath}/usuario/personal/${empty usuario.id ? 'guardar' : 'actualizar'}"
              method="post">

            <input type="hidden" name="id" value="${usuario.id}">

            <div class="grupo-formulario-grid">

                <div class="grupo-formulario">
                    <label>Nombre Completo</label>
                    <input type="text" name="nombreCompleto" value="${usuario.nombreCompleto}" required>
                </div>

                <div class="grupo-formulario">
                    <label>DNI</label>
                    <input type="text" name="dni" value="${usuario.dni}" required>
                </div>

                <div class="grupo-formulario">
                    <label>Email</label>
                    <input type="email" name="email" value="${usuario.email}" required>
                </div>

                <div class="grupo-formulario">
                    <label>Teléfono</label>
                    <input type="text" name="numeroTelefono" value="${usuario.numeroTelefono}">
                </div>

                <div class="grupo-formulario">
                    <label>Password</label>
                    <input type="password" name="password" value="${usuario.password}" required>
                </div>

            </div>

            <button class="boton-principal" type="submit">
                <i class="icono fas fa-save"></i>
                <c:choose>
                    <c:when test="${usuario.id != null}">
                        Guardar Cambios
                    </c:when>
                    <c:otherwise>
                        Registrar Personal
                    </c:otherwise>
                </c:choose>
            </button>

        </form>

    </section>

    <!-- TABLA -->
    <section class="seccion-tabla">

        <div class="encabezado-seccion-tabla">
            <div class="izquierda-encabezado">
                <i class="icono fas fa-list-ul"></i>
                <h2>Lista de Personal</h2>
            </div>
        </div>

        <table class="tabla-miembros">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>DNI</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="u" items="${personal}">
                <tr>
                    <td>#${u.id}</td>
                    <td>${u.nombreCompleto}</td>
                    <td>${u.dni}</td>

                    <td>
                        <span class="etiqueta ${u.activo ? 'etiqueta-activo' : 'etiqueta-inactivo'}">
                            ${u.activo ? 'ACTIVO' : 'INACTIVO'}
                        </span>
                    </td>

                    <td class="acciones">

                        <a href="${pageContext.request.contextPath}/usuario/personal/editar/${u.id}"
                           class="boton-accion boton-editar">
                            <i class="icono fas fa-edit"></i> Editar
                        </a>

                        <form action="${pageContext.request.contextPath}/usuario/personal/cambiar-estado"
                              method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${u.id}">
                            <input type="hidden" name="activo" value="${!u.activo}">
                            <button type="submit" class="boton-accion boton-eliminar">
                                <i class="icono fas fa-sync"></i>
                                ${u.activo ? 'Desactivar' : 'Activar'}
                            </button>
                        </form>

                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>

    </section>

</div>
</div>
</body>
</html>
