package com.example.demo.usuario;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
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

    private final RowMapper<Usuario> mapper = new RowMapper<Usuario>() {
        @Override
        public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {

            Timestamp c = rs.getTimestamp("created_at");
            Timestamp u = rs.getTimestamp("updated_at");

            return new Usuario(
                    rs.getInt("id"),
                    rs.getString("nombre_completo"),
                    rs.getString("numero_telefono"),
                    rs.getString("dni"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("rol"),
                    rs.getBoolean("activo"),
                    c != null ? c.toLocalDateTime() : null,
                    u != null ? u.toLocalDateTime() : null
            );
        }
    };

    @Override
    public List<Usuario> listarPorRol(String rol) {
        return jdbcTemplate.query(
                "SELECT * FROM usuarios WHERE rol = ?",
                mapper,
                rol
        );
    }

    @Override
    public Usuario buscarPorId(Integer id) {
        return jdbcTemplate.queryForObject(
                "SELECT * FROM usuarios WHERE id = ?",
                mapper,
                id
        );
    }

    @Override
    public void crear(Usuario u) {
        jdbcTemplate.update(
                "INSERT INTO usuarios (nombre_completo, numero_telefono, dni, email, password, rol, activo, created_at, updated_at) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)",
                u.getNombreCompleto(),
                u.getNumeroTelefono(),
                u.getDni(),
                u.getEmail(),
                u.getPassword(),
                u.getRol(),
                u.isActivo()
        );
    }

    @Override
    public void actualizar(Usuario u) {
        jdbcTemplate.update(
                "UPDATE usuarios SET nombre_completo=?, numero_telefono=?, dni=?, email=?, password=?, rol=?, updated_at=CURRENT_TIMESTAMP WHERE id=?",
                u.getNombreCompleto(),
                u.getNumeroTelefono(),
                u.getDni(),
                u.getEmail(),
                u.getPassword(),
                u.getRol(),
                u.getId()
        );
    }

    @Override
    public void cambiarEstado(Integer id, boolean activo) {
        jdbcTemplate.update(
                "UPDATE usuarios SET activo=?, updated_at=CURRENT_TIMESTAMP WHERE id=?",
                activo,
                id
        );
    }
}
