
use('proyecto_integrador_nosql');


db.historial_atenciones.insertMany([
  {
    id_cita: 1,
    fecha_cita: "2026-06-01T08:00:00Z",
    sede: {
      nombre: "Sede Norte - Centro Médico",
      ciudad: "Bogotá"
    },
    paciente: {
      tipo_documento: "CC",
      numero_documento: "1000111222",
      nombres: "Carlos Alberto Gómez Pérez"
    },
    profesional: {
      registro_profesional: "RM-2023-001",
      nombre_completo: "Andrés Felipe Pérez Martí",
      especialidad: "Medicina General"
    },
    atencion: {
      fecha_hora_atencion: "2026-06-01T08:05:00Z",
      observaciones: "Paciente atendido sin novedades en consulta primaria.",
      servicios_prestados: [
        { nombre_servicio: "Consulta Medica General", cantidad: 1, tarifa: 50000.00 },
        { nombre_servicio: "Curación de Herida", cantidad: 2, tarifa: 30000.00 }
      ],
      costo_total: 110000.00
    },
    estado_final: "Completada"
  },
  {
    id_cita: 2,
    fecha_cita: "2026-06-01T09:00:00Z",
    sede: {
      nombre: "Sede Sur - Policlínico",
      ciudad: "Bogotá"
    },
    paciente: {
      tipo_documento: "CC",
      numero_documento: "1000333444",
      nombres: "María Alejandra Rodríguez Torres"
    },
    profesional: {
      registro_profesional: "RM-2023-002",
      nombre_completo: "Luisa Fernanda Torres Mora",
      especialidad: "Pediatría"
    },
    atencion: {
      fecha_hora_atencion: "2026-06-01T09:10:00Z",
      observaciones: "Atención pediátrica exitosa, control de crecimiento.",
      servicios_prestados: [
        { nombre_servicio: "Consulta Pediatrica", cantidad: 1, tarifa: 70000.00 }
      ],
      costo_total: 70000.00
    },
    estado_final: "Completada"
  }
]);