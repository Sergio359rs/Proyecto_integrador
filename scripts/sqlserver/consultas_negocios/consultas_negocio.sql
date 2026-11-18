USE proyecto_integrador
SELECT 
    c.id_cita,
    c.fecha_hora_cita,
    p.nombres + ' ' + p.apellidos AS paciente,
    pr.nombres + ' ' + pr.apellidos AS profesional,
    s.nombre_sede AS sede,
    c.estado
FROM Cita c
INNER JOIN Paciente p ON c.id_paciente = p.id_paciente
INNER JOIN Profesional pr ON c.id_profesional = pr.id_profesional
INNER JOIN Sedes s ON c.id_sede = s.id_sede
WHERE CAST(c.fecha_hora_cita AS DATE) = @fecha;
GO