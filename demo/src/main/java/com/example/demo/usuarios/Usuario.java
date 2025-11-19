package com.example.demo.usuarios;

import java.sql.Timestamp;

public class Usuario {

    private Integer id;
    private String nombreCompleto;
    private String numeroTelefono;
    private String dni;
    private String email;
    private String password;
    private String rol;
    private boolean activo;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Usuario() {
        // opcional: por defecto activo = true
        this.activo = true;
    }

    public Usuario(Integer id, String nombreCompleto, String numeroTelefono, String dni,
                   String email, String password, String rol, boolean activo,
                   Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.nombreCompleto = nombreCompleto;
        this.numeroTelefono = numeroTelefono;
        this.dni = dni;
        this.email = email;
        this.password = password;
        this.rol = rol;
        this.activo = activo;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // ------ GETTERS & SETTERS ------

    public Integer getId() {     // 👈 ahora Integer, no int
        return id;
    }

    public void setId(Integer id) {  // 👈 también Integer aquí
        this.id = id;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getNumeroTelefono() {
        return numeroTelefono;
    }

    public void setNumeroTelefono(String numeroTelefono) {
        this.numeroTelefono = numeroTelefono;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}
