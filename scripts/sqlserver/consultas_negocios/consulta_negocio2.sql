USE proyecto_integrador

DECLARE @fecha1 DATE = '1980-01-01';
DECLARE @fecha2 DATE = '2000-12-31';

SELECT 
    id_paciente,
    tipo_documento,
    numero_documento,
    nombres,
    apellidos,
    fecha_nacimiento
FROM Paciente
WHERE fecha_nacimiento BETWEEN @fecha1 AND @fecha2;
GO