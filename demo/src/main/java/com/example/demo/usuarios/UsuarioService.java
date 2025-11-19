package com.example.demo.usuarios;

import java.util.List;

public interface UsuarioService {

    List<Usuario> listarUsuarios();

    Usuario obtenerUsuarioPorId(Integer id);

    int crearUsuario(Usuario usuario);

    int actualizarUsuario(Usuario usuario);

    int cambiarEstado(Integer id, boolean activo);
}
