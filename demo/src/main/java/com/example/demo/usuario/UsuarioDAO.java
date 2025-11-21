package com.example.demo.usuario;

import java.util.List;

public interface UsuarioDAO {

    List<Usuario> listarPorRol(String rol);

    Usuario buscarPorId(Integer id);

    void crear(Usuario usuario);

    void actualizar(Usuario usuario);

    void cambiarEstado(Integer id, boolean activo);
}
