#CREATE database INTA_RRHH
use INTA_RRHH;

-- En este catalogo llevara catpais donde iran todos los departamentos del pais
CREATE TABLE CatCiudad(
	IdCiudad int NOT NULL PRIMARY KEY,
    NombrePais NVARCHAR(20) NOT NULL,
    NombreCiudad nvarchar(100) NOT NULL,
    -- foreign key
	CodPais nvarchar(10) NOT NULL,
    constraint Fk_PaisCat FOREIGN KEY(CodPais) REFERENCES PaisOrigen(codPais)
);

CREATE TABLE Idiomas(
	CodIdioma NVARCHAR(5) NOT NULL PRIMARY KEY,
    NombreIdioma NVARCHAR(10) NOT NULL
);
-- Se crea tabla persona, que contiene todos los campos necesarios para las personas en 
-- proceso de reclutamiento
CREATE TABLE Cat_RedesSociales(
	IdRedes INT NOT NULL PRIMARY KEY auto_increment,
	Nombre NVARCHAR(25) NOT NULL
);

CREATE TABLE Cat_TipoPadecimiento(
	CodTipoPadecimiento NVARCHAR(8) NOT NULL PRIMARY KEY,
    NombreTipoPadecimiento NVARCHAR(50) NOT NULL
);

CREATE TABLE Cat_Padecimientos(
	CodEnfermedad NVARCHAR(8) NOT NULL PRIMARY KEY,
    CodTipoPadecimiento NVARCHAR(8) NOT NULL,
    
    CONSTRAINT Cat_TipoPadecimientosCat_Padecimeintos FOREIGN KEY(CodTipoPadecimiento) REFERENCES Cat_TipoPadecimiento(CodTipoPadecimiento)
);


-- Falta relacion con persona 
CREATE TABLE PeriodoLaboral(
	IdPeriodoLaboral INT NOT NULL PRIMARY KEY auto_increment,
    Nombre NVARCHAR(25) NOT NULL,
    Descripcion NVARCHAR(100) NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE HorarioLaboral(
	IdHorarioLaboral INT NOT NULL PRIMARY KEY auto_increment,
    HoraEntrada DATETIME NOT NULL,
    HoraSalida DATETIME NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE PersonaHorLab(
	IdPersonaHorario INT NOT NULL Primary Key AUTO_INCREMENT,
    numPersona INT NOT NULL,
    FechaAsignacion date not null,
    FechaDestitucion date not null,
    HorarioLaboral nvarchar(25) not null,
    PeriodoLaboral nvarchar(25) not null,
    estado bit NOT NULL,
    
    CONSTRAINT FK_PersonaHorLabPersona FOREIGN KEY (numPersona) REFERENCES Persona (numpersona) 
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
    
    CONSTRAINT CasadeEstudioPaisOrigen FOREIGN KEY(codPais) REFERENCES PaisOrigen(codPais)
);

CREATE TABLE EstudioPersona(
	IdEstudio INT PRIMARY KEY auto_increment,
	IdPersona INT NOT NULL,
    IdTipoEstudio INT NOT NULL,
    IdCasaEstudio INT NOT NULL,
    FechaInicio DATE NOT NULL,
    Fechafin DATE NOT NULL,
    codPais nvarchar(10) NOT NULL,
    
    CONSTRAINT CasadeEstudioPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT CasadeEstudioCat_TipoEstudio FOREIGN KEY(IdTipoEstudio) REFERENCES Cat_TipoEstudio(IdTipoEstudio),
    CONSTRAINT CasadeEstudioCasadeEstudio FOREIGN KEY(IdCasaEstudio) REFERENCES CasadeEstudio(IdCasaEstudio),
    CONSTRAINT EstudioPersonaPaisOrigen FOREIGN KEY(codPais) REFERENCES PaisOrigen(codPais)
);

CREATE TABLE Cat_Habilidades(
	IdHabilidades INT NOT NULL PRIMARY KEY auto_increment,
	NombreHabilidad NVARCHAR(25) NOT NULL,
    PorcentajeDominio REAL NOT NULL,
    
    IdPersona INT NOT NULL, 
    CONSTRAINT FK_HabilidadPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona)
);


CREATE TABLE Referencias(
	IdReferencia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nombre NVARCHAR(25) NOT NULL,
    DUI NVARCHAR(20) NOT NULL,
    RutaDoc TEXT NOT NULL,
    IdPersona INT NOT NULL,
    
	CONSTRAINT FK_PersonaReferencia FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona)
);

CREATE TABLE CompañiaTelefonica(
	CodCompañia NVARCHAR(10) NOT NULL PRIMARY KEY,
    NombreCompañia NVARCHAR(25) NOT NULL
);

-- Teléfonos de la persona
CREATE TABLE NumTelefono(
	NoTelefono NVARCHAR(20) NOT NULL,
    
    Estado bit NOT NULL,
    -- foreign key
	IdPersona INT NOT NULL,
    codPais NVARCHAR(10) NOT NULL,
    CodCompañia nvarchar(10) NOT NULL,
	CONSTRAINT FK_PersonaTelefono FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT FK_PaisTelefono FOREIGN KEY(codPais) REFERENCES PaisOrigen(codPais),
    CONSTRAINT FK_CompañiaTelefono FOREIGN KEY(CodCompañia) REFERENCES CompañiaTelefonica(CodCompañia)
);

CREATE TABLE AreaEmpresa(
	CodArea NVARCHAR(8) NOT NULL PRIMARY KEY,
	NombreArea NVARCHAR(25) NOT NULL,
	NivelArea INT NOT NULL,
    AreaSuperior INT NOT NULL
);

CREATE TABLE TipoRequisito(
	IdRequisito INT NOT NULL PRIMARY KEY auto_increment,
    Nombre NVARCHAR(25) NOT NULL
);

CREATE TABLE Cat_Requerimientos(
	IdRequerimiento INT NOT NULL PRIMARY KEY auto_increment,
    IdRequisito INT NOT NULL,
    Nombre NVARCHAR(25) NOT NULL,
    
    CONSTRAINT Cat_RequerimientosTipoRequisito FOREIGN KEY(IdRequisito) REFERENCES TipoRequisito(IdRequisito)
);

CREATE TABLE Cat_Publicidad(
	CodPublicidad NVARCHAR(8) NOT NULL PRIMARY KEY,
    TipoPublicidad NVARCHAR(25) NOT NULL,
    Estado BIT NOT NULL
);

CREATE TABLE Cargo(
	Codcargo NVARCHAR(8) NOT NULL PRIMARY KEY,
	CodArea NVARCHAR(8) NOT NULL,
	NombreCargo NVARCHAR(25) NOT NULL,
	Presupuesto REAL NOT NULL,
	Estado BIT NOT NULL,

	CONSTRAINT FK_AreaCargo FOREIGN KEY(CodArea) REFERENCES AreaEmpresa(CodArea)
);

CREATE TABLE FichaCargo(
	CodCargo NVARCHAR(8) primary key NOT NULL,
    TtituloPuesto nvarchar(50) NOT NULL,
    Departamento nvarchar(50) NOT NULL,
    Educacion nvarchar(50) NOT NULL,
	Funcion TEXT NOT NULL,
    ExpLaboral TEXT NOT NULL,

	CONSTRAINT FK_CargoFunciones FOREIGN KEY(CodCargo) REFERENCES Cargo(Codcargo)
);
-- forma de contratacion presupuesto publi 
CREATE TABLE Cat_TipoVacante(
	IdTipoVacante INT NOT NULL PRIMARY KEY auto_increment,
    TipoVacante NVARCHAR(25) NOT NULL
);

CREATE TABLE Vacante(
	CodVacante NVARCHAR(8) NOT NULL PRIMARY KEY,
	Codcargo NVARCHAR(8) NOT NULL,
    IdTipoVacante INT NOT NULL,
    Contratacion nvarchar(100) NOT NULL,
    Publicidad nvarchar(100) NOT NULL,
    Presupuesto REAL NOT null,
	FechaLimiteRecepcion DATE NOT NULL,
	FechaContratacion DATE NOT NULL,

	CodPublicidad nvarchar(8) NOT NULL,

	CONSTRAINT FK_CargoVacante FOREIGN KEY(Codcargo) REFERENCES Cargo(Codcargo),
    CONSTRAINT Cat_TipoVacanteVacante FOREIGN KEY(IdTipoVacante) REFERENCES Cat_TipoVacante(IdTipoVacante),
     CONSTRAINT fk_PubliVacante FOREIGN KEY(CodPublicidad) REFERENCES Cat_Publicidad(CodPublicidad)
);

CREATE TABLE Reclutamiento(
	IdReclutamiento INT NOT NULL PRIMARY KEY auto_increment,
	IdPersona INT NOT NULL,
	CodVacante NVARCHAR(8) NOT NULL,
	CurriculumRuta TEXT NOT NULL,
    FechaRecl DATE NOT NULL,

	CONSTRAINT FK_PersonaRecluta FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
	CONSTRAINT FK_VacanteRecluta FOREIGN KEY(CodVacante) REFERENCES Vacante(CodVacante)
);

CREATE TABLE DocumentosReclutamiento(
	IdReclutamiento INT NOT NULL,
	TituloDoc NVARCHAR(25) NOT NULL,
	DocRuta TEXT NOT NULL,

	CONSTRAINT FK_ReclutamientoDocs FOREIGN KEY(IdReclutamiento) REFERENCES Reclutamiento(IdReclutamiento)

);

-- Postulante user
CREATE TABLE UsuarioPostulante(
	IdUsuario INT NOT NULL primary KEY auto_increment,
    Usuario NVARCHAR(100) NOT NULL,
    HashPass TEXT NOT NULL,
    CorreoProp TEXT NOT NULL,
    
    -- foreign key
    IdPersona INT NOT NULL,
    constraint FK_Userper foreign key(IdPersona) references Persona(IdPersona)
);

CREATE TABLE EstadoPostulante(
	IdEstadoPostulante INT NOT NULL PRIMARY KEY auto_increment, -- 0 se rechaza
    TipoEstado NVARCHAR(25) NOT NULL
);

CREATE TABLE Postulantes(
	IdPostulante INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	DUI NVARCHAR(15) NOT NULL,
	Nombre1 NVARCHAR(25) NOT NULL,
    Nombre2 NVARCHAR(25) NOT NULL,
	Apellido1 NVARCHAR(25) NOT NULL,
    Apellido2 NVARCHAR(25) NOT NULL,
	FechaNac DATE NOT NULL,
    Genero BIT NOT NULL,
	NoDependientes INT NULL,
	TieneLicencia BIT NULL,
    Foto TEXT NULL,
    EstadoCivil BIT NOT NULL,

	codPais nvarchar(10) NOT NULL,
	IdEstadoCivil INT NOT NULL,

	
    IdUsuario INT NOT NULL,
    IdEstadoPostulante INT NOT NULL, -- Set automaticamente en 1
    Estado BIT NOT NULL, -- Set automaticamente en 1
    FechaSolicitud DATE NOT NULL,
    IdPersona INT NOT NULL,
    CodVacante NVARCHAR(8) NOT NULL,
    AspiracionSalarial REAL NOT NULL,
    GastoMensual REAL NOT NULL,
    MontoDeudas REAL NOT NULL,
	CV TEXT NOT NULL,
    RegistroCompleto BIT NULL, -- Set auto 1, validar para aplicar en vacante
    
	CONSTRAINT FK_PostulantePersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT PostulantesUsuarioPostulante FOREIGN KEY(IdUsuario) REFERENCES UsuarioPostulante(IdUsuario),
    CONSTRAINT PostulantesEstadoPostulante FOREIGN KEY(IdEstadoPostulante) REFERENCES EstadoPostulante(IdEstadoPostulante),
	CONSTRAINT FK_VacantePostulante FOREIGN KEY(CodVacante) REFERENCES Vacante(CodVacante),
    CONSTRAINT FK_PaisPersona FOREIGN KEY(codPais) REFERENCES PaisOrigen(codPais),
	CONSTRAINT FK_EstaCivilPers FOREIGN KEY(IdEstadoCivil) REFERENCES EstadoCivil(IdEstadoCivil)
);

CREATE TABLE Det_PersonaHorarioLaboral(
	IdPerHorLbDet INT NOT NULL PRIMARY KEY auto_increment,
    IdPersonaHorario INT NOT NULL,
    Estado BIT NOT NULL,
    
    CONSTRAINT Fk_Det_PersonaHorarioLaboralPersona FOREIGN KEY (IdPersonaHorario) REFERENCES Persona (IdPersonaHorario)
);

CREATE TABLE PersonaRedSocial(
	IdPersona INT NOT NULL,
    IdRedes INT NOT NULL,
    NombreUsuario NVARCHAR(25) NOT NULL,
    
    CONSTRAINT PersonaRedSocialPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT PersonaRedSocialCat_RedesSociales FOREIGN KEY(IdRedes) REFERENCES Cat_RedesSociales(IdRedes)
);

CREATE TABLE PaginaWeb(
	IdPersona INT NOT NULL,
    URL TEXT NOT NULL, 
    
    CONSTRAINT PaginaWebPersona FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona)
);

CREATE TABLE DireccionPostulante(
	IdPostulante INT NOT NULL, 
    Direccion NVARCHAR(100) NOT NULL,
    
    CONSTRAINT DireccionPersonaPersona FOREIGN KEY(IdPostulante) REFERENCES Postulante(IdPostulante)
);

CREATE TABLE CorreoPersona(
	IdPostulante INT NOT NULL,
    Correo NVARCHAR(100) NOT NULL,
    
    CONSTRAINT CorreoPersonaPersona FOREIGN KEY(IdPostulante) REFERENCES Postulante(IdPostulante)
);

CREATE TABLE PersonaIdioma(
	IdPostulantea INT NOT NULL,
    CodIdioma NVARCHAR(5) NOT NULL PRIMARY KEY,
    
    CONSTRAINT PersonaIdiomaPersona FOREIGN KEY(IdPostulante) REFERENCES Postulante(IdPostulante),
    CONSTRAINT IdiomaPersonaIdioma FOREIGN KEY(CodIdioma) REFERENCES Idiomas(CodIdioma)
);
CREATE TABLE Empleado(
DUI NVARCHAR(15) NOT NULL,
	Nombre1 NVARCHAR(25) NOT NULL,
    Nombre2 NVARCHAR(25) NOT NULL,
	Apellido1 NVARCHAR(25) NOT NULL,
    Apellido2 NVARCHAR(25) NOT NULL,
	FechaNac DATE NOT NULL,
    Genero BIT NOT NULL,
	NoDependientes INT NULL,
	TieneLicencia BIT NULL,
    Foto TEXT NULL,
    EstadoCivil BIT NOT NULL,

	codPais nvarchar(10) NOT NULL,
	IdEstadoCivil INT NOT NULL,
	CodEmpleado NVARCHAR(8) NOT NULL primary key,
    CodINSS NVARCHAR(15) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NOT NULL,
    AñosLaborando REAL NOT NULL,
    
    
	CodCargo NVARCHAR(8) NOT NULL,
	CodContrato NVARCHAR(8) NOT NULL,
    CONSTRAINT FK_PersonaEmpleado FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
    CONSTRAINT FK_CargoEmpleado FOREIGN KEY(CodCargo) REFERENCES Cargo(CodCargo)
);

Create table UsuarioEmpleado(
	idUsuarioEmp INT NOT NULL primary KEY auto_increment,
	Usuario NVARCHAR(100) NOT NULL,
    HashPass TEXT NOT NULL,
    CorreoInstitucional TEXT NOT NULL,
    
	CodEmpleado NVARCHAR(8) NOT NULL,
    CONSTRAINT FK_UsuarioEmpleado FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);

CREATE TABLE HistorialCargo(
	IdHistorialCargo INT NOT NULL auto_increment,
    Codcargo nvarchar(8) NOT NULL,
    CONSTRAINT FK_CargoHistorial FOREIGN KEY(CodCargo) REFERENCES Cargo(CodCargo)
);

CREATE TABLE ProcesoVacante(
	CodVacante NVARCHAR(8) NOT NULL,
    IdPostulante INT NOT NULL,
    CodEmpleado NVARCHAR(8) NULL,
    
    CONSTRAINT ProcesoVacanteVacante FOREIGN KEY(CodVacante) REFERENCES Vacante(CodVacante),
    CONSTRAINT ProcesoVacantePostulantes FOREIGN KEY(IdPostulante) REFERENCES Postulantes(IdPostulante),
    CONSTRAINT ProcesoVacanteEmpleado FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);

CREATE TABLE HistorialLaboral(
	CodEmpleado NVARCHAR(8) NOT NULL,
    Estado BIT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NOT NULL,
    Motivo TEXT NOT NULL,
    
    CONSTRAINT HistorialLaboralEmpleado FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);

CREATE TABLE CatSalario(
	IdCat_Salario INT NOT NULL PRIMARY KEY auto_increment,
    TipoSalario NVARCHAR(25) NOT NULL,
    Monto REAL NOT NULL,
    FechaRegistro date NOT NULL,
    Codcargo NVARCHAR(8) NOT NULL,
    FormadePago NVARCHAR(25) NOT NULL,
    
    CONSTRAINT fK_SalarioCargo foreign key(Codcargo) references Cargo(Codcargo)
);

CREATE TABLE RepresentacionLegal(
	IdRepresentante INT NOT NULL PRIMARY KEY auto_increment,
	Estado BIT NOT NULL,

	CodEmpleado NVARCHAR(8) NOT NULL,
	CONSTRAINT FK_EmpleadoRepresentante FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);

CREATE TABLE TipoContrato(
	CodTipoCont NVARCHAR(8) NOT NULL PRIMARY KEY,
    Tipo TEXT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NOT NULL,
    TipoJornada NVARCHAR(25) NOT NULL
);

CREATE TABLE Contrato(
	CodContrato NVARCHAR(12) NOT NULL PRIMARY KEY,
	NombreContrato NVARCHAR(20) NOT NULL,
    
	IdPersona INT NOT NULL,
	IdRepresentante INT NOT NULL,
	CodTipoCont NVARCHAR(8) NOT NULL,
    IdCat_Salario INT NOT NULL,
	CONSTRAINT FK_PersonaContrato FOREIGN KEY(IdPersona) REFERENCES Persona(IdPersona),
	CONSTRAINT FK_RepresentanteContrato FOREIGN KEY(IdRepresentante) REFERENCES RepresentacionLegal(IdRepresentante),
    CONSTRAINT FK_ContratoT FOREIGN KEY(CodTipoCont) REFERENCES TipoContrato(CodTipoCont),
    CONSTRAINT ContratoCatSalario FOREIGN KEY(IdCat_Salario) REFERENCES CatSalario(IdCat_Salario)
);

CREATE TABLE ClausulasContrato(
	CodContrato NVARCHAR(12) NOT NULL,
    NumClausula int not null,
	Clausula TEXT NOT NULL,

	CONSTRAINT FK_ContratoClausula FOREIGN KEY(CodContrato) REFERENCES Contrato(CodContrato)
);

-- Gestion de prestaciones y penalizacion
CREATE TABLE EntradaSalidas(
	Entradas DATETIME NOT NULL,
	Salidas DATETIME NOT NULL,
	Asistencias	BIT NOT NULL,

	-- foreign key
	CodEmpleado NVARCHAR(8) NOT NULL,
	CONSTRAINT FK_ESEmpleados FOREIGN KEY(CodEmpleado) REFERENCES Empleado(CodEmpleado)
);


-- Gestion de nomina

CREATE TABLE Cat_TipoNomina(
	IdTipoNomina INT auto_increment primary key  NOT NULL,
    TipoNomina nvarchar(50) NOT NULL,
    Estado BIT not null
);

CREATE TABLE Cat_comision(
	Id_comisiones INT auto_increment primary key NOT NULL,
    -- Es decimal para poner en lugar de 10% 0.1 :D por si preguntan por que decimal :D
    PorcentajeComision DECIMAL NOT NULL
);

CREATE TABLE TablaProgresiva(
	IdIr INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Tipo CHAR(1) NOT NULL, # A, B, C, D, E
    Desde REAL NOT NULL,
    Hasta REAL NOT NULL,
    ImpuestoBase INT NOT NULL,
    PorcentajeAplicable REAL NOT NULL,
    SobreExceso INT NOT NULL
    
);

CREATE TABLE Nomina(
	IdNomina INT auto_increment primary key NOT NULL,
    InicioPeriodo DATE NOT NULL,
    FinalPeriodo DATE NOT NULL,
    AprobadoPor nvarchar(30) NULL,
    ElaboradoPor nvarchar(30) NULL,
    TotalIR REAL NULL,
    TotalINSSPatronal REAL NULL,
    TotalINSSPersonal REAL NULL,
    
    
	IdTipoNomina INT NOT NULL,
    constraint Fk_NominaTipo FOREIGN KEY(IdTipoNomina) references Cat_TipoNomina(IdTipoNomina)
);

CREATE TABLE Det_Nomina(
	
    DiasLaborados DOUBLE NOT NULL,
    HorasExtras DOUBLE NOT NULL,
    -- TotalHPagadas REAL NOT NULL,
	SalarioPorHora REAL NOT NULL,
    SalarioBruto REAL NOT NULL,
    INSS REAL NOT NULL,
	IRDeducido REAL NOT NULL,
    
    DeduccionSalud DECIMAL NOT NULL,
    FechaPago Datetime NOT NULL,
    FechaInicialPago Datetime NOT NULL,
    FechaFinalPago Datetime NOT NULL,
    
    
    -- Foreing key
	IdNomina INT NOT NULL,
    CodEmpleado NVARCHAR(8) NOT NULL,
    IdCat_Salario INT NOT NULL,
    Id_Comisiones INT NULL,
    IdIr INT NOT NULL,
	
    CONSTRAINT FK_NominaDetalle FOREIGN KEY(IdNomina) REFERENCES Nomina(IdNomina),
    constraint Fk_EmpleadoNomina FOREIGN KEY(CodEmpleado) references Empleado (CodEmpleado),
    constraint Fk_SalarioNomina FOREIGN KEY(IdCat_Salario) references CatSalario (IdCat_Salario),
    constraint Fk_ComisionesNomina FOREIGN KEY(Id_Comisiones) references Cat_comision (Id_comisiones),
    CONSTRAINT FK_IrDetalle FOREIGN KEY(IdIr) REFERENCES TablaProgresiva(IdIr)
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


-- SEGURIDAD :DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
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

Create table Permisos(
	IdPermisos INT primary key NOT NULL auto_increment,
	Nombre nvarchar(50) NOT NULL,
    Estado BIT NOT NULL,
    
    IdRol INT NOT NULL,
    CONSTRAINT FK_PermisoRol FOREIGN KEY(IdRol) REFERENCES Cat_Rols(IdRol)
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
    Fecha datetime NOT NULL,
    
    IdIntentosSession INT NOT NULL,
    CONSTRAINT FK_CatFehaInisioSess FOREIGN KEY(IdIntentosSession) REFERENCES intentosSession(IdIntentosSession)
);

Create table Conexiones(
	idConecInte int NOT NULL primary KEY auto_increment,
    idUsuarioEmp INT NOT NULL,
    SessionOpen datetime NOT NULL,
    SessionClose datetime NOT NULL, 
    
     CONSTRAINT FK_IntentosUsuario FOREIGN KEY(idUsuarioEmp) REFERENCES UsuarioEmpleado(idUsuarioEmp)
);

Create table Bitacora(
	CODIGO_AU nvarchar(8) NOT NULL PRIMARY KEY auto_increment,
	CodUSUARIO_AU VARCHAR(20) NOT NULL,
	TABLA VARCHAR(20) NOT NULL,
	ACCION VARCHAR(20) NOT NULL,
	DESCRIPCION VARCHAR(500),
	FECHA_HORA DATETIME NOT NULL,
    
    CONSTRAINT FK_UserAuditoria FOREIGN KEY(CodUSUARIO_AU) REFERENCES UsuarioEmpleado(idUsuarioEmp)
);
