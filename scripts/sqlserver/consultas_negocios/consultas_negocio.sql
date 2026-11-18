USE proyecto_integrador;
GO

SELECT id_paciente, tipo_documento, numero_documento, nombres, apellidos, correo 
FROM Paciente;
GO


SELECT p.nombres, p.apellidos, e.nombre_especialidad
FROM Profesional p
JOIN Profesional_Especialidad pe ON p.id_profesional = pe.id_profesional
JOIN Especialidades e ON pe.id_especialidad = e.id_especialidad;
GO


SELECT s.nombre_sede, COUNT(c.id_cita) AS total_citas
FROM Sedes s
LEFT JOIN Cita c ON s.id_sede = c.id_sede
GROUP BY s.nombre_sede;
GO


SELECT SUM(da.cantidad * da.tarifa_aplicada) AS ingresos_totales
FROM Servicios_Prestados da;
GO


SELECT a.id_atencion, a.fecha_hora_atencion, p.nombres + ' ' + p.apellidos AS paciente, a.observaciones_administrativas
FROM Atenciones a
JOIN Cita c ON a.id_cita = c.id_cita
JOIN Paciente p ON c.id_paciente = p.id_paciente;
GO


SELECT s.nombre_servicio, SUM(da.cantidad) AS total_prestados
FROM Servicio s
JOIN Servicios_Prestados da ON s.id_servicio = da.id_servicio
GROUP BY s.nombre_servicio
ORDER BY total_prestados DESC;
GO


SELECT c.id_cita, c.fecha_hora_cita, c.estado, s.nombre_sede, p.nombres AS profesional
FROM Cita c
JOIN Paciente pac ON c.id_paciente = pac.id_paciente
JOIN Sedes s ON c.id_sede = s.id_sede
JOIN Profesional p ON c.id_profesional = p.id_profesional
WHERE pac.numero_documento = '1000111222';
GO


WITH PromedioCitasEspecialidad AS (
    SELECT id_especialidad, COUNT(id_cita) AS total_citas
    FROM Cita
    GROUP BY id_especialidad
)
SELECT e.nombre_especialidad, p.total_citas
FROM PromedioCitasEspecialidad p
JOIN Especialidades e ON p.id_especialidad = e.id_especialidad
WHERE p.total_citas > (SELECT AVG(CAST(total_citas AS FLOAT)) FROM PromedioCitasEspecialidad);
GO


WITH CitasConfirmadasProfesional AS (
    SELECT id_profesional, COUNT(id_cita) AS total_confirmadas
    FROM Cita
    WHERE estado = 'Confirmada'
    GROUP BY id_profesional
)
SELECT pr.nombres, pr.apellidos, c.total_confirmadas
FROM CitasConfirmadasProfesional c
JOIN Profesional pr ON c.id_profesional = pr.id_profesional
WHERE c.total_confirmadas > (SELECT AVG(CAST(total_confirmadas AS FLOAT)) FROM CitasConfirmadasProfesional);
GO

-- 10. [AVANZADA] Mostrar la sede con más atenciones completadas por mes (Uso de CTE y ROW_NUMBER)[cite: 5]
WITH AtencionesPorMesSede AS (
    SELECT 
        MONTH(a.fecha_hora_atencion) AS mes,
        s.nombre_sede,
        COUNT(a.id_atencion) AS total_atenciones,
        ROW_NUMBER() OVER (PARTITION BY MONTH(a.fecha_hora_atencion) ORDER BY COUNT(a.id_atencion) DESC) AS ranking
    FROM Atenciones a
    JOIN Cita c ON a.id_cita = c.id_cita
    JOIN Sedes s ON c.id_sede = s.id_sede
    GROUP BY MONTH(a.fecha_hora_atencion), s.nombre_sede
)
SELECT mes, nombre_sede, total_atenciones
FROM AtencionesPorMesSede
WHERE ranking = 1;
GO