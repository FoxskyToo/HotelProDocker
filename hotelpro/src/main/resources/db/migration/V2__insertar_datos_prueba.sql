INSERT INTO usuarios (username, password, rol, activo)
VALUES
    ('admin', '1234', 'ADMIN', TRUE),
    ('recepcion', '1234', 'RECEPCION', TRUE);

INSERT INTO clientes (nombre, correo, telefono)
VALUES
    ('Juan Perez', 'juan@test.com', '912345678'),
    ('Maria Gonzalez', 'maria@test.com', '923456789');

INSERT INTO habitaciones (numero, tipo, precio, disponible)
VALUES
    ('101', 'SIMPLE', 45000.00, TRUE),
    ('102', 'DOBLE', 65000.00, TRUE);

INSERT INTO servicios (nombre, descripcion, precio, activo)
VALUES
    ('Desayuno', 'Buffet de desayuno', 12000.00, TRUE),
    ('Lavanderia', 'Servicio de lavanderia', 8000.00, TRUE);

INSERT INTO empleados (nombre, cargo, correo, telefono, activo)
VALUES
    ('Luis Diaz', 'MANTENCION', 'luis@hotel.cl', '933333333', TRUE);

INSERT INTO reservas (
    cliente_id,
    habitacion_id,
    fecha_ingreso,
    fecha_salida,
    estado
)
VALUES
    (1, 1, '2026-07-10', '2026-07-15', 'ACTIVA');