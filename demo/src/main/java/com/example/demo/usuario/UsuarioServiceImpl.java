package com.example.demo.usuario;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioDAO usuarioDAO;

    public UsuarioServiceImpl(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    @Override
    public List<Usuario> listarMiembros() {
        return usuarioDAO.listarPorRol("cliente");
    }

    @Override
    public List<Usuario> listarPersonal() {
        return usuarioDAO.listarPorRol("personal");
    }

    @Override
    public Usuario buscarPorId(Integer id) {
        return usuarioDAO.buscarPorId(id);
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        usuarioDAO.crear(usuario);
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        usuarioDAO.actualizar(usuario);
    }

    @Override
    public void cambiarEstadoUsuario(Integer id, boolean activo) {
        usuarioDAO.cambiarEstado(id, activo);
    }

    @Override
    public void registrarCliente(Usuario usuario) {
        usuario.setRol("cliente");
        usuario.setActivo(true);
        usuarioDAO.crear(usuario);
    }
}
