USE proyecto_integrador

SELECT 
    pr.id_profesional,
    pr.nombres + ' ' + pr.apellidos AS profesional,
    COUNT(c.id_cita) AS citas_confirmadas
FROM Profesional pr
INNER JOIN Cita c ON pr.id_profesional = c.id_profesional
WHERE c.estado = 'Confirmada'
GROUP BY pr.id_profesional, pr.nombres, pr.apellidos
HAVING COUNT(c.id_cita) > (
    SELECT AVG(CAST(conteo AS FLOAT))
    FROM (
        SELECT COUNT(id_cita) AS conteo
        FROM Cita
        WHERE estado = 'Confirmada'
        GROUP BY id_profesional
    ) AS subconsulta_confirmadas
);
GO