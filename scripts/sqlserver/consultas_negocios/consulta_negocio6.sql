USE proyecto_integrador

DECLARE @periodo_inicio DATE = '2026-06-01';
DECLARE @periodo_fin DATE = '2026-06-30';

SELECT 
    pr.id_profesional,
    pr.registro_profesional,
    pr.nombres + ' ' + pr.apellidos AS profesional
FROM Profesional pr
LEFT JOIN Cita c 
    ON pr.id_profesional = c.id_profesional 
    AND CAST(c.fecha_hora_cita AS DATE) BETWEEN @periodo_inicio AND @periodo_fin
WHERE c.id_cita IS NULL;
GO