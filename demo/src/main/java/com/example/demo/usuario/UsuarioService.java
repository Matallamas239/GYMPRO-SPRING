package com.example.demo.usuario;

import java.util.List;

public interface UsuarioService {

    List<Usuario> listarMiembros();

    List<Usuario> listarPersonal();

    Usuario buscarPorId(Integer id);

    void crearUsuario(Usuario usuario);

    void actualizarUsuario(Usuario usuario);

    void cambiarEstadoUsuario(Integer id, boolean activo);

    void registrarCliente(Usuario usuario);
}
