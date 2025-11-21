-- Usuarios de prueba
INSERT INTO usuarios (nombre_completo, numero_telefono, dni, email, password, rol, activo)
VALUES
('Admin Principal', '987654321', '00000001', 'admin@gym.com', 'admin123', 'admin', TRUE),
('Carlos Pérez', '912345678', '12345678', 'carlos@gym.com', '12345', 'personal', TRUE),
('Ana Gómez', '987123456', '87654321', 'ana@gym.com', '12345', 'cliente', TRUE);

-- Planes
INSERT INTO plan (nombre, descripcion, precio, duracion_dias, activo)
VALUES
('Plan Básico', 'Acceso total por 30 días', 50.00, 30, TRUE),
('Plan Premium', 'Acceso total + clases + sauna', 80.00, 30, TRUE),
('Plan VIP', 'Todo incluido + entrenador personal', 120.00, 30, TRUE);

-- Suscripción de ejemplo para Ana (cliente id = 3)
INSERT INTO suscripcion (id_usuario, id_plan, fecha_inicio, fecha_fin, activa)
VALUES
(3, 1, '2025-01-15', '2025-02-15', TRUE);

-- Pago programado (no pagado todavía)
INSERT INTO suscripcion_pago (id_suscripcion, fecha_programada, estado, monto, metodo_pago)
VALUES
(1, '2025-02-15', 'pendiente', 50.00, NULL);

-- Asistencia del personal (Carlos id=2)
INSERT INTO asistencia (id_usuario, fecha, hora_ingreso, hora_salida)
VALUES
(2, '2025-01-20', '2025-01-20 08:01:00', '2025-01-20 16:10:00');
