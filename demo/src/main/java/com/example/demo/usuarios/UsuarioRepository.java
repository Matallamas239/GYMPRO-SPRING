package com.example.demo.usuarios;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioRepository implements UsuarioDAO {

    private final JdbcTemplate jdbcTemplate;

    public UsuarioRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // MAPPER COMPLETO (CON ROL)
    private final RowMapper<Usuario> usuarioRowMapper = (rs, rowNum) -> {
        return new Usuario(
                rs.getInt("id"),                    // int -> autobox a Integer
                rs.getString("nombre_completo"),
                rs.getString("numero_telefono"),
                rs.getString("dni"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("rol"),
                rs.getBoolean("activo"),
                rs.getTimestamp("created_at"),
                rs.getTimestamp("updated_at")
        );
    };

    @Override
    public List<Usuario> listarUsuarios() {
        String sql = "SELECT * FROM usuarios ORDER BY id DESC";
        return jdbcTemplate.query(sql, usuarioRowMapper);
    }

    @Override
    public Usuario obtenerUsuarioPorId(Integer id) {
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, usuarioRowMapper, id);
    }

    @Override
    public int crearUsuario(Usuario usuario) {
        String sql =
                """
                INSERT INTO usuarios (nombre_completo, numero_telefono, dni, email, password, rol)
                VALUES (?, ?, ?, ?, ?, ?)
                """;

        return jdbcTemplate.update(sql,
                usuario.getNombreCompleto(),
                usuario.getNumeroTelefono(),
                usuario.getDni(),
                usuario.getEmail(),
                usuario.getPassword(),
                usuario.getRol()
        );
    }

    @Override
    public int actualizarUsuario(Usuario usuario) {
        String sql =
                """
                UPDATE usuarios SET
                    nombre_completo = ?,
                    numero_telefono = ?,
                    dni = ?,
                    email = ?,
                    password = ?,
                    rol = ?,
                    updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
                """;

        return jdbcTemplate.update(sql,
                usuario.getNombreCompleto(),
                usuario.getNumeroTelefono(),
                usuario.getDni(),
                usuario.getEmail(),
                usuario.getPassword(),
                usuario.getRol(),
                usuario.getId()
        );
    }

    @Override
    public int cambiarEstado(Integer id, boolean activo) {
        String sql =
                """
                UPDATE usuarios SET
                    activo = ?,
                    updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
                """;
        return jdbcTemplate.update(sql, activo, id);
    }

}
