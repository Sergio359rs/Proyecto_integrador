| Entidad | Atributo | Tipo | Restricciones | Descripción |
|---------|----------|------|---------------|-------------|
| SEDES   | id_sede  | INT  | PK, NOT NULL, IDENTITY(1,1)| Identificador único |
| SEDES   | nombre_sede  | VARCHAR(100) |  NOT NULL | Nombre del centro médico o sede |
| SEDES   | direccion | VARCHAR(150) | NOT NULL | Dirección física de la sede |
| SEDES   | telefono | VARCHAR(20) |NOT NULL  | Teléfono de contacto de la sede |
| SEDES   | ciudad | VARCHAR (50) | NOT NULL | Ciudad donde se encuentra la sede |
| PACIENTE | id_paciente| INT | PK, NOT NULL, IDENTITY(1,1)| Identificador único |
| PACIENTE | tipo_documento |VARCHAR(10)|NOT NULL, CHECK (tipo_documento IN ('CC', 'TI', 'CE', 'PA'))| Tipo de documento |
| PACIENTE | numero_documento| VARCHAR(20) | NOT NULL, UNIQUE | Número de documento del paciente |
| PACIENTE | nombres | VARCHAR (50)| NOT NULL | Nombres del paciente |
| PACIENTE | apellidos | VARCHAR (50)| NOT NULL | Apellidos del paciente |
| PACIENTE | fecha de nacimiento | DATE| NOT NULL | Fecha de nacimiento del paciente |
| PACIENTE | correo | VARCHAR(100)| NOT NULL, UNIQUE | Correo electronico del paciente|
| PACIENTE | telefono | VARCHAT (20)| NOT NULL | Telefono del paciente |
| PROFESIONAL | id_profesional | INT| PK, NOT NULL, IDENTITY(1,1) | Identificador único |
| PROFESIONAL | tipo_documento | VARCHAR(10)| NOT NULL, CHECK (tipo_documento IN ('CC', 'CE', 'PA')) | Tipo de documento de identidad |
| PROFESIONAL | numero_documento | VARCHAR(20)| NOT NULL, UNIQUE | Numero de documento de identidad del profesional |
| PROFESIONAL | registro_profesional|VARCHAR(50)| NOT NULL, UNIQUE| Registro o tarjeta profesional médica |
| PROFESIONAL |correo_profesional|VARCHAR(100)| NOT NULL, UNIQUE|Correo electrónico corporativo|
| PROFESIONAL |nombres|VARCHAR(50)| NOT NULL | Nombres del profesional |
| PROFESIONAL |apellidos|VARCHAR(50)| NOT NULL| Apellidos del profesional |
| PROFESIONAL |telefono|VARCHAR(20)| NULL | Número de teléfono de contacto |
| ESPECIALIDADES |id_especialidad|INT| PK, NOT NULL, IDENTITY(1,1) | Identificador único|
| ESPECIALIDADES |nombre_especialidad|VARCHAR(100)| NOT NULL, UNIQUE | Nombre oficial de la especialidad médica|
| ESPECIALIDADES |descripcion|VARCHAR(255)| NULL | Breve descripción del área de la especialidad |
| PROFESIONAL_ESPECIALIDAD |id_profesional|INT|NOT NULL,	PK, FK (Profesional.id_profesional) | Identificador del profesional |
| PROFESIONAL_ESPECIALIDAD |id_especialidad|INT|NOT NULL	PK, FK (Especialidad.id_especialidad) |Identificador de la especialidad asociada |
| SERVICIO |id_servicio|INT)|PK, NOT NULL, IDENTITY(1,1) | Identificador único|
| SERVICIO |nombre_servicio|VARCHAR(100)|NOT NULL| Nombre comercial/médico del servicio |
| SERVICIO |descripcion|VARCHAR(255)|NULL| Detalles o alcance del servicio |
| SERVICIO |tarifa_base|DECIMAL(12,2)|NOT NULL, CHECK (tarifa_base >= 0)| Tarifa o costo base de referencia |
| CITA    |id_cita|INT|PK, NOT NULL, IDENTITY(1,1)| Identificador único |
| CITA    |id_paciente |INT)|NOT NULL, FK| Referencia al paciente que solicita la cita |
| CITA    |id_sede|INT|NOT NULL, FK| Sede donde se realizará la cita |
| CITA    |id_profesional|INT|NOT NULL, FK| Profesional asignado para la atención |
| CITA    |id_especialidad|INT|NOT NULL, FK| Especialidad médica requerida |
| CITA    |fecha_hora_cita|DATETIME|NOT NULL| Fecha y hora de programación de la cita|
| CITA    |duracion_minutos|INT|NOT NULL	CHECK (duracion_minutos > 0)| Duración esperada en minutos |
| CITA    |estado|VARCHAR(30)|NOT NULL, DEFAULT 'PROGRAMADA', CHECK (estado IN ('PROGRAMADA', 'CONFIRMADA', 'CANCELADA', 'COMPLETADA'))| Estado administrativo de la cita |
| ATENCIONES |id_atencion|INT|PK, NOT NULL, IDENTITY(1,1)| Identificador único |
| ATENCIONES |id_cita|INT|NOT NULL, FK , UNIQUE| Cita confirmada/completada que genera la atención |
| ATENCIONES |fecha_hora_atencion|DATETIME|NOT NULL| Fecha y hora real en la que se efectuó la atención |
| ATENCIONES |observaciones_administrativas|VARCHAR(500)|NULL| Notas de la atención (excluye historias clínicas o datos sensibles). |
| SERVICIOS_PRESTADOS|id_detalle|INT|PK, NOT NULL, IDENTITY(1,1)| Identificador unico |
| SERVICIOS_PRESTADOS|id_atencion|INT|NOT NULL, FK| Atención médica a la que pertenece el detalle |
| SERVICIOS_PRESTADOS|id_servicio|INT|NOT NULL, FK| Servicio médico o procedimiento prestado |
| SERVICIOS_PRESTADOS|cantidad|INT|NOT NULL	CHECK (cantidad > 0)| Cantidad de unidades prestadas del servicio |
| SERVICIOS_PRESTADOS|tarifa_aplicada|DECIMAL(12,2)|NOT NULL	CHECK (tarifa_aplicada >= 0)| Tarifa o costo cobrado por unidad al momento del servicio |
