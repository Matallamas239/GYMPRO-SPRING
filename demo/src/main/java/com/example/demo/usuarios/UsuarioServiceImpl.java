package com.example.demo.usuarios;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioDAO usuarioDAO;

    public UsuarioServiceImpl(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    @Override
    public List<Usuario> listarUsuarios() {
        return usuarioDAO.listarUsuarios();
    }

    @Override
    public Usuario obtenerUsuarioPorId(Integer id) {
        return usuarioDAO.obtenerUsuarioPorId(id);
    }

    @Override
    public int crearUsuario(Usuario usuario) {
        return usuarioDAO.crearUsuario(usuario);
    }

    @Override
    public int actualizarUsuario(Usuario usuario) {
        return usuarioDAO.actualizarUsuario(usuario);
    }

    @Override
    public int cambiarEstado(Integer id, boolean activo) {
        return usuarioDAO.cambiarEstado(id, activo);
    }
}
