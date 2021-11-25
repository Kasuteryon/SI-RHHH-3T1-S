#CREATE database INTA_RRHH
use INTA_RRHH;

CREATE TABLE PaisOrigen(
	codPais nvarchar(10) NOT NULL PRIMARY KEY,
	iso2 char(2) DEFAULT NULL,
    iso3 char(4) DEFAULT NULL,
	NombrePais NVARCHAR(20) NOT NULL
);

-- En este catalogo llevara catpais donde iran todos los departamentos del pais
CREATE TABLE CatCiudad(
	IdCiudad int NOT NULL PRIMARY KEY,
    NombreCiudad nvarchar(100) NOT NULL,
    -- foreign key
	CodPais nvarchar(10) NOT NULL,
    constraint Fk_PaisCat FOREIGN KEY(CodPais) REFERENCES PaisOrigen(codPais)
);

-- Tabla para el Estado Civil de la persona
CREATE TABLE EstadoCivil(
	IdEstadoCivil INT NOT NULL PRIMARY KEY auto_increment,
	Titulo NVARCHAR(25) NOT NULL,
    Abreviacion NVARCHAR(5) NOT NULL,
    Estado BIT NOT NULL
);

-- Tabla para los idiomas
CREATE TABLE Idiomas(
	CodIdioma NVARCHAR(5) NOT NULL PRIMARY KEY,
    NombreIdioma NVARCHAR(15) NOT NULL,
    Abreviacion NVARCHAR(5) NOT NULL,
    Estado BIT NOT NULL
);
-- Se crea tabla persona, que contiene todos los campos necesarios para las personas en 

CREATE TABLE Cat_RedesSociales(
	IdRedes INT NOT NULL PRIMARY KEY auto_increment,
	Nombre NVARCHAR(25) NOT NULL,
    Estado BIT NOT NULL
);

-- Categorias: Alergia, Enfermedades, Trastornos etc...
CREATE TABLE Cat_TipoPadecimiento(
	CodTipoPadecimiento NVARCHAR(8) NOT NULL PRIMARY KEY,
    NombreTipoPadecimiento NVARCHAR(50) NOT NULL
    -- Descripcion MEDIUMTEXT NOT NULL
);

CREATE TABLE Licencia(
	IdLicencia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CategoriaLicencia NVARCHAR(20) NOT NULL,
    Abreviacion NVARCHAR(5) NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Persona(
	IdPersona INT NOT NULL PRIMARY KEY auto_increment,
	DUI NVARCHAR(25) NOT NULL,
	Nombre1 NVARCHAR(25) NOT NULL,
    Nombre2 NVARCHAR(25) NOT NULL,
	Apellido1 NVARCHAR(25) NOT NULL,
    Apellido2 NVARCHAR(25) NOT NULL,
	FechaNac DATE NOT NULL,
    Genero BIT NOT NULL,
	NoDependientes INT NULL,
    Foto TEXT NULL,
	Estado BIT NOT NULL,
    
	codPais nvarchar(10) NOT NULL,
	IdEstadoCivil INT NOT NULL,
    IdLicencia INT NOT NULL,

	CONSTRAINT FK_PaisPersona FOREIGN KEY(codPais) REFERENCES PaisOrigen(codPais),
	CONSTRAINT FK_EstaCivilPers FOREIGN KEY(IdEstadoCivil) REFERENCES EstadoCivil(IdEstadoCivil),
    CONSTRAINT FK_LicenciaPersona FOREIGN KEY(IdLicencia) REFERENCES Licencia(IdLicencia)
);

-- Proveedor de Servicios para Proveedor
CREATE TABLE ProveedorServicios(
	IdProveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NombreProveedor NVARCHAR(25) NOT NULL,
    RUC NVARCHAR(20) NOT NULL,
    Estado BIT NOT NULL
    
);
-- Padecimiento o enfermedades por cada persona 
CREATE TABLE Cat_Padecimientos(
	CodEnfermedad NVARCHAR(8) NOT NULL PRIMARY KEY,
    NombrePadecimiento NVARCHAR(25) NOT NULL,
    Descripcion TEXT NOT NULL,
    FechaIngreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    Estado BIT NOT NULL,
    CodTipoPadecimiento NVARCHAR(8) NOT NULL,
    IdPersona INT NOT NULL,
    
    CONSTRAINT FK_PadecimientoPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT Cat_TipoPadecimientosCat_Padecimeintos FOREIGN KEY(CodTipoPadecimiento) REFERENCES Cat_TipoPadecimiento(CodTipoPadecimiento)
);

CREATE TABLE PersonaRedSocial(
	IdPersonaRedSocial INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IdPersona INT NOT NULL,
    IdRedes INT NOT NULL,
    NombreUsuario NVARCHAR(25) NOT NULL,
    Estado BIT NOT NULL,
    
    CONSTRAINT PersonaRedSocialPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT PersonaRedSocialCat_RedesSociales FOREIGN KEY(IdRedes) REFERENCES Cat_RedesSociales(IdRedes)
);

CREATE TABLE PaginaWeb(
	IdPaginaWeb INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IdPersona INT NOT NULL,
    URL TEXT NOT NULL,
    Estado BIT NOT NULL,
    Descripcion TEXT NOT NULL,
    
    CONSTRAINT PaginaWebPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona)
);

CREATE TABLE DireccionPersona(
	IdDireccionPersona INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IdPersona INT NOT NULL, 
    Direccion NVARCHAR(100) NOT NULL,
    Estado BIT NOT NULL,
    
    CONSTRAINT DireccionPersonaPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona)
);

CREATE TABLE CorreoPersona(
	IdCorreoPersonal INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IdPersona INT NOT NULL,
    Correo NVARCHAR(100) NOT NULL,
    Estado BIT NOT NULL,
    
    CONSTRAINT CorreoPersonaPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona)
);

CREATE TABLE PersonaIdioma(
	IdPersonaIdioma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IdPersona INT NOT NULL,
    CodIdioma NVARCHAR(5) NOT NULL,
    PorcentajeHablado REAL NOT NULL,
    PorcentajeEscrito REAL NOT NULL,
    PorcentajeInterpretado REAL NOT NULL,
    
    CONSTRAINT PersonaIdiomaPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT IdiomaPersonaIdioma FOREIGN KEY(CodIdioma) REFERENCES Idiomas(CodIdioma)
);
-- Tabla para listar los diferentes grados académicos
CREATE TABLE Cat_TipoEstudio(
	IdTipoEstudio INT NOT NULL PRIMARY KEY auto_increment, 
	NombreTipo NVARCHAR(25) NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE CasadeEstudio(
	IdCasaEstudio INT NOT NULL PRIMARY KEY auto_increment,
	Nombre NVARCHAR(25) NOT NULL,
    FechaFund DATE NOT NULL,
    codPais NVARCHAR(10) NOT NULL,
    NombreCorto NVARCHAR(10) NOT NULL,
    Descripcion NVARCHAR(250) NOT NULL,
    
    CONSTRAINT CasadeEstudioPaisOrigen FOREIGN KEY(codPais) REFERENCES PaisOrigen(codPais)
);

CREATE TABLE Titulos(
	IdTitulo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NombreTitulo NVARCHAR(25) NOT NULL,
    Abreviacion NVARCHAR(5) NOT NULL,
    Relevancia INT NOT NULL
);

CREATE TABLE EstudioPersona(
	IdEstudio INT PRIMARY KEY auto_increment,
	IdPersona INT NOT NULL,
    IdTipoEstudio INT NOT NULL,
    IdCasaEstudio INT NOT NULL,
    IdTitulo INT NULL,
    
    FechaInicio DATE NOT NULL,
    Fechafin DATE NOT NULL,
    
    codPais nvarchar(10) NOT NULL,
    
    CONSTRAINT FK_TituloEstudioPersona FOREIGN KEY (IdTitulo) REFERENCES Titulos(IdTitulo),
    CONSTRAINT CasadeEstudioPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT CasadeEstudioCat_TipoEstudio FOREIGN KEY(IdTipoEstudio) REFERENCES Cat_TipoEstudio(IdTipoEstudio),
    CONSTRAINT CasadeEstudioCasadeEstudio FOREIGN KEY(IdCasaEstudio) REFERENCES CasadeEstudio(IdCasaEstudio),
    CONSTRAINT EstudioPersonaPaisOrigen FOREIGN KEY(codPais) REFERENCES PaisOrigen(codPais)
);

CREATE TABLE CompaniaTelefonica(
	CodCompania NVARCHAR(10) NOT NULL PRIMARY KEY,
    NombreCompania NVARCHAR(25) NOT NULL
);

-- Teléfonos de la persona
CREATE TABLE NumTelefono(
	NoTelefono NVARCHAR(20) NOT NULL,
    
    Estado bit NOT NULL,
    -- foreign key
	IdPersona INT NOT NULL,
    codPais NVARCHAR(10) NOT NULL,
    CodCompania nvarchar(10) NOT NULL,
	CONSTRAINT FK_PersonaTelefono FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT FK_PaisTelefono FOREIGN KEY(codPais) REFERENCES PaisOrigen(codPais),
    CONSTRAINT FK_CompaniaTelefono FOREIGN KEY(CodCompania) REFERENCES CompaniaTelefonica(CodCompania)
);

-- Organización Empresarial
CREATE TABLE AreaEmpresa(
	CodArea NVARCHAR(8) NOT NULL PRIMARY KEY,
	NombreArea NVARCHAR(25) NOT NULL,
	NivelArea INT NOT NULL,
    AreaSuperior INT NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Cargo(
	Codcargo NVARCHAR(8) NOT NULL PRIMARY KEY,
	CodArea NVARCHAR(8) NOT NULL,
	NombreCargo NVARCHAR(25) NOT NULL,
	Estado BIT NOT NULL,

	CONSTRAINT FK_AreaCargo FOREIGN KEY(CodArea) REFERENCES AreaEmpresa(CodArea)
);

CREATE TABLE CargoSalario(
	IdCargoSalario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    Salario REAL NOT NULL,
    AprobadoPor NVARCHAR(25) NOT NULL,
    FechaAprobacion DATE NOT NULL,
    Estado BIT NOT NULL,
    
	CodCargo NVARCHAR(8) NOT NULL,
    
    CONSTRAINT FK_CargoSalario FOREIGN KEY (CodCargo) REFERENCES Cargo(CodCargo)
);

-- Tipo de requisito: Esencial, Secundario, Opcionales
CREATE TABLE TipoRequisito(
	IdRequisito INT NOT NULL PRIMARY KEY auto_increment,
    Nombre NVARCHAR(25) NOT NULL,
    Estado BIT NOT NULL
);

-- Catálogo de requisitos, estudios, experiencia laboral
CREATE TABLE Cat_Requerimientos(
	IdRequerimiento INT NOT NULL PRIMARY KEY auto_increment,
    IdRequisito INT NOT NULL,
    Nombre NVARCHAR(25) NOT NULL,
    Estado BIT NOT NULL,
    
    CONSTRAINT Cat_RequerimientosTipoRequisito FOREIGN KEY(IdRequisito) REFERENCES TipoRequisito(IdRequisito)
);

-- Tabla intermedia requisitos por cada cargo
CREATE TABLE RequisitosCargo(
	IdRequisitosCargo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Codcargo NVARCHAR(8) NOT NULL,
    IdRequerimiento INT NOT NULL,
    Estado BIT NOT NULL,
    
    CONSTRAINT FK_RequisitosCatRequisitos FOREIGN KEY(IdRequerimiento) REFERENCES Cat_Requerimientos(IdRequerimiento),
    CONSTRAINT FK_RequisitosCargo FOREIGN KEY(CodCargo) REFERENCES Cargo(CodCargo)
);

-- Tipo de función: Esencial, Secundario, Opcionales
CREATE TABLE TipoFuncion(
	IdTipoFuncion INT NOT NULL PRIMARY KEY auto_increment,
    Nombre NVARCHAR(25) NOT NULL,
    Estado BIT NOT NULL
);
-- Catálogo de Funciones
CREATE TABLE Cat_Funciones(
	IdFuncion INT NOT NULL PRIMARY KEY auto_increment,
    IdTipoFuncion INT NOT NULL,
    Nombre NVARCHAR(25) NOT NULL,
    Descripcion TEXT NOT NULL,
    Estado BIT NOT NULL,
    
    CONSTRAINT Cat_FuncionesTipo FOREIGN KEY (IdTipoFuncion) REFERENCES TipoFuncion(IdTipoFuncion)
);
-- Tabla Intermedia Funciones por Cargo
CREATE TABLE FuncionesCargo(
	IdFuncionCargo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Codcargo NVARCHAR(8) NOT NULL,
    IdFuncion INT NOT NULL,
    Estado BIT NOT NULL,
    
    CONSTRAINT FK_FuncionCargo FOREIGN KEY (CodCargo) REFERENCES Cargo(CodCargo),
    CONSTRAINT FK_Funciones FOREIGN KEY (IdFuncion) REFERENCES Cat_Funciones(IdFuncion)
);

-- Tipos de Publicidad para Vacante
CREATE TABLE Cat_Publicidad(
	IdPublicidad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NombrePublicidad NVARCHAR(25) NOT NULL,
    Abreviacion NVARCHAR(5) NOT NULL
);
-- Tipos de Vacante
CREATE TABLE Cat_TipoVacante(
	IdTipoVacante INT NOT NULL PRIMARY KEY auto_increment,
    TipoVacante NVARCHAR(25) NOT NULL
);

-- Tabla de Vacantes
CREATE TABLE Vacante(
	CodVacante NVARCHAR(8) NOT NULL PRIMARY KEY,
    
    Descripcion nvarchar(100) NOT NULL, -- "Se busca joven proactivo para finanzas"
    PresupuestoPublicidad REAL NOT null, -- Fecha Publicidad
	FechaLimiteRecepcion DATE NOT NULL,
	FechaContratacion DATE NOT NULL,
	FechaElaboracion DATE NOT NULL,
    
    ElaboradaPor NVARCHAR(25) NOT NULL,
    AutorizadaPor NVARCHAR(25) NOT NULL,
    Estado BIT NOT NULL,
    
    IdTipoVacante INT NOT NULL,
    Codcargo NVARCHAR(8) NOT NULL,
	IdPublicidad INT NOT NULL,

	CONSTRAINT FK_CargoVacante FOREIGN KEY(Codcargo) REFERENCES Cargo(Codcargo),
    CONSTRAINT Cat_TipoVacanteVacante FOREIGN KEY(IdTipoVacante) REFERENCES Cat_TipoVacante(IdTipoVacante),
	CONSTRAINT fk_PubliVacante FOREIGN KEY(IdPublicidad) REFERENCES Cat_Publicidad(IdPublicidad)
);

CREATE TABLE EstadoPostulante(
	IdEstadoPostulante INT NOT NULL PRIMARY KEY auto_increment, -- 0 se rechaza
    TipoEstado NVARCHAR(25) NOT NULL
);

CREATE TABLE Postulantes(
	IdPostulante INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    IdEstadoPostulante INT NOT NULL, -- Set automaticamente en 1
    FechaSolicitud DATE NOT NULL,
    AspiracionSalarial REAL NOT NULL,
    GastoMensual REAL NOT NULL,
    MontoDeudas REAL NOT NULL,
	CV TEXT NOT NULL,
    RegistroCompleto BIT NULL, -- Set auto 1, validar para aplicar en vacante,
    
    IdPersona INT NOT NULL,
    CodVacante NVARCHAR(8) NOT NULL,
    
	CONSTRAINT FK_PostulantePersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    -- CONSTRAINT PostulantesUsuarioPostulante FOREIGN KEY(IdUsuario) REFERENCES UsuarioPostulante(IdUsuario),
    CONSTRAINT PostulantesEstadoPostulante FOREIGN KEY(IdEstadoPostulante) REFERENCES EstadoPostulante(IdEstadoPostulante),
	CONSTRAINT FK_VacantePostulante FOREIGN KEY(CodVacante) REFERENCES Vacante(CodVacante)
);

-- Instrumento de Selección
CREATE TABLE Instrumento(
	IdInstrumento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NombreInstrumento NVARCHAR(25) NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE CampoInstrumento(
	IdCampoInstrumento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Descripcion TEXT NOT NULL,
    Porcentaje REAL NULL,
    Estado BIT NOT NULL,
    
    IdInstrumento INT NOT NULL,
    CONSTRAINT FK_InstrumentoCampo FOREIGN KEY (IdInstrumento) REFERENCES Instrumento(IdInstrumento)
);

-- Revision Principal de Documentacion
CREATE TABLE RevisionPreliminar(
	IdRevisionPreliminar INT NOT NULL PRIMARY KEY auto_increment,
	
    FechaRevision DATE NOT NULL,
    Pasa BIT NOT NULL,
    
    IdPostulante INT NOT NULL,
	CodVacante NVARCHAR(8) NOT NULL,
	
	CONSTRAINT FK_PostulanteRecluta FOREIGN KEY(IdPostulante) REFERENCES Postulantes(IdPostulante),
	CONSTRAINT FK_VacanteRecluta FOREIGN KEY(CodVacante) REFERENCES Vacante(CodVacante)
);
-- Revision de Requisitos Oficial
CREATE TABLE RevisionOficial(
	IdRevisionOficial INT NOT NULL PRIMARY KEY auto_increment,
	
    FechaRevision DATE NOT NULL,
    Pasa BIT NOT NULL,
    PersonaEncargada NVARCHAR(35) NOT NULL,
    
    IdPostulante INT NOT NULL,
	CodVacante NVARCHAR(8) NOT NULL,
	
	CONSTRAINT FK_PostulanteRev1 FOREIGN KEY(IdPostulante) REFERENCES Postulantes(IdPostulante),
	CONSTRAINT FK_VacanteRev1 FOREIGN KEY(CodVacante) REFERENCES Vacante(CodVacante)
);
-- Primera Entrevista
CREATE TABLE Entrevista1(
	IdEntrevista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    FechaRevision DATE NOT NULL,
    Pasa BIT NOT NULL,
    PersonaEncargada NVARCHAR(35) NOT NULL,
    
    IdPostulante INT NOT NULL,
	CodVacante NVARCHAR(8) NOT NULL,
	
	CONSTRAINT FK_PostulanteEnt1 FOREIGN KEY(IdPostulante) REFERENCES Postulantes(IdPostulante),
	CONSTRAINT FK_VacanteRecEnt1 FOREIGN KEY(CodVacante) REFERENCES Vacante(CodVacante)
);
-- Segunda Entrevista
CREATE TABLE Entrevista2(
	IdEntrevista2 INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    FechaRevision DATE NOT NULL,
    Pasa BIT NOT NULL,
    PersonaEncargada NVARCHAR(35) NOT NULL,
    
    IdPostulante INT NOT NULL,
	CodVacante NVARCHAR(8) NOT NULL,
	
	CONSTRAINT FK_PostulanteEnt2 FOREIGN KEY(IdPostulante) REFERENCES Postulantes(IdPostulante),
	CONSTRAINT FK_VacanteEnt2 FOREIGN KEY(CodVacante) REFERENCES Vacante(CodVacante)
);
-- Exámenes
CREATE TABLE Examenes(
	IdExamen INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    NombreExamen NVARCHAR(30),
    Estado BIT NOT NULL default 1
    
);
-- Tabla intermedia Examen y Postulantes
CREATE TABLE ExamenPostulante(
	IdExamenPostulante INT NOT NULL primary key AUTO_INCREMENT,
    
    IdExamen INT NOT NULL,
    IdPostulante INT NOT NULL,
    
    CONSTRAINT FK_ExamenPostulante FOREIGN KEY (IdPostulante) REFERENCES Postulantes(IdPostulante),
    CONSTRAINT FK_PostulanteExamen FOREIGN KEY (IdExamen) REFERENCES Examenes(IdExamen)
);

-- Referencias Personales
CREATE TABLE Referencias(
	IdReferencia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,

	AnosRelacion REAL NOT NULL, -- Cantidad de años que se le conoce
    RutaDoc TEXT NOT NULL,
    IdPersona INT NOT NULL,
    IdPostulante INT NOT NULL,
    
    CONSTRAINT FK_PostulanteReferencia FOREIGN KEY(IdPostulante) REFERENCES Postulantes(IdPostulante),
	CONSTRAINT FK_PersonaReferencia FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona)
);


CREATE TABLE Empleado(
	CodEmpleado NVARCHAR(8) NOT NULL primary key,
    CodINSS NVARCHAR(15) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NOT NULL,
    AnosLaborando REAL NOT NULL,
    
    -- foreign key
	IdPersona INT NOT NULL,
	CodCargo NVARCHAR(8) NOT NULL,
	-- CodContrato NVARCHAR(8) NOT NULL,
    CONSTRAINT FK_PersonaEmpleado FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT FK_CargoEmpleado FOREIGN KEY(CodCargo) REFERENCES Cargo(CodCargo)
);
CREATE TABLE TipoContrato(
	CodTipoCont NVARCHAR(8) NOT NULL PRIMARY KEY,
    Tipo TEXT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NOT NULL,
    TipoJornada NVARCHAR(25) NOT NULL
);

CREATE TABLE RepresentacionLegal(
	IdRepresentante INT NOT NULL PRIMARY KEY auto_increment,
	Estado BIT NOT NULL,

	CodEmpleado NVARCHAR(8) NOT NULL,
	CONSTRAINT FK_EmpleadoRepresentante FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);

CREATE TABLE Contrato(
	CodContrato NVARCHAR(12) NOT NULL PRIMARY KEY,
	NombreContrato NVARCHAR(20) NOT NULL,
    
	-- IdPersona INT NOT NULL,
	IdRepresentante INT NOT NULL,
	CodTipoCont NVARCHAR(8) NOT NULL,
    CodEmpleado NVARCHAR(8) NOT NULL,
    -- IdCat_Salario INT NOT NULL,
	CONSTRAINT FK_EmpleadoContrato FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado),
	CONSTRAINT FK_RepresentanteContrato FOREIGN KEY(IdRepresentante) REFERENCES RepresentacionLegal(IdRepresentante),
    CONSTRAINT FK_ContratoT FOREIGN KEY(CodTipoCont) REFERENCES TipoContrato(CodTipoCont)
    -- CONSTRAINT ContratoCatSalario FOREIGN KEY(IdCat_Salario) REFERENCES CatSalario(IdCat_Salario)
);


CREATE TABLE CatClausulas(
	IdCatClausula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	
    NumClausula int not null,
	Clausula TEXT NOT NULL,
    Estado BIT NOT NULL

);

CREATE TABLE ClausulaContrato(
	IdClausulaContrato INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    IdCatClausula INT NOT NULL,
    CodContrato NVARCHAR(12)  NOT NULL,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    
    CONSTRAINT FK_ClausulaContrato FOREIGN KEY(IdCatClausula) REFERENCES CatClausulas(IdCatClausula),
    CONSTRAINT FK_ContratoClausula FOREIGN KEY(CodContrato) REFERENCES Contrato(CodContrato)
);
-- Habilidades: Oratoria, etc
CREATE TABLE Cat_Habilidades(
	IdHabilidades INT NOT NULL PRIMARY KEY auto_increment,
	NombreHabilidad NVARCHAR(25) NOT NULL
    
);

CREATE TABLE HabilidadesEmpleados(
	IdHabilidadEmpleado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    PorcentajeDominio REAL NOT NULL,
    
    IdHabilidades INT NOT NULL,
    CodEmpleado NVARCHAR(8) NOT NULL, 
    
    CONSTRAINT FK_Habilidad FOREIGN KEY(IdHabilidades) REFERENCES Cat_Habilidades(IdHabilidades),
    CONSTRAINT FK_HabilidadEmpleado FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);

CREATE TABLE HistorialLaboral(
	CodEmpleado NVARCHAR(8) NOT NULL,
    Estado BIT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NOT NULL,
    Motivo TEXT NOT NULL,
    
    CONSTRAINT HistorialLaboralEmpleado FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);

-- Catalógo de Parentesco para los Dependientes
CREATE TABLE Parentesco(
	IdParentesco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NombreParentesco NVARCHAR(30) NOT NULL, 
    Estado BIT NOT NULL DEFAULT 0
);
-- Catalógo de detalle del parentesco: 'Cuido materno, cuido a mayor de edad, etc'
CREATE TABLE DescripcionParentesco(
	IdDescripcion INT NOT NULL primary key AUTO_INCREMENT,
    TituloParentesco NVARCHAR(25) NOT NULL,
    Detalle TEXT NOT NULL
);
-- Dependientes por cada Empleado
CREATE TABLE Dependientes(
	IdFamiliar INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IdPersona INT NOT NULL, -- Persona a rellanr como dependiente
    CodEmpleado NVARCHAR(8) NOT NULL, -- Empleado al que pertenece
    Difunto BIT NOT NULL, -- Estado
    EsBeneficiario BIT NOT NULL,
    Porcentaje REAL NOT NULL,
    
    IdParentesco INT NOT NULL,
    IdDescripcion INT NOT NULL,
    
    CONSTRAINT FK_DescripcionDependiente FOREIGN KEY (IdDescripcion) REFERENCES DescripcionParentesco(IdDescripcion),
    CONSTRAINT FK_ParentescoDependiente FOREIGN KEY (IdParentesco) REFERENCES Parentesco(IdParentesco),
    CONSTRAINT FK_EmpleadoDependiente FOREIGN KEY (CodEmpleado) REFERENCES Empleado(CodEmpleado),
    CONSTRAINT FK_PersonaDependiente FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona)
);

-- PARA LA NÓMINA
CREATE TABLE PeriodoLaboral(
	IdPeriodoLaboral INT NOT NULL PRIMARY KEY auto_increment,
    Nombre NVARCHAR(25) NOT NULL,
    Descripcion NVARCHAR(100) NOT NULL,
    Estado BIT NOT NULL
);
CREATE TABLE HistorialCargo(
	IdHistorialCargo INT NOT NULL PRIMARY KEY auto_increment,
    Codcargo nvarchar(8) NOT NULL,
    CONSTRAINT FK_CargoHistorial FOREIGN KEY(CodCargo) REFERENCES Cargo(CodCargo)
);

-- Gestion de prestaciones y penalizacion
CREATE TABLE EntradaSalidas(
	HoraEntradas DATETIME NOT NULL,
	HoraSalidas DATETIME NOT NULL,
	#Asistencias	BIT NOT NULL,
	Dia DATE NOT NULL,
	-- foreign key
	CodEmpleado NVARCHAR(8) NOT NULL,
	CONSTRAINT FK_ESEmpleados FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);

CREATE TABLE LLegadasTardias(
	IdLlegadaTarde INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    CantidadHora REAL NOT NULL,
    Deducido REAL NOT NULL,
    Dia TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    AgregadoPor NVARCHAR(25) NOT NULL,
    Detalle TEXT NOT NULL,
    Justificado BIT NOT NULL,
    Estado BIT NOT NULL,
    
    CodEmpleado NVARCHAR(8) NOT NULL,
    IdPeriodoLaboral INT NOT NULL,
    CONSTRAINT FK_LlegadasTardiasEmpleado FOREIGN KEY (CodEmpleado) REFERENCES Empleado(CodEmpleado),
    CONSTRAINT FK_LlegadasTardiasPeriodo FOREIGN KEY (IdPeriodoLaboral) REFERENCES PeriodoLaboral(IdPeriodoLaboral)
);
CREATE TABLE Permisos(
	IdPermisos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    CantidadHora REAL NOT NULL,
    Deducido REAL NOT NULL,
    Dia DATETIME NOT NULL,
    AgregadoPor NVARCHAR(25) NOT NULL,
    Detalle TEXT NOT NULL,
    Justificado BIT NOT NULL,
    Estado BIT NOT NULL,
    
    CodEmpleado NVARCHAR(8) NOT NULL,
    IdPeriodoLaboral INT NOT NULL,
    CONSTRAINT FK_PermisoEmpleado FOREIGN KEY (CodEmpleado) REFERENCES Empleado(CodEmpleado),
    CONSTRAINT FK_PermisoPeriodo FOREIGN KEY (IdPeriodoLaboral) REFERENCES PeriodoLaboral(IdPeriodoLaboral)
);
CREATE TABLE AdelantoSalario(
	IdAdelanto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    -- CantidadHora REAL NOT NULL,
    Monto REAL NOT NULL,
    Dia TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    AprobadoPor NVARCHAR(25) NOT NULL,
    ConceptoDe TEXT NOT NULL,
    -- Justificado BIT NOT NULL,
    Estado BIT NOT NULL,
    
    CodEmpleado NVARCHAR(8) NOT NULL,
    IdPeriodoLaboral INT NOT NULL,
    CONSTRAINT FK_AdelantoEmpleado FOREIGN KEY (CodEmpleado) REFERENCES Empleado(CodEmpleado),
    CONSTRAINT FK_AdelantoPeriodo FOREIGN KEY (IdPeriodoLaboral) REFERENCES PeriodoLaboral(IdPeriodoLaboral)
);
CREATE TABLE HorasExtra(
	IdHorasExtra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    CantidadHora REAL NOT NULL,
    Pagado REAL NOT NULL,
    Dia TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    AgregadoPor NVARCHAR(25) NOT NULL,
    Detalle TEXT NOT NULL,
    Justificado BIT NOT NULL,
    Estado BIT NOT NULL,
    
    CodEmpleado NVARCHAR(8) NOT NULL,
    IdPeriodoLaboral INT NOT NULL,
    CONSTRAINT FK_ExtraEmpleado FOREIGN KEY (CodEmpleado) REFERENCES Empleado(CodEmpleado),
    CONSTRAINT FK_ExtraPeriodo FOREIGN KEY (IdPeriodoLaboral) REFERENCES PeriodoLaboral(IdPeriodoLaboral)
);

CREATE TABLE TipoVacacion(
	IdTipoVacacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nombre NVARCHAR(20) NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE VacacioneAcumuladas(
	IdVacaciones INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    Cantidad REAL NOT NULL,
    Pagado REAL NOT NULL,
    Dia TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    AgregadoPor NVARCHAR(25) NOT NULL,
    Detalle TEXT NOT NULL,
    Justificado BIT NOT NULL,
    
    CodEmpleado NVARCHAR(8) NOT NULL,
    IdPeriodoLaboral INT NOT NULL,
    IdTipoVacacion INT NOT NULL,
    
    CONSTRAINT FK_VacacionTipo FOREIGN KEY (IdTipoVacacion) REFERENCES TipoVacacion(IdTipoVacacion),
    CONSTRAINT FK_VacacionesEmpleado FOREIGN KEY (CodEmpleado) REFERENCES Empleado(CodEmpleado),
    CONSTRAINT FK_VacacionesPeriodo FOREIGN KEY (IdPeriodoLaboral) REFERENCES PeriodoLaboral(IdPeriodoLaboral)
);

-- Tipo incentivo, comisión etc.alter
CREATE TABLE TipoIncentivo(
	IdTipoIncentivo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nombre NVARCHAR(20) NOT NULL,
    Estado BIT NOT NULL
);
CREATE TABLE Incentivos(
	IdIncentivo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    -- CantidadHora REAL NOT NULL,
    Pagado REAL NOT NULL,
    Dia TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    AgregadoPor NVARCHAR(25) NOT NULL,
    ConceptoDe TEXT NOT NULL,
    Justificado BIT NOT NULL,
    
    CodEmpleado NVARCHAR(8) NOT NULL,
    IdPeriodoLaboral INT NOT NULL,
    IdTipoIncentivo INT NOT NULL,
    
    CONSTRAINT FK_TipoIncentivo FOREIGN KEY (IdTipoIncentivo) REFERENCES TipoIncentivo(IdTipoIncentivo),
    CONSTRAINT FK_IncentivoEmpleado FOREIGN KEY (CodEmpleado) REFERENCES Empleado(CodEmpleado),
    CONSTRAINT FK_IncentivoPeriodo FOREIGN KEY (IdPeriodoLaboral) REFERENCES PeriodoLaboral(IdPeriodoLaboral)
);

-- Gestion de nomina
CREATE TABLE HorarioLaboral(
	IdHorarioLaboral INT NOT NULL PRIMARY KEY auto_increment,
    HoraEntrada TIMESTAMP NOT NULL,
    HoraSalida TIMESTAMP NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Cat_TipoNomina(
	IdTipoNomina INT auto_increment primary key  NOT NULL,
    TipoNomina nvarchar(50) NOT NULL,
    Estado BIT not null
);

CREATE TABLE TablaProgresiva(
	CodIr NVARCHAR(10) NOT NULL PRIMARY KEY,
    Fecha DATETIME NOT NULL,
    
    Estado BIT NOT NULL
);

CREATE TABLE DetalleTablaProgresiva(
	IdDetalleIr INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Tipo CHAR(1) NOT NULL, # A, B, C, D, E
    Desde REAL NOT NULL,
    Hasta REAL NOT NULL,
    ImpuestoBase INT NOT NULL,
    PorcentajeAplicable REAL NOT NULL,
    SobreExceso INT NOT NULL,
    
    CodIr NVARCHAR(10) NOT NULL,
    CONSTRAINT FK_CodIr foreign key (CodIr) REFERENCES TablaProgresiva(CodIr)
    
);

CREATE TABLE Nomina(
	IdNomina INT auto_increment primary key NOT NULL,
    
    InicioPeriodo DATE NOT NULL,
    FinalPeriodo DATE NOT NULL,
    
    AprobadoPor nvarchar(30) NULL,
    ElaboradoPor nvarchar(30) NULL,
    
    TotalIR REAL NULL,
    TotalInatec REAL NULL,
    TotalINSSPatronal REAL NULL,
    TotalINSSPersonal REAL NULL,
    Estado BIT NOT NULL default 0, -- 1 aprobado, 0 no aprobado
    
    IdPeriodoLaboral INT NOT NULL,
	IdTipoNomina INT NOT NULL,
    constraint Fk_NominaTipo FOREIGN KEY(IdTipoNomina) references Cat_TipoNomina(IdTipoNomina),
    CONSTRAINT FK_NominaPeriodoLaboral FOREIGN KEY(IdPeriodoLaboral) REFERENCES PeriodoLaboral(IdPeriodoLaboral)
);

CREATE TABLE Det_Nomina(
	FechaPago TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    
    DiasLaborados DOUBLE NOT NULL,
    SalarioPorHora REAL NOT NULL,
    
    DeduccionPermiso REAL NOT NULL,
    
    Septimo REAL NOT NULL,
    
    VacacionesPagadasQ INT NOT NULL,
    VacacionesPagadasR REAL NOT NULL,
    
    LlegadasTardiasQ INT NOT NULL,
    LlegadasTardiasR REAL NOT NULL,
    
    AnticiposQ INT NOT NULL,
    AnticiposR REAL NOT NULL,
    
    HorasExtraQ INT NOT NULL,
    HorasExtrasR DOUBLE NOT NULL,
    
    IncentivoR REAL NOT NULL,
    SalarioBruto REAL NOT NULL,

    INSSLaboral REAL NOT NULL,
	IRDeducido REAL NOT NULL,
    
    INSSPatronal REAL NOT NULL,
    Inatec REAL NOT NULL,
    
    Antiguedades REAL NOT NULL,
    
    SalarioNeto REAL NOT NULL,
    
    Estado BIT NOT NULL,
    -- Foreing key
	IdNomina INT NOT NULL,
    CodEmpleado NVARCHAR(8) NOT NULL,
    -- IdCat_Salario INT NOT NULL,
    -- Id_Comisiones INT NULL,
    CodIr NVARCHAR(10) NOT NULL,
	
    CONSTRAINT FK_NominaDetalle FOREIGN KEY(IdNomina) REFERENCES Nomina(IdNomina),
    constraint Fk_EmpleadoNomina FOREIGN KEY(CodEmpleado) references Empleado (CodEmpleado),
    -- constraint Fk_SalarioNomina FOREIGN KEY(IdCat_Salario) references CatSalario (IdCat_Salario),
    -- constraint Fk_ComisionesNomina FOREIGN KEY(Id_Comisiones) references Cat_comision (Id_comisiones),
    CONSTRAINT FK_IrDetalle FOREIGN KEY(CodIr) REFERENCES TablaProgresiva(CodIr)
);

-- Medicion desempeño


CREATE TABLE CatPrueba(
	CodPrueba NVARCHAR(8) NOT NULL PRIMARY KEY,
    CodCargo NVARCHAR(8) NOT NULL,
    CodArea NVARCHAR(8) NOT NULL,
    TituloPrueba NVARCHAR(25) NOT NULL,
    FechaEmision DATE NOT NULL,
    Estado BIT NOT NULL,
    
    CONSTRAINT FK_CargoPrueba FOREIGN KEY(CodCargo) REFERENCES Cargo(CodCargo),
    CONSTRAINT FK_AreaEmpresaPrueba FOREIGN KEY(CodArea) REFERENCES AreaEmpresa(CodArea)
   
);

CREATE TABLE FormatoPrueba(
	CodPrueba NVARCHAR(8) NOT NULL,
    Pregunta NVARCHAR(25) NOT NULL,
    #Respuesta NVARCHAR(250) NULL,
    
    CONSTRAINT FK_PruebaFormatoPrueba FOREIGN KEY(CodPrueba) REFERENCES catPrueba(CodPrueba)
);

CREATE TABLE EmpleadoPrueba(
	IdEmpleadoPrueba INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CodPrueba NVARCHAR(8) NOT NULL,
    CodEmpleado NVARCHAR(15) NOT NULL,
    CONSTRAINT FK_EmpleFormatoPrueba FOREIGN KEY(CodPrueba) REFERENCES CatPrueba(CodPrueba)
);

CREATE TABLE EmpleadoFormato(
	IdEmpleadoPrueba INT NOT NULL,
    Respuesta NVARCHAR(250) NOT NULL,
    
    CONSTRAINT FK_EmpleadoPruebaFormato FOREIGN KEY(IdEmpleadoPrueba) REFERENCES EmpleadoPrueba(IdEmpleadoPrueba)
);

CREATE TABLE CatCapacitacion(
	IdCapacitacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    Nombre NVARCHAR(30),
    Estado BIT NOT NULL,
    
    IdProveedor INT NOT NULL,
    CONSTRAINT FK_Capacitacion FOREIGN KEY(IdProveedor) REFERENCES ProveedorServicios(IdProveedor)
);

CREATE TABLE CapacitacionEmpleado(
	IdCapacitacionEmpleado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    IdCapacitacion INT NOT NULL,
    CodEmpleado NVARCHAR(12) NOT NULL,
    CONSTRAINT FK_CapacitacionEmpleado FOREIGN KEY (CodEmpleado) REFERENCES Empleado(CodEmpleado),
    CONSTRAINT FK_CapacitacionProveedor FOREIGN KEY (IdCapacitacion) REFERENCES CatCapacitacion(IdCapacitacion)
);

-- SEGURIDAD :DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
-- Postulante user
CREATE TABLE UsuarioPostulante(
	IdUsuario INT NOT NULL primary KEY auto_increment,
    Usuario NVARCHAR(100) NOT NULL,
    HashPass TEXT NOT NULL,
    CorreoProp TEXT NOT NULL,
    
    -- foreign key
    IdPersona INT NULL,
    constraint FK_Userper foreign key(IdPersona) references Persona(IdPersona)
);

Create table UsuarioEmpleado(
	idUsuarioEmp INT NOT NULL primary KEY auto_increment,
	Usuario NVARCHAR(100) NOT NULL,
    HashPass TEXT NOT NULL,
    CorreoInstitucional TEXT NOT NULL,
    
	CodEmpleado NVARCHAR(8) NOT NULL,
    CONSTRAINT FK_UsuarioEmpleado FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);

Create table Cat_Rols(
	IdRol INT primary key NOT NULL auto_increment,
    Nombre nvarchar(50) NOT NULL,
	Estado bit NOT NULL
);

Create table RolUsuario(
	idRolUsuario INT primary key NOT NULL auto_increment,
	idCatRol INT NOT NULL,
	idUsuarioEmp INT NOT NULL,
    IdRol INT NOT NULL,
    CONSTRAINT FK_RolsUsuaio FOREIGN KEY(idUsuarioEmp) REFERENCES UsuarioEmpleado(idUsuarioEmp),
    CONSTRAINT FK_Cat_Rol FOREIGN KEY(IdRol) REFERENCES Cat_Rols(IdRol)
);

Create table PermisosSecurity(
	IdPermisos INT primary key NOT NULL auto_increment,
	Nombre nvarchar(50) NOT NULL,
    Estado BIT NOT NULL,
    
    IdRol INT NOT NULL,
    CONSTRAINT FK_PermisoRol FOREIGN KEY(IdRol) REFERENCES Cat_Rols(IdRol)
);

CREATE TABLE DB(
	IdDb INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Usuario NVARCHAR(100) NOT NULL,
    Pass NVARCHAR(300) NOT NULL,
    HostDb NVARCHAR(100) NOT NULL,
    Puerto NVARCHAR(100) NOT NULL
);

CREATE TABLE HistoryDB(
	IdHistoryDB INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RegistradoPor NVARCHAR(30) NOT NULL,
    
    IdDb INT NOT NULL,
    CONSTRAINT FK_HistoryDB FOREIGN KEY (IdDb) REFERENCES DB(IdDb)
);

Create table intentosSession(
	IdIntentosSession INT NOT NULL primary key auto_increment,
	NumeroIntentos INT NOT NULL,
    Dispositivo nvarchar(15) NOT NULL,
    
	idUsuarioEmp INT NOT NULL,
    CONSTRAINT FK_RolUsuaio FOREIGN KEY(idUsuarioEmp) REFERENCES UsuarioEmpleado(idUsuarioEmp)
);

Create table Cat_FechaSession(
	idCat_Fecho INT primary key NOT NULL auto_increment,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    
    IdIntentosSession INT NOT NULL,
    CONSTRAINT FK_CatFehaInisioSess FOREIGN KEY(IdIntentosSession) REFERENCES intentosSession(IdIntentosSession)
);

Create table Conexiones(
	idConecInte int NOT NULL primary KEY auto_increment,
    idUsuarioEmp INT NOT NULL,
    SessionOpen TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    SessionClose TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    
     CONSTRAINT FK_IntentosUsuario FOREIGN KEY(idUsuarioEmp) REFERENCES UsuarioEmpleado(idUsuarioEmp)
);

Create table Bitacora(
	CODIGO_AU INT NOT NULL PRIMARY KEY auto_increment,
	CodUSUARIO_AU VARCHAR(20) NOT NULL,
	TABLA VARCHAR(20) NOT NULL,
	ACCION VARCHAR(20) NOT NULL,
	DESCRIPCION VARCHAR(500),
	FECHA_HORA TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
    
    -- CONSTRAINT FK_UserAuditoria FOREIGN KEY(CodUSUARIO_AU) REFERENCES UsuarioEmpleado(idUsuarioEmp)
);

