CREATE TABLE IF NOT EXISTS usuarios (
                                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                        username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
    );

CREATE TABLE IF NOT EXISTS auth_tokens (
                                           id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                           token VARCHAR(255) NOT NULL UNIQUE,
    usuario_id BIGINT,
    fecha_creacion DATETIME,
    CONSTRAINT fk_token_usuario
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    );

CREATE TABLE IF NOT EXISTS clientes (
                                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                        nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(30)
    );

CREATE TABLE IF NOT EXISTS habitaciones (
                                            id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                            numero VARCHAR(20) NOT NULL UNIQUE,
    tipo VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
    );

CREATE TABLE IF NOT EXISTS reservas (
                                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                        cliente_id BIGINT NOT NULL,
                                        habitacion_id BIGINT NOT NULL,
                                        fecha_ingreso DATE NOT NULL,
                                        fecha_salida DATE NOT NULL,
                                        estado VARCHAR(30) NOT NULL,
    CONSTRAINT fk_reserva_cliente
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    CONSTRAINT fk_reserva_habitacion
    FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id)
    );

CREATE TABLE IF NOT EXISTS servicios (
                                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                         nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
    );

CREATE TABLE IF NOT EXISTS pagos (
                                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     reserva_id BIGINT NOT NULL,
                                     monto DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    fecha_pago DATE,
    CONSTRAINT fk_pago_reserva
    FOREIGN KEY (reserva_id) REFERENCES reservas(id)
    );

CREATE TABLE IF NOT EXISTS consumos (
                                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                        reserva_id BIGINT NOT NULL,
                                        servicio_id BIGINT NOT NULL,
                                        cantidad INT NOT NULL,
                                        total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_consumo_reserva
    FOREIGN KEY (reserva_id) REFERENCES reservas(id),
    CONSTRAINT fk_consumo_servicio
    FOREIGN KEY (servicio_id) REFERENCES servicios(id)
    );

CREATE TABLE IF NOT EXISTS empleados (
                                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                         nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(80) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(30),
    activo BOOLEAN DEFAULT TRUE
    );

CREATE TABLE IF NOT EXISTS mantenimientos (
                                              id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                              habitacion_id BIGINT NOT NULL,
                                              empleado_id BIGINT NOT NULL,
                                              descripcion VARCHAR(255) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    fecha_mantenimiento DATE NOT NULL,
    CONSTRAINT fk_mantenimiento_habitacion
    FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id),
    CONSTRAINT fk_mantenimiento_empleado
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
    );