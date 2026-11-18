USE proyecto_integrador

SELECT 
    pr.id_profesional,
    pr.registro_profesional,
    pr.nombres + ' ' + pr.apellidos AS profesional,
    e.nombre_especialidad AS especialidad
FROM Profesional pr
INNER JOIN Profesional_Especialidad pe ON pr.id_profesional = pe.id_profesional
INNER JOIN Especialidades e ON pe.id_especialidad = e.id_especialidad
ORDER BY profesional;
GO