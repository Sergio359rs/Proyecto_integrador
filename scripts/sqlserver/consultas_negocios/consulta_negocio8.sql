USE proyecto_integrador

SELECT 
    e.id_especialidad,
    e.nombre_especialidad,
    COUNT(c.id_cita) AS total_citas
FROM Especialidades e
INNER JOIN Profesional_Especialidad pe ON e.id_especialidad = pe.id_especialidad
INNER JOIN Cita c ON pe.id_profesional = c.id_profesional
GROUP BY e.id_especialidad, e.nombre_especialidad
HAVING COUNT(c.id_cita) > (
    SELECT AVG(CAST(conteo AS FLOAT))
    FROM (
        SELECT COUNT(c2.id_cita) AS conteo
        FROM Especialidades e2
        INNER JOIN Profesional_Especialidad pe2 ON e2.id_especialidad = pe2.id_especialidad
        INNER JOIN Cita c2 ON pe2.id_profesional = c2.id_profesional
        GROUP BY e2.id_especialidad
    ) AS subconsulta_promedios