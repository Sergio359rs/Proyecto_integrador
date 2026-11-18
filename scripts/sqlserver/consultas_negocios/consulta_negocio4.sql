USE proyecto_integrador

SELECT 
    id_atencion,
    SUM(cantidad * tarifa_aplicada) AS total_facturable
FROM Servicios_Prestados
GROUP BY id_atencion
ORDER BY id_atencion;
GO