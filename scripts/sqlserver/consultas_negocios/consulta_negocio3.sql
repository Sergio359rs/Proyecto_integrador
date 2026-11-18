USE proyecto_integrador

SELECT 
    s.id_sede,
    s.nombre_sede,
    c.estado,
    COUNT(*) AS total_citas
FROM Cita c
INNER JOIN Sedes s ON c.id_sede = s.id_sede
GROUP BY s.id_sede, s.nombre_sede, c.estado
ORDER BY s.nombre_sede, c.estado;
GO