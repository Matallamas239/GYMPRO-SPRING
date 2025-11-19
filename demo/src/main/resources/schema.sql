CREATE TABLE IF NOT EXISTS estudiante (
    id INT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    apellido VARCHAR(200) NOT NULL,
    codigo VARCHAR(10) UNIQUE,
    fecha_nacimiento DATE NOT NULL
);

create table if not exists tipo_producto(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre varchar(200) not null,
    fechaCreacion date not null
);

CREATE TABLE IF NOT EXISTS producto (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    fecha_creacion DATE NOT NULL,
    id_tipo_producto INT NOT NULL,
    CONSTRAINT fk_tipo_producto FOREIGN KEY (id_tipo_producto)
    REFERENCES tipo_producto(id) ON DELETE SET NULL
);

---------------------------------------------------------
-- TABLA: USUARIOS
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_completo VARCHAR(200) NOT NULL,
    numero_telefono VARCHAR(20),
    DNI VARCHAR(8) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(200) NOT NULL,
    rol VARCHAR(20) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---------------------------------------------------------
-- TABLA: PLAN
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS plan (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion VARCHAR(500),
    precio FLOAT NOT NULL,
    duracion_dias INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---------------------------------------------------------
-- TABLA: SUSCRIPCION
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS suscripcion (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_plan INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    activo BOOLEAN DEFAULT TRUE,
    monto_pagado FLOAT NOT NULL,

    CONSTRAINT fk_suscripcion_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id) ON DELETE CASCADE,

    CONSTRAINT fk_suscripcion_plan FOREIGN KEY (id_plan)
        REFERENCES plan(id) ON DELETE CASCADE
);

---------------------------------------------------------
-- TABLA: ASISTENCIA
---------------------------------------------------------
CREATE TABLE IF NOT EXISTS asistencia (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha DATE NOT NULL,
    hora_ingreso TIMESTAMP,
    hora_salida TIMESTAMP,

    CONSTRAINT fk_asistencia_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id) ON DELETE CASCADE
);


