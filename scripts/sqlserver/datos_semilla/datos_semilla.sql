USE proyecto_integrador;
GO


INSERT INTO Sedes (nombre_sede, direccion, telefono, ciudad) VALUES
('Sede Norte - Centro Médico', 'Calle 100 # 15-20', '6011234567', 'Bogotá'),
('Sede Sur - Policlínico', 'Carrera 68 # 45-10', '6019876543', 'Bogotá');
GO


INSERT INTO Paciente (tipo_documento, numero_documento, nombres, apellidos, fecha_nacimiento, correo, telefono) VALUES
('CC', '1000111222', 'Carlos Alberto', 'Gómez Pérez', '1995-05-12', 'carlos.gomez@email.com', '3101234567'),
('CC', '1000333444', 'María Alejandra', 'Rodríguez Torres', '1988-10-22', 'maria.rodriguez@email.com', '3209876543'),
('TI', '1000555666', 'Juan Sebastián', 'López Ruiz', '2010-03-15', NULL, '3114445566');
GO


INSERT INTO Profesional (tipo_documento, numero_documento, registro_profesional, correo_profesional, nombres, apellidos, telefono) VALUES
('CC', '80111222', 'RM-2023-001', 'dr.perez@salud.com', 'Andrés Felipe', 'Pérez Martí', '3157778899'),
('CC', '80333444', 'RM-2023-002', 'dra.torres@salud.com', 'Luisa Fernanda', 'Torres Mora', '3166665544');
GO

INSERT INTO Especialidades (nombre_especialidad, descripcion) VALUES
('Medicina General', 'Atención primaria y diagnóstico básico.'),
('Pediatría', 'Atención integral de la salud infantil.');
GO


INSERT INTO Profesional_Especialidad (id_profesional, id_especialidad) VALUES
(1, 1), 
(2, 2);
GO


INSERT INTO Servicio (nombre_servicio, descripcion, tarifa_base) VALUES
('Consulta Medica General', 'Evaluación clínica primaria', 50000.00),
('Consulta Pediatrica', 'Evaluación especializada infantil', 70000.00),
('Curación de Herida', 'Procedimiento menor ambulatorio', 30000.00);
GO


INSERT INTO Cita (id_paciente, id_sede, id_profesional, id_especialidad, fecha_hora_cita, duracion_minutos, estado) VALUES
(1, 1, 1, 1, '2026-06-01 08:00:00', 30, 'Confirmada'),
(2, 2, 2, 2, '2026-06-01 09:00:00', 30, 'Confirmada'),
(3, 1, 1, 1, '2026-06-02 10:00:00', 30, 'Programada');
GO


INSERT INTO Atenciones (id_cita, fecha_hora_atencion, observaciones_administrativas) VALUES
(1, '2026-06-01 08:05:00', 'Paciente atendido sin novedades.'),
(2, '2026-06-01 09:10:00', 'Atención pediátrica exitosa.');
GO


INSERT INTO Servicios_Prestados(id_atencion, id_servicio, cantidad, tarifa_aplicada) VALUES
(1, 1, 1, 50000.00),
(1, 3, 2, 30000.00),
(2, 2, 1, 70000.00);
GO