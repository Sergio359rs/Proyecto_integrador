-- ==========================================================
-- SCRIPT DDL COMPLETO: Creación de la Base de Datos y Tablas
-- Proyecto Integrador: Caso 2 - Gestión de Servicios de Salud
-- ==========================================================

-- 1. Crear y usar la base de datos
CREATE DATABASE proyecto_integrador;
GO

USE proyecto_integrador;
GO

-- 2. Tabla Sede
CREATE TABLE Sedes (
    id_sede INT IDENTITY(1,1) PRIMARY KEY,
    nombre_sede VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);
GO

-- 3. Tabla Paciente
CREATE TABLE Paciente (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    tipo_documento VARCHAR(10) NOT NULL CHECK (tipo_documento IN ('CC', 'TI', 'CE', 'PA')),
    numero_documento VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    correo VARCHAR(100) NULL UNIQUE,
    telefono VARCHAR(20) NULL
);
GO

-- 4. Tabla Profesional
CREATE TABLE Profesional (
    id_profesional INT IDENTITY(1,1) PRIMARY KEY,
    tipo_documento VARCHAR(10) NOT NULL CHECK (tipo_documento IN ('CC', 'CE', 'PA')),
    numero_documento VARCHAR(20) NOT NULL UNIQUE,
    registro_profesional VARCHAR(50) NOT NULL UNIQUE,
    correo_profesional VARCHAR(100) NOT NULL UNIQUE,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NULL
);
GO

-- 5. Tabla Especialidad
CREATE TABLE Especialidades (
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255) NULL
);
GO

-- 6. Tabla Puente Profesional_Especialidad (Relación N:M)
CREATE TABLE Profesional_Especialidad (
    id_profesional INT NOT NULL,
    id_especialidad INT NOT NULL,
    PRIMARY KEY (id_profesional, id_especialidad),
    FOREIGN KEY (id_profesional) REFERENCES Profesional(id_profesional) ON DELETE CASCADE,
    FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad) ON DELETE CASCADE
);
GO

-- 7. Tabla Servicio
CREATE TABLE Servicio (
    id_servicio INT IDENTITY(1,1) PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NULL,
    tarifa_base DECIMAL(12,2) NOT NULL CHECK (tarifa_base >= 0)
);
GO

-- 8. Tabla Cita
CREATE TABLE Cita (
    id_cita INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_sede INT NOT NULL,
    id_profesional INT NOT NULL,
    id_especialidad INT NOT NULL,
    fecha_hora_cita DATETIME NOT NULL,
    duracion_minutos INT NOT NULL CHECK (duracion_minutos > 0),
    estado VARCHAR(30) NOT NULL DEFAULT 'PROGRAMADA' CHECK (estado IN ('PROGRAMADA', 'CONFIRMADA', 'CANCELADA', 'COMPLETADA')),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede),
    FOREIGN KEY (id_profesional) REFERENCES Profesional(id_profesional),
    FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad)
);
GO

-- 9. Tabla Atencion
CREATE TABLE Atenciones (
    id_atencion INT IDENTITY(1,1) PRIMARY KEY,
    id_cita INT NOT NULL UNIQUE,
    fecha_hora_atencion DATETIME NOT NULL,
    observaciones_administrativas VARCHAR(500) NULL,
    FOREIGN KEY (id_cita) REFERENCES Cita(id_cita)
);
GO

-- 10. Tabla Detalle_Atencion
CREATE TABLE Servicios_Prestados (
    id_detalle INT IDENTITY(1,1) PRIMARY KEY,
    id_atencion INT NOT NULL,
    id_servicio INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    tarifa_aplicada DECIMAL(12,2) NOT NULL CHECK (tarifa_aplicada >= 0),
    FOREIGN KEY (id_atencion) REFERENCES Atencion(id_atencion),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);
GO