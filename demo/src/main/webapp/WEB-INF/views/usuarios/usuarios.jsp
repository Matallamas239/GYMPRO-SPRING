<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios</title>

      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/miembro.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
<div class="contenedor-principal">

    <header class="encabezado">
        <i class="icono fas fa-users"></i>
        <h1>Gestión de Usuario</h1>
        <p>Administra los usuarios del gimnasio</p>
    </header>

    <!-- FORMULARIO -->
    <section class="seccion-formulario">

        <div class="encabezado-seccion">
            <i class="icono fas fa-plus-circle"></i>
            <h2>
                <c:choose>
                    <c:when test="${usuario.id != null}">
                        Editar Miembro
                    </c:when>
                    <c:otherwise>
                        Registrar Nuevo Miembro
                    </c:otherwise>
                </c:choose>
            </h2>
        </div>

        <form action="${pageContext.request.contextPath}/usuarios/${empty usuario.id ? 'save' : 'update'}"
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

                <div class="grupo-formulario">
                    <label>Rol</label>
                    <select name="rol" required>
                        <option value="cliente"   ${usuario.rol == 'cliente' ? 'selected' : ''}>Cliente</option>
                        <option value="empleado"  ${usuario.rol == 'empleado' ? 'selected' : ''}>Empleado</option>
                        <option value="admin"     ${usuario.rol == 'admin' ? 'selected' : ''}>Administrador</option>
                    </select>
                </div>

            </div>

            <button class="boton-principal" type="submit">
                <i class="icono fas fa-plus"></i>
                <c:choose>
                    <c:when test="${usuario.id != null}">
                        Guardar Cambios
                    </c:when>
                    <c:otherwise>
                        Registrar Miembro
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
                <h2>Lista de Miembros</h2>
            </div>

            <div class="caja-busqueda">
                <input type="text" placeholder="Buscar miembro...">
                <i class="icono fas fa-search"></i>
            </div>
        </div>

        <div class="filtro-simple">
            <label>Filtrar por rol:</label>
            <select id="filtroRol" onchange="filtrarPorRol()">
                <option value="todos">Todos</option>
                <option value="cliente">Cliente</option>
                <option value="empleado">Empleado</option>
                <option value="admin">Administrador</option>
            </select>
        </div>

        <table class="tabla-miembros">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>DNI</th>
                <th>Rol</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="u" items="${usuarios}">
                <tr>
                    <td>#${u.id}</td>
                    <td>${u.nombreCompleto}</td>
                    <td>${u.dni}</td>
                    <td>${u.rol}</td>

                    <td>
                        <span class="etiqueta ${u.activo ? 'etiqueta-activo' : 'etiqueta-inactivo'}">
                            ${u.activo ? 'ACTIVO' : 'INACTIVO'}
                        </span>
                    </td>

                    <td class="acciones">

                        <a href="${pageContext.request.contextPath}/usuarios/edit/${u.id}"
                           class="boton-accion boton-editar">
                            <i class="icono fas fa-edit"></i> Editar
                        </a>

                        <a href="${pageContext.request.contextPath}/usuarios/toggle/${u.id}"
                           class="boton-accion boton-eliminar">
                            <i class="icono fas fa-sync"></i>
                            ${u.activo ? 'Desactivar' : 'Activar'}
                        </a>

                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>

    </section>

</div>
</body>

<script>
function filtrarPorRol() {
    const filtro = document.getElementById("filtroRol").value.toLowerCase();
    const filas = document.querySelectorAll(".tabla-miembros tbody tr");

    filas.forEach(fila => {
        const rol = fila.querySelector("td:nth-child(4)").textContent.toLowerCase();

        if (filtro === "todos" || rol.includes(filtro)) {
            fila.style.display = "";
        } else {
            fila.style.display = "none";
        }
    });
}
</script>

</html>
