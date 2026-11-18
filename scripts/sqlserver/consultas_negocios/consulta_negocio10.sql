USE proyecto_integrador

WITH AtencionesPorMes AS (
    SELECT 
        YEAR(a.fecha_hora_atencion) AS anio,
        MONTH(a.fecha_hora_atencion) AS mes,
        s.id_sede,
        s.nombre_sede,
        COUNT(a.id_atencion) AS total_atenciones,
        ROW_NUMBER() OVER (
            PARTITION BY YEAR(a.fecha_hora_atencion), MONTH(a.fecha_hora_atencion) 
            ORDER BY COUNT(a.id_atencion) DESC
        ) AS ranking
    FROM Sedes s
    INNER JOIN Cita c ON s.id_sede = c.id_sede
    INNER JOIN Atenciones a ON c.id_cita = a.id_cita
    GROUP BY YEAR(a.fecha_hora_atencion), MONTH(a.fecha_hora_atencion), s.id_sede, s.nombre_sede
)
SELECT 
    anio AS [Año],
    mes AS [Mes],
    nombre_sede AS [Sede Líder],
    total_atenciones AS [Atenciones Completadas]
FROM AtencionesPorMes
WHERE ranking = 1
ORDER BY anio, mes;
GO
