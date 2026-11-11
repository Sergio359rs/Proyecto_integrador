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
| PACIENTE | fecha de nacimiento | DATE| NOT NULL | fecha de nacimiento del paciente |
| PACIENTE | correo | VARCHAR(100)| NOT NULL, UNIQUE | correo electronico del paciente|
| PACIENTE | telefono | VARCHAT (20)| NOT NULL | telefono del paciente |
| PROFESIONAL | id_profesional | INT| PK, NOT NULL, IDENTITY(1,1) | Identificador único |
| PROFESIONAL | experimento_id | INT| FK | ID usa |
| PROFESIONAL | dataset_id | INT| FK | ID proyecto |
| PROFESIONAL | id_participa|INT| PK | ID participa |
| PROFESIONAL |fecha_inicio|DATETIME|  | ID participa |
| PROFESIONAL |fecha_fin|DATETIME|  | ID participa |
| PROFESIONAL |cientifico_datos_id|INT| FK | ID participa |
| PROFESIONAL |proyectos_id|INT| FK | ID participa |
| ESPECIALIDADES |cientifico de dato id|INT| PK, NOT NULL, IDENTITY(1,1) | ID cientifico de dato |
| ESPECIALIDADES |nombre|VARCHAR (60)|  | ID cientifico de dato |
| ESPECIALIDADES |email|VARCHAR (45)| | ID cientifico de dato |
| PROFESIONAL_ESPECIALIDAD |documento de identidad|VARCHAR (30)|PK, NOT NULL, IDENTITY(1,1) | ID cientifico de dato |
| PROFESIONAL_ESPECIALIDAD |area encargada|VARCHAR (30)| | ID cientifico de dato |
| PROFESIONAL_ESPECIALIDAD |numero de telefono|VARCHAR (45)| | ID cientifico de dato |
| SERVICIO |apellido|VARCHAR (45)|PK, NOT NULL, IDENTITY(1,1) | ID cientifico de dato |
| SERVICIO |id modelo|INT|PK| ID modelo |
| SERVICIO |experimentos_id|INT|FK| ID modelo |
| SERVICIO |tipo de modelo|VARCHAR (45)|| ID modelo |
| CITA    |nombre del modelo|VARCHAR (45)|PK, NOT NULL, IDENTITY(1,1)| ID modelo |
| CITA    |codigo de modelo|VARCHAR (45)|| ID modelo |
| CITA    |id metrica|INT|PK| ID metrica |
| CITA    |informacion|VARCHAR (100)|| ID metrica |
| CITA    |modelos_id|INT|FK| ID metrica |
| CITA    |modelos_id|INT|FK| ID metrica |
| CITA    |modelos_id|INT|FK| ID metrica |
| CITA    |modelos_id|INT|FK| ID metrica |
| ATENCIONES |modelos_id|INT|PK, NOT NULL, IDENTITY(1,1)| ID metrica |
| ATENCIONES |modelos_id|INT|FK| ID metrica |
| ATENCIONES |modelos_id|INT|FK| ID metrica |
| ATENCIONES |modelos_id|INT|FK| ID metrica |
| SERVICIOS_PRESTADOS|modelos_id|INT|PK, NOT NULL, IDENTITY(1,1)| ID metrica |
| SERVICIOS_PRESTADOS|modelos_id|INT|FK| ID metrica |
| SERVICIOS_PRESTADOS|modelos_id|INT|FK| ID metrica |
| SERVICIOS_PRESTADOS|modelos_id|INT|FK| ID metrica |
| SERVICIOS_PRESTADOS|modelos_id|INT|FK| ID metrica |