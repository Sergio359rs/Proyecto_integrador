USE proyecto_integrador

SELECT 
    p.id_paciente,
    p.tipo_documento,
    p.numero_documento,
    p.nombres + ' ' + p.apellidos AS paciente
FROM Paciente p
LEFT JOIN Cita c ON p.id_paciente = c.id_paciente
WHERE c.id_cita IS NULL;
GO