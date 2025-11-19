INSERT INTO  estudiante 
 (id, nombre, apellido, codigo, fecha_nacimiento) 
 VALUES (1, 'Roberto Geronimo','Zarate Mendoza','C28933', '1982-01-01');

INSERT INTO  estudiante 
 (id, nombre, apellido, codigo, fecha_nacimiento) 
 VALUES (2, 'Mercedes','Mendoza','C11111','1980-06-06');
INSERT INTO  estudiante 
 (id, nombre, apellido, codigo, fecha_nacimiento) 
 VALUES (3, 'Edgar','Mendoza','C22222','1952-02-19');  

INSERT INTO  tipo_producto
 ( nombre, fechaCreacion) 
 VALUES ('Detergentes en polvo','2025-02-02');

INSERT INTO  tipo_producto
 ( nombre, fechaCreacion) 
 VALUES ('Detergentes liquidos','2025-02-04');

INSERT INTO  tipo_producto  
 ( nombre, fechaCreacion) 
 VALUES ('Detergentes enzimaticos ','2025-02-06');

INSERT INTO  producto
( nombre, fecha_creacion, id_tipo_producto) 
 values ('Detergente en polvo Ariel','2025-02-02',1);

INSERT INTO  producto 
( nombre, fecha_creacion, id_tipo_producto) 
values ('Detergente en polvo Ace','2025-02-04',1);

INSERT INTO  producto 
( nombre, fecha_creacion, id_tipo_producto) 
 values ('Detergente en polvo Omo','2025-02-06',1);

INSERT INTO  producto
( nombre, fecha_creacion, id_tipo_producto) 
 values ('Detergente liquido Ariel','2025-02-02',2);

INSERT INTO  producto
( nombre, fecha_creacion, id_tipo_producto )
values ('Detergente liquido Ace','2025-02-04',2);

---------------------------------------------------------
-- INSERTAR USUARIOS
---------------------------------------------------------
INSERT INTO usuarios (nombre_completo, numero_telefono, DNI, email, password, rol, activo)
VALUES
('Juan Pérez', '987654321', '99987548', 'juan@example.com', '123456', 'empleado', TRUE),
('María López', '912345678', '48763159', 'maria@example.com', 'abcdef', 'cliente', TRUE),
('Carlos Díaz', '999888777', '47513468', 'carlos@example.com', 'qwerty', 'cliente', TRUE);

---------------------------------------------------------
-- INSERTAR PLANES
---------------------------------------------------------
INSERT INTO plan (nombre, descripcion, precio, duracion_dias, activo)
VALUES
('Plan Mensual', 'Acceso total por 30 días', 80.00, 30, TRUE),
('Plan Trimestral', 'Acceso total por 90 días', 200.00, 90, TRUE),
('Plan Anual', 'Acceso total por 365 días', 750.00, 365, TRUE);

---------------------------------------------------------
-- INSERTAR SUSCRIPCIONES
---------------------------------------------------------
INSERT INTO suscripcion (id_usuario, id_plan, fecha_inicio, fecha_fin, activo, monto_pagado)
VALUES
(1, 1, DATE '2024-01-01', DATE '2024-01-31', TRUE, 80.00),
(2, 2, DATE '2024-02-01', DATE '2024-05-01', TRUE, 200.00),
(3, 3, DATE '2024-01-15', DATE '2025-01-15', TRUE, 750.00);

---------------------------------------------------------
-- INSERTAR ASISTENCIAS
---------------------------------------------------------
INSERT INTO asistencia (id_usuario, fecha, hora_ingreso, hora_salida)
VALUES
(1, DATE '2024-01-05', TIMESTAMP '2024-01-05 08:00:00', TIMESTAMP '2024-01-05 10:00:00'),
(1, DATE '2024-01-06', TIMESTAMP '2024-01-06 09:15:00', TIMESTAMP '2024-01-06 11:00:00'),

(2, DATE '2024-02-10', TIMESTAMP '2024-02-10 07:50:00', TIMESTAMP '2024-02-10 09:30:00'),

(3, DATE '2024-03-01', TIMESTAMP '2024-03-01 18:00:00', TIMESTAMP '2024-03-01 20:00:00');
