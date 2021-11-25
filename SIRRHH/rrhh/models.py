# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.utils.translation import ugettext as _


class Adelantosalario(models.Model):
    idadelanto = models.AutoField(db_column='IdAdelanto', primary_key=True)  # Field name made lowercase.
    monto = models.FloatField(db_column='Monto')  # Field name made lowercase.
    dia = models.DateTimeField(db_column='Dia')  # Field name made lowercase.
    aprobadopor = models.CharField(db_column='AprobadoPor', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    conceptode = models.TextField(db_column='ConceptoDe')  # Field name made lowercase.
    estado = models.TextField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    codempleado = models.ForeignKey('Empleado', models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.
    idperiodolaboral = models.ForeignKey('Periodolaboral', models.DO_NOTHING, db_column='IdPeriodoLaboral')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'adelantosalario'


class Areaempresa(models.Model):
    codarea = models.CharField(db_column='CodArea', primary_key=True, max_length=8, db_collation='utf8_general_ci')  # Field name made lowercase.
    nombrearea = models.CharField(db_column='NombreArea', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    nivelarea = models.IntegerField(db_column='NivelArea')  # Field name made lowercase.
    areasuperior = models.IntegerField(db_column='AreaSuperior')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'areaempresa'
        
    def __str__(self):
        return f"{self.codarea} - {self.nombrearea}"


class Bitacora(models.Model):
    codigo_au = models.AutoField(db_column='CODIGO_AU', primary_key=True)  # Field name made lowercase.
    codusuario_au = models.CharField(db_column='CodUSUARIO_AU', max_length=20)  # Field name made lowercase.
    tabla = models.CharField(db_column='TABLA', max_length=20)  # Field name made lowercase.
    accion = models.CharField(db_column='ACCION', max_length=20)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=500, blank=True, null=True)  # Field name made lowercase.
    fecha_hora = models.DateTimeField(db_column='FECHA_HORA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'bitacora'


class Campoinstrumento(models.Model):
    idcampoinstrumento = models.AutoField(db_column='IdCampoInstrumento', primary_key=True)  # Field name made lowercase.
    descripcion = models.TextField(db_column='Descripcion')  # Field name made lowercase.
    porcentaje = models.FloatField(db_column='Porcentaje', blank=True, null=True)  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    idinstrumento = models.ForeignKey('Instrumento', models.DO_NOTHING, db_column='IdInstrumento')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'campoinstrumento'


class Cargo(models.Model):
    codcargo = models.CharField(db_column='Codcargo', primary_key=True, max_length=8, db_collation='utf8_general_ci')  # Field name made lowercase.
    codarea = models.ForeignKey(Areaempresa, models.DO_NOTHING, db_column='CodArea')  # Field name made lowercase.
    nombrecargo = models.CharField(db_column='NombreCargo', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'cargo'
        
    def __str__(self):
        return f"{self.codcargo} - {self.nombrecargo}"


class Cargosalario(models.Model):
    idcargosalario = models.AutoField(db_column='IdCargoSalario', primary_key=True)  # Field name made lowercase.
    salario = models.FloatField(db_column='Salario')  # Field name made lowercase.
    aprobadopor = models.CharField(db_column='AprobadoPor', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    fechaaprobacion = models.DateField(db_column='FechaAprobacion')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    codcargo = models.ForeignKey(Cargo, models.DO_NOTHING, db_column='CodCargo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cargosalario'


class Casadeestudio(models.Model):
    idcasaestudio = models.AutoField(db_column='IdCasaEstudio', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    fechafund = models.DateField(db_column='FechaFund')  # Field name made lowercase.
    codpais = models.ForeignKey('Paisorigen', models.DO_NOTHING, db_column='codPais')  # Field name made lowercase.
    nombrecorto = models.CharField(db_column='NombreCorto', max_length=10, db_collation='utf8_general_ci')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=250, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'casadeestudio'


class CatFechasession(models.Model):
    idcat_fecho = models.AutoField(db_column='idCat_Fecho', primary_key=True)  # Field name made lowercase.
    fecha = models.DateTimeField(db_column='Fecha')  # Field name made lowercase.
    idintentossession = models.ForeignKey('Intentossession', models.DO_NOTHING, db_column='IdIntentosSession')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cat_fechasession'


class CatFunciones(models.Model):
    idfuncion = models.AutoField(db_column='IdFuncion', primary_key=True)  # Field name made lowercase.
    idtipofuncion = models.ForeignKey('Tipofuncion', models.DO_NOTHING, db_column='IdTipoFuncion')  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    descripcion = models.TextField(db_column='Descripcion')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'cat_funciones'
        
    def __str__(self):
        return f"{self.descripcion}"


class CatHabilidades(models.Model):
    idhabilidades = models.AutoField(db_column='IdHabilidades', primary_key=True)  # Field name made lowercase.
    nombrehabilidad = models.CharField(db_column='NombreHabilidad', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cat_habilidades'
        
    def __str__(self):
        return f"{self.nombrehabilidad}"


class CatPadecimientos(models.Model):
    codenfermedad = models.CharField(db_column='CodEnfermedad', primary_key=True, max_length=8, db_collation='utf8_general_ci')  # Field name made lowercase.
    nombrepadecimiento = models.CharField(db_column='NombrePadecimiento', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    descripcion = models.TextField(db_column='Descripcion')  # Field name made lowercase.
    fechaingreso = models.DateTimeField(db_column='FechaIngreso')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    codtipopadecimiento = models.ForeignKey('CatTipopadecimiento', models.DO_NOTHING, db_column='CodTipoPadecimiento')  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cat_padecimientos'


class CatPublicidad(models.Model):
    idpublicidad = models.AutoField(db_column='IdPublicidad', primary_key=True)  # Field name made lowercase.
    nombrepublicidad = models.CharField(db_column='NombrePublicidad', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    abreviacion = models.CharField(db_column='Abreviacion', max_length=5, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cat_publicidad'
        
    def __str__(self):
        return f"{self.nombrepublicidad}"


class CatRedessociales(models.Model):
    idredes = models.AutoField(db_column='IdRedes', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'cat_redessociales'
        
    def __str__(self):
        return f"{self.nombre}"


class CatRequerimientos(models.Model):
    idrequerimiento = models.AutoField(db_column='IdRequerimiento', primary_key=True)  # Field name made lowercase.
    idrequisito = models.ForeignKey('Tiporequisito', models.DO_NOTHING, db_column='IdRequisito')  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'cat_requerimientos'


class CatRols(models.Model):
    idrol = models.AutoField(db_column='IdRol', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=50, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'cat_rols'
        permissions=(
            ('ResponsableDivisióndeRecursosHumanos' ,_('Responsable División de Recursos Humanos')),
            ('movimientoPersonal', _('Responsable Oficina de Desarrollo')),
            ('recursosLaborales', _('Analista de Recursos Laborales')),
            ('responsableNomina', _('Responsable Oficina de Nómina')),
            ('evaluacionDesempeño', _('Responsable de Relaciones Laborales'))
        )
    def __str__(self):
        return f"{self.nombre}"

class CatTipoestudio(models.Model):
    idtipoestudio = models.AutoField(db_column='IdTipoEstudio', primary_key=True)  # Field name made lowercase.
    nombretipo = models.CharField(db_column='NombreTipo', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'cat_tipoestudio'


class CatTiponomina(models.Model):
    idtiponomina = models.AutoField(db_column='IdTipoNomina', primary_key=True)  # Field name made lowercase.
    tiponomina = models.CharField(db_column='TipoNomina', max_length=50, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'cat_tiponomina'


class CatTipopadecimiento(models.Model):
    codtipopadecimiento = models.CharField(db_column='CodTipoPadecimiento', primary_key=True, max_length=8, db_collation='utf8_general_ci')  # Field name made lowercase.
    nombretipopadecimiento = models.CharField(db_column='NombreTipoPadecimiento', max_length=50, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cat_tipopadecimiento'


class CatTipovacante(models.Model):
    idtipovacante = models.AutoField(db_column='IdTipoVacante', primary_key=True)  # Field name made lowercase.
    tipovacante = models.CharField(db_column='TipoVacante', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cat_tipovacante'
        
    def __str__(self):
        return f"{self.tipovacante}"

class Catciudad(models.Model):
    idciudad = models.IntegerField(db_column='IdCiudad', primary_key=True)  # Field name made lowercase.
    nombreciudad = models.CharField(db_column='NombreCiudad', max_length=100, db_collation='utf8_general_ci')  # Field name made lowercase.
    codpais = models.ForeignKey('Paisorigen', models.DO_NOTHING, db_column='CodPais')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'catciudad'


class Catclausulas(models.Model):
    idcatclausula = models.AutoField(db_column='IdCatClausula', primary_key=True)  # Field name made lowercase.
    numclausula = models.IntegerField(db_column='NumClausula')  # Field name made lowercase.
    clausula = models.TextField(db_column='Clausula')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'catclausulas'


class Catprueba(models.Model):
    codprueba = models.CharField(db_column='CodPrueba', primary_key=True, max_length=8, db_collation='utf8_general_ci')  # Field name made lowercase.
    codcargo = models.ForeignKey(Cargo, models.DO_NOTHING, db_column='CodCargo')  # Field name made lowercase.
    codarea = models.ForeignKey(Areaempresa, models.DO_NOTHING, db_column='CodArea')  # Field name made lowercase.
    tituloprueba = models.CharField(db_column='TituloPrueba', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    fechaemision = models.DateField(db_column='FechaEmision')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'catprueba'


class Clausulacontrato(models.Model):
    idclausulacontrato = models.AutoField(db_column='IdClausulaContrato', primary_key=True)  # Field name made lowercase.
    idcatclausula = models.ForeignKey(Catclausulas, models.DO_NOTHING, db_column='IdCatClausula')  # Field name made lowercase.
    codcontrato = models.ForeignKey('Contrato', models.DO_NOTHING, db_column='CodContrato')  # Field name made lowercase.
    fecha = models.DateTimeField(db_column='Fecha')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'clausulacontrato'


class Companiatelefonica(models.Model):
    codcompania = models.CharField(db_column='CodCompania', primary_key=True, max_length=10, db_collation='utf8_general_ci')  # Field name made lowercase.
    nombrecompania = models.CharField(db_column='NombreCompania', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'companiatelefonica'
    
    def __str__(self):
        return f"{self.nombrecompania}"

class Conexiones(models.Model):
    idconecinte = models.AutoField(db_column='idConecInte', primary_key=True)  # Field name made lowercase.
    idusuarioemp = models.ForeignKey('Usuarioempleado', models.DO_NOTHING, db_column='idUsuarioEmp')  # Field name made lowercase.
    sessionopen = models.DateTimeField(db_column='SessionOpen')  # Field name made lowercase.
    sessionclose = models.DateTimeField(db_column='SessionClose')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'conexiones'


class Contrato(models.Model):
    codcontrato = models.CharField(db_column='CodContrato', primary_key=True, max_length=12, db_collation='utf8_general_ci')  # Field name made lowercase.
    nombrecontrato = models.CharField(db_column='NombreContrato', max_length=20, db_collation='utf8_general_ci')  # Field name made lowercase.
    idrepresentante = models.ForeignKey('Representacionlegal', models.DO_NOTHING, db_column='IdRepresentante')  # Field name made lowercase.
    codtipocont = models.ForeignKey('Tipocontrato', models.DO_NOTHING, db_column='CodTipoCont')  # Field name made lowercase.
    codempleado = models.ForeignKey('Empleado', models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'contrato'


class Correopersona(models.Model):
    idcorreopersonal = models.AutoField(db_column='IdCorreoPersonal', primary_key=True)  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    correo = models.CharField(db_column='Correo', max_length=100, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'correopersona'


class Dependientes(models.Model):
    idfamiliar = models.AutoField(db_column='IdFamiliar', primary_key=True)  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    codempleado = models.ForeignKey('Empleado', models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.
    difunto = models.TextField(db_column='Difunto')  # Field name made lowercase. This field type is a guess.
    esbeneficiario = models.TextField(db_column='EsBeneficiario')  # Field name made lowercase. This field type is a guess.
    porcentaje = models.FloatField(db_column='Porcentaje')  # Field name made lowercase.
    idparentesco = models.ForeignKey('Parentesco', models.DO_NOTHING, db_column='IdParentesco')  # Field name made lowercase.
    iddescripcion = models.ForeignKey('Descripcionparentesco', models.DO_NOTHING, db_column='IdDescripcion')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'dependientes'


class Descripcionparentesco(models.Model):
    iddescripcion = models.AutoField(db_column='IdDescripcion', primary_key=True)  # Field name made lowercase.
    tituloparentesco = models.CharField(db_column='TituloParentesco', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    detalle = models.TextField(db_column='Detalle')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'descripcionparentesco'


class DetNomina(models.Model):
    fechapago = models.DateTimeField(db_column='FechaPago')  # Field name made lowercase.
    diaslaborados = models.FloatField(db_column='DiasLaborados')  # Field name made lowercase.
    salarioporhora = models.FloatField(db_column='SalarioPorHora')  # Field name made lowercase.
    deduccionpermiso = models.FloatField(db_column='DeduccionPermiso')  # Field name made lowercase.
    septimo = models.FloatField(db_column='Septimo')  # Field name made lowercase.
    vacacionespagadasq = models.IntegerField(db_column='VacacionesPagadasQ')  # Field name made lowercase.
    vacacionespagadasr = models.FloatField(db_column='VacacionesPagadasR')  # Field name made lowercase.
    llegadastardiasq = models.IntegerField(db_column='LlegadasTardiasQ')  # Field name made lowercase.
    llegadastardiasr = models.FloatField(db_column='LlegadasTardiasR')  # Field name made lowercase.
    anticiposq = models.IntegerField(db_column='AnticiposQ')  # Field name made lowercase.
    anticiposr = models.FloatField(db_column='AnticiposR')  # Field name made lowercase.
    horasextraq = models.IntegerField(db_column='HorasExtraQ')  # Field name made lowercase.
    horasextrasr = models.FloatField(db_column='HorasExtrasR')  # Field name made lowercase.
    incentivor = models.FloatField(db_column='IncentivoR')  # Field name made lowercase.
    salariobruto = models.FloatField(db_column='SalarioBruto')  # Field name made lowercase.
    insslaboral = models.FloatField(db_column='INSSLaboral')  # Field name made lowercase.
    irdeducido = models.FloatField(db_column='IRDeducido')  # Field name made lowercase.
    insspatronal = models.FloatField(db_column='INSSPatronal')  # Field name made lowercase.
    inatec = models.FloatField(db_column='Inatec')  # Field name made lowercase.
    antiguedades = models.FloatField(db_column='Antiguedades')  # Field name made lowercase.
    salarioneto = models.FloatField(db_column='SalarioNeto')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    idnomina = models.ForeignKey('Nomina', models.DO_NOTHING, db_column='IdNomina')  # Field name made lowercase.
    codempleado = models.ForeignKey('Empleado', models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.
    codir = models.ForeignKey('Tablaprogresiva', models.DO_NOTHING, db_column='CodIr')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'det_nomina'


class Detalletablaprogresiva(models.Model):
    iddetalleir = models.AutoField(db_column='IdDetalleIr', primary_key=True)  # Field name made lowercase.
    tipo = models.CharField(db_column='Tipo', max_length=1)  # Field name made lowercase.
    desde = models.FloatField(db_column='Desde')  # Field name made lowercase.
    hasta = models.FloatField(db_column='Hasta')  # Field name made lowercase.
    impuestobase = models.IntegerField(db_column='ImpuestoBase')  # Field name made lowercase.
    porcentajeaplicable = models.FloatField(db_column='PorcentajeAplicable')  # Field name made lowercase.
    sobreexceso = models.IntegerField(db_column='SobreExceso')  # Field name made lowercase.
    codir = models.ForeignKey('Tablaprogresiva', models.DO_NOTHING, db_column='CodIr')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'detalletablaprogresiva'


class Direccionpersona(models.Model):
    iddireccionpersona = models.AutoField(db_column='IdDireccionPersona', primary_key=True)  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    direccion = models.CharField(db_column='Direccion', max_length=100, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'direccionpersona'


class Empleado(models.Model):
    codempleado = models.CharField(db_column='CodEmpleado', primary_key=True, max_length=8, db_collation='utf8_general_ci')  # Field name made lowercase.
    codinss = models.CharField(db_column='CodINSS', max_length=15, db_collation='utf8_general_ci')  # Field name made lowercase.
    fechainicio = models.DateField(db_column='FechaInicio')  # Field name made lowercase.
    fechafinal = models.DateField(db_column='FechaFinal')  # Field name made lowercase.
    anoslaborando = models.FloatField(db_column='AnosLaborando')  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    codcargo = models.ForeignKey(Cargo, models.DO_NOTHING, db_column='CodCargo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'empleado'
    
    def __str__(self):
        return f"{self.codcargo} - {self.codempleado} - {self.idpersona.nombre1} "


class Empleadoformato(models.Model):
    idempleadoprueba = models.ForeignKey('Empleadoprueba', models.DO_NOTHING, db_column='IdEmpleadoPrueba')  # Field name made lowercase.
    respuesta = models.CharField(db_column='Respuesta', max_length=250, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'empleadoformato'


class Empleadoprueba(models.Model):
    idempleadoprueba = models.AutoField(db_column='IdEmpleadoPrueba', primary_key=True)  # Field name made lowercase.
    codprueba = models.ForeignKey(Catprueba, models.DO_NOTHING, db_column='CodPrueba')  # Field name made lowercase.
    codempleado = models.CharField(db_column='CodEmpleado', max_length=15, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'empleadoprueba'


class Entradasalidas(models.Model):
    horaentradas = models.DateTimeField(db_column='HoraEntradas')  # Field name made lowercase.
    horasalidas = models.DateTimeField(db_column='HoraSalidas')  # Field name made lowercase.
    dia = models.DateField(db_column='Dia')  # Field name made lowercase.
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'entradasalidas'


class Entrevista1(models.Model):
    identrevista = models.AutoField(db_column='IdEntrevista', primary_key=True)  # Field name made lowercase.
    fecharevision = models.DateField(db_column='FechaRevision')  # Field name made lowercase.
    pasa = models.TextField(db_column='Pasa')  # Field name made lowercase. This field type is a guess.
    personaencargada = models.CharField(db_column='PersonaEncargada', max_length=35, db_collation='utf8_general_ci')  # Field name made lowercase.
    idpostulante = models.ForeignKey('Postulantes', models.DO_NOTHING, db_column='IdPostulante')  # Field name made lowercase.
    codvacante = models.ForeignKey('Vacante', models.DO_NOTHING, db_column='CodVacante')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'entrevista1'


class Entrevista2(models.Model):
    identrevista2 = models.AutoField(db_column='IdEntrevista2', primary_key=True)  # Field name made lowercase.
    fecharevision = models.DateField(db_column='FechaRevision')  # Field name made lowercase.
    pasa = models.TextField(db_column='Pasa')  # Field name made lowercase. This field type is a guess.
    personaencargada = models.CharField(db_column='PersonaEncargada', max_length=35, db_collation='utf8_general_ci')  # Field name made lowercase.
    idpostulante = models.ForeignKey('Postulantes', models.DO_NOTHING, db_column='IdPostulante')  # Field name made lowercase.
    codvacante = models.ForeignKey('Vacante', models.DO_NOTHING, db_column='CodVacante')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'entrevista2'


class Estadocivil(models.Model):
    idestadocivil = models.AutoField(db_column='IdEstadoCivil', primary_key=True)  # Field name made lowercase.
    titulo = models.CharField(db_column='Titulo', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    abreviacion = models.CharField(db_column='Abreviacion', max_length=5, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'estadocivil'


class Estadopostulante(models.Model):
    idestadopostulante = models.AutoField(db_column='IdEstadoPostulante', primary_key=True)  # Field name made lowercase.
    tipoestado = models.CharField(db_column='TipoEstado', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'estadopostulante'


class Estudiopersona(models.Model):
    idestudio = models.AutoField(db_column='IdEstudio', primary_key=True)  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    idtipoestudio = models.ForeignKey(CatTipoestudio, models.DO_NOTHING, db_column='IdTipoEstudio')  # Field name made lowercase.
    idcasaestudio = models.ForeignKey(Casadeestudio, models.DO_NOTHING, db_column='IdCasaEstudio')  # Field name made lowercase.
    idtitulo = models.ForeignKey('Titulos', models.DO_NOTHING, db_column='IdTitulo', blank=True, null=True)  # Field name made lowercase.
    fechainicio = models.DateField(db_column='FechaInicio')  # Field name made lowercase.
    fechafin = models.DateField(db_column='Fechafin')  # Field name made lowercase.
    codpais = models.ForeignKey('Paisorigen', models.DO_NOTHING, db_column='codPais')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'estudiopersona'


class Examenes(models.Model):
    idexamen = models.AutoField(db_column='IdExamen', primary_key=True)  # Field name made lowercase.
    nombreexamen = models.CharField(db_column='NombreExamen', max_length=30, db_collation='utf8_general_ci', blank=True, null=True)  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'examenes'


class Examenpostulante(models.Model):
    idexamenpostulante = models.AutoField(db_column='IdExamenPostulante', primary_key=True)  # Field name made lowercase.
    idexamen = models.ForeignKey(Examenes, models.DO_NOTHING, db_column='IdExamen')  # Field name made lowercase.
    idpostulante = models.ForeignKey('Postulantes', models.DO_NOTHING, db_column='IdPostulante')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'examenpostulante'


class Formatoprueba(models.Model):
    codprueba = models.ForeignKey(Catprueba, models.DO_NOTHING, db_column='CodPrueba')  # Field name made lowercase.
    pregunta = models.CharField(db_column='Pregunta', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'formatoprueba'


class Funcionescargo(models.Model):
    idfuncioncargo = models.AutoField(db_column='IdFuncionCargo', primary_key=True)  # Field name made lowercase.
    codcargo = models.ForeignKey(Cargo, models.DO_NOTHING, db_column='Codcargo')  # Field name made lowercase.
    idfuncion = models.ForeignKey(CatFunciones, models.DO_NOTHING, db_column='IdFuncion')  # Field name made lowercase.
    estado = models.TextField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'funcionescargo'


class Habilidadesempleados(models.Model):
    idhabilidadempleado = models.AutoField(db_column='IdHabilidadEmpleado', primary_key=True)  # Field name made lowercase.
    porcentajedominio = models.FloatField(db_column='PorcentajeDominio')  # Field name made lowercase.
    idhabilidades = models.ForeignKey(CatHabilidades, models.DO_NOTHING, db_column='IdHabilidades')  # Field name made lowercase.
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'habilidadesempleados'


class Historialcargo(models.Model):
    idhistorialcargo = models.AutoField(db_column='IdHistorialCargo', primary_key=True)  # Field name made lowercase.
    codcargo = models.ForeignKey(Cargo, models.DO_NOTHING, db_column='Codcargo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'historialcargo'


class Historiallaboral(models.Model):
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.
    estado = models.TextField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    fechainicio = models.DateField(db_column='FechaInicio')  # Field name made lowercase.
    fechafinal = models.DateField(db_column='FechaFinal')  # Field name made lowercase.
    motivo = models.TextField(db_column='Motivo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'historiallaboral'


class Horariolaboral(models.Model):
    idhorariolaboral = models.AutoField(db_column='IdHorarioLaboral', primary_key=True)  # Field name made lowercase.
    horaentrada = models.DateTimeField(db_column='HoraEntrada')  # Field name made lowercase.
    horasalida = models.DateTimeField(db_column='HoraSalida')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'horariolaboral'


class Horasextra(models.Model):
    idhorasextra = models.AutoField(db_column='IdHorasExtra', primary_key=True)  # Field name made lowercase.
    cantidadhora = models.FloatField(db_column='CantidadHora')  # Field name made lowercase.
    pagado = models.FloatField(db_column='Pagado')  # Field name made lowercase.
    dia = models.DateTimeField(db_column='Dia')  # Field name made lowercase.
    agregadopor = models.CharField(db_column='AgregadoPor', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    detalle = models.TextField(db_column='Detalle')  # Field name made lowercase.
    justificado = models.TextField(db_column='Justificado')  # Field name made lowercase. This field type is a guess.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.
    idperiodolaboral = models.ForeignKey('Periodolaboral', models.DO_NOTHING, db_column='IdPeriodoLaboral')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'horasextra'


class Idiomas(models.Model):
    codidioma = models.CharField(db_column='CodIdioma', primary_key=True, max_length=5, db_collation='utf8_general_ci')  # Field name made lowercase.
    nombreidioma = models.CharField(db_column='NombreIdioma', max_length=15, db_collation='utf8_general_ci')  # Field name made lowercase.
    abreviacion = models.CharField(db_column='Abreviacion', max_length=5, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'idiomas'


class Incentivos(models.Model):
    idincentivo = models.AutoField(db_column='IdIncentivo', primary_key=True)  # Field name made lowercase.
    pagado = models.FloatField(db_column='Pagado')  # Field name made lowercase.
    dia = models.DateTimeField(db_column='Dia')  # Field name made lowercase.
    agregadopor = models.CharField(db_column='AgregadoPor', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    conceptode = models.TextField(db_column='ConceptoDe')  # Field name made lowercase.
    justificado = models.TextField(db_column='Justificado')  # Field name made lowercase. This field type is a guess.
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.
    idperiodolaboral = models.ForeignKey('Periodolaboral', models.DO_NOTHING, db_column='IdPeriodoLaboral')  # Field name made lowercase.
    idtipoincentivo = models.ForeignKey('Tipoincentivo', models.DO_NOTHING, db_column='IdTipoIncentivo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'incentivos'


class Instrumento(models.Model):
    idinstrumento = models.AutoField(db_column='IdInstrumento', primary_key=True)  # Field name made lowercase.
    nombreinstrumento = models.CharField(db_column='NombreInstrumento', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'instrumento'


class Intentossession(models.Model):
    idintentossession = models.AutoField(db_column='IdIntentosSession', primary_key=True)  # Field name made lowercase.
    numerointentos = models.IntegerField(db_column='NumeroIntentos')  # Field name made lowercase.
    dispositivo = models.CharField(db_column='Dispositivo', max_length=15, db_collation='utf8_general_ci')  # Field name made lowercase.
    idusuarioemp = models.ForeignKey('Usuarioempleado', models.DO_NOTHING, db_column='idUsuarioEmp')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'intentossession'


class Licencia(models.Model):
    idlicencia = models.AutoField(db_column='IdLicencia', primary_key=True)  # Field name made lowercase.
    categorialicencia = models.CharField(db_column='CategoriaLicencia', max_length=20, db_collation='utf8_general_ci')  # Field name made lowercase.
    abreviacion = models.CharField(db_column='Abreviacion', max_length=5, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'licencia'


class Llegadastardias(models.Model):
    idllegadatarde = models.AutoField(db_column='IdLlegadaTarde', primary_key=True)  # Field name made lowercase.
    cantidadhora = models.FloatField(db_column='CantidadHora')  # Field name made lowercase.
    deducido = models.FloatField(db_column='Deducido')  # Field name made lowercase.
    dia = models.DateTimeField(db_column='Dia')  # Field name made lowercase.
    agregadopor = models.CharField(db_column='AgregadoPor', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    detalle = models.TextField(db_column='Detalle')  # Field name made lowercase.
    justificado = models.TextField(db_column='Justificado')  # Field name made lowercase. This field type is a guess.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.
    idperiodolaboral = models.ForeignKey('Periodolaboral', models.DO_NOTHING, db_column='IdPeriodoLaboral')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'llegadastardias'


class Nomina(models.Model):
    idnomina = models.AutoField(db_column='IdNomina', primary_key=True)  # Field name made lowercase.
    inicioperiodo = models.DateField(db_column='InicioPeriodo')  # Field name made lowercase.
    finalperiodo = models.DateField(db_column='FinalPeriodo')  # Field name made lowercase.
    aprobadopor = models.CharField(db_column='AprobadoPor', max_length=30, db_collation='utf8_general_ci', blank=True, null=True)  # Field name made lowercase.
    elaboradopor = models.CharField(db_column='ElaboradoPor', max_length=30, db_collation='utf8_general_ci', blank=True, null=True)  # Field name made lowercase.
    totalir = models.FloatField(db_column='TotalIR', blank=True, null=True)  # Field name made lowercase.
    totalinatec = models.FloatField(db_column='TotalInatec', blank=True, null=True)  # Field name made lowercase.
    totalinsspatronal = models.FloatField(db_column='TotalINSSPatronal', blank=True, null=True)  # Field name made lowercase.
    totalinsspersonal = models.FloatField(db_column='TotalINSSPersonal', blank=True, null=True)  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    idperiodolaboral = models.ForeignKey('Periodolaboral', models.DO_NOTHING, db_column='IdPeriodoLaboral')  # Field name made lowercase.
    idtiponomina = models.ForeignKey(CatTiponomina, models.DO_NOTHING, db_column='IdTipoNomina')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nomina'


class Numtelefono(models.Model):
    notelefono = models.CharField(db_column='NoTelefono', max_length=20, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    codpais = models.ForeignKey('Paisorigen', models.DO_NOTHING, db_column='codPais')  # Field name made lowercase.
    codcompania = models.ForeignKey(Companiatelefonica, models.DO_NOTHING, db_column='CodCompania')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'numtelefono'


class Paginaweb(models.Model):
    idpaginaweb = models.AutoField(db_column='IdPaginaWeb', primary_key=True)  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    url = models.TextField(db_column='URL')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    descripcion = models.TextField(db_column='Descripcion')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'paginaweb'


class Paisorigen(models.Model):
    codpais = models.CharField(db_column='codPais', primary_key=True, max_length=10, db_collation='utf8_general_ci')  # Field name made lowercase.
    iso2 = models.CharField(max_length=2, blank=True, null=True)
    iso3 = models.CharField(max_length=4, blank=True, null=True)
    nombrepais = models.CharField(db_column='NombrePais', max_length=20, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'paisorigen'


class Parentesco(models.Model):
    idparentesco = models.AutoField(db_column='IdParentesco', primary_key=True)  # Field name made lowercase.
    nombreparentesco = models.CharField(db_column='NombreParentesco', max_length=30, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'parentesco'


class Periodolaboral(models.Model):
    idperiodolaboral = models.AutoField(db_column='IdPeriodoLaboral', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=100, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'periodolaboral'


class Permisos(models.Model):
    idpermisos = models.AutoField(db_column='IdPermisos', primary_key=True)  # Field name made lowercase.
    cantidadhora = models.FloatField(db_column='CantidadHora')  # Field name made lowercase.
    deducido = models.FloatField(db_column='Deducido')  # Field name made lowercase.
    dia = models.DateTimeField(db_column='Dia')  # Field name made lowercase.
    agregadopor = models.CharField(db_column='AgregadoPor', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    detalle = models.TextField(db_column='Detalle')  # Field name made lowercase.
    justificado = models.TextField(db_column='Justificado')  # Field name made lowercase. This field type is a guess.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.
    idperiodolaboral = models.ForeignKey(Periodolaboral, models.DO_NOTHING, db_column='IdPeriodoLaboral')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'permisos'


class Permisossecurity(models.Model):
    idpermisos = models.AutoField(db_column='IdPermisos', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=50, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    idrol = models.ForeignKey(CatRols, models.DO_NOTHING, db_column='IdRol')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'permisossecurity'


class Persona(models.Model):
    idpersona = models.AutoField(db_column='IdPersona', primary_key=True)  # Field name made lowercase.
    dui = models.CharField(db_column='DUI', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    nombre1 = models.CharField(db_column='Nombre1', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    nombre2 = models.CharField(db_column='Nombre2', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    apellido1 = models.CharField(db_column='Apellido1', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    apellido2 = models.CharField(db_column='Apellido2', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    fechanac = models.DateField(db_column='FechaNac')  # Field name made lowercase.
    genero = models.TextField(db_column='Genero')  # Field name made lowercase. This field type is a guess.
    nodependientes = models.IntegerField(db_column='NoDependientes', blank=True, null=True)  # Field name made lowercase.
    foto = models.TextField(db_column='Foto', blank=True, null=True)  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    codpais = models.ForeignKey(Paisorigen, models.DO_NOTHING, db_column='codPais')  # Field name made lowercase.
    idestadocivil = models.ForeignKey(Estadocivil, models.DO_NOTHING, db_column='IdEstadoCivil')  # Field name made lowercase.
    idlicencia = models.ForeignKey(Licencia, models.DO_NOTHING, db_column='IdLicencia')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'persona'


class Personaidioma(models.Model):
    idpersonaidioma = models.AutoField(db_column='IdPersonaIdioma', primary_key=True)  # Field name made lowercase.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    codidioma = models.ForeignKey(Idiomas, models.DO_NOTHING, db_column='CodIdioma')  # Field name made lowercase.
    porcentajehablado = models.FloatField(db_column='PorcentajeHablado')  # Field name made lowercase.
    porcentajeescrito = models.FloatField(db_column='PorcentajeEscrito')  # Field name made lowercase.
    porcentajeinterpretado = models.FloatField(db_column='PorcentajeInterpretado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'personaidioma'


class Personaredsocial(models.Model):
    idpersonaredsocial = models.AutoField(db_column='IdPersonaRedSocial', primary_key=True)  # Field name made lowercase.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    idredes = models.ForeignKey(CatRedessociales, models.DO_NOTHING, db_column='IdRedes')  # Field name made lowercase.
    nombreusuario = models.CharField(db_column='NombreUsuario', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'personaredsocial'


class Postulantes(models.Model):
    idpostulante = models.AutoField(db_column='IdPostulante', primary_key=True)  # Field name made lowercase.
    idestadopostulante = models.ForeignKey(Estadopostulante, models.DO_NOTHING, db_column='IdEstadoPostulante')  # Field name made lowercase.
    fechasolicitud = models.DateField(db_column='FechaSolicitud')  # Field name made lowercase.
    aspiracionsalarial = models.FloatField(db_column='AspiracionSalarial')  # Field name made lowercase.
    gastomensual = models.FloatField(db_column='GastoMensual')  # Field name made lowercase.
    montodeudas = models.FloatField(db_column='MontoDeudas')  # Field name made lowercase.
    cv = models.TextField(db_column='CV')  # Field name made lowercase.
    registrocompleto = models.TextField(db_column='RegistroCompleto', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    codvacante = models.ForeignKey('Vacante', models.DO_NOTHING, db_column='CodVacante')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'postulantes'


class Proveedorservicios(models.Model):
    idproveedor = models.AutoField(db_column='IdProveedor', primary_key=True)  # Field name made lowercase.
    nombreproveedor = models.CharField(db_column='NombreProveedor', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    ruc = models.CharField(db_column='RUC', max_length=20, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'proveedorservicios'


class Referencias(models.Model):
    idreferencia = models.AutoField(db_column='IdReferencia', primary_key=True)  # Field name made lowercase.
    anosrelacion = models.FloatField(db_column='AnosRelacion')  # Field name made lowercase.
    rutadoc = models.TextField(db_column='RutaDoc')  # Field name made lowercase.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IdPersona')  # Field name made lowercase.
    idpostulante = models.ForeignKey(Postulantes, models.DO_NOTHING, db_column='IdPostulante')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'referencias'


class Representacionlegal(models.Model):
    idrepresentante = models.AutoField(db_column='IdRepresentante', primary_key=True)  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'representacionlegal'


class Requisitoscargo(models.Model):
    idrequisitoscargo = models.AutoField(db_column='IdRequisitosCargo', primary_key=True)  # Field name made lowercase.
    codcargo = models.ForeignKey(Cargo, models.DO_NOTHING, db_column='Codcargo')  # Field name made lowercase.
    idrequerimiento = models.ForeignKey(CatRequerimientos, models.DO_NOTHING, db_column='IdRequerimiento')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'requisitoscargo'


class Revisionoficial(models.Model):
    idrevisionoficial = models.AutoField(db_column='IdRevisionOficial', primary_key=True)  # Field name made lowercase.
    fecharevision = models.DateField(db_column='FechaRevision')  # Field name made lowercase.
    pasa = models.TextField(db_column='Pasa')  # Field name made lowercase. This field type is a guess.
    personaencargada = models.CharField(db_column='PersonaEncargada', max_length=35, db_collation='utf8_general_ci')  # Field name made lowercase.
    idpostulante = models.ForeignKey(Postulantes, models.DO_NOTHING, db_column='IdPostulante')  # Field name made lowercase.
    codvacante = models.ForeignKey('Vacante', models.DO_NOTHING, db_column='CodVacante')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'revisionoficial'


class Revisionpreliminar(models.Model):
    idrevisionpreliminar = models.AutoField(db_column='IdRevisionPreliminar', primary_key=True)  # Field name made lowercase.
    fecharevision = models.DateField(db_column='FechaRevision')  # Field name made lowercase.
    pasa = models.TextField(db_column='Pasa')  # Field name made lowercase. This field type is a guess.
    idpostulante = models.ForeignKey(Postulantes, models.DO_NOTHING, db_column='IdPostulante')  # Field name made lowercase.
    codvacante = models.ForeignKey('Vacante', models.DO_NOTHING, db_column='CodVacante')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'revisionpreliminar'


class Rolusuario(models.Model):
    idrolusuario = models.AutoField(db_column='idRolUsuario', primary_key=True)  # Field name made lowercase.
    idcatrol = models.IntegerField(db_column='idCatRol')  # Field name made lowercase.
    idusuarioemp = models.ForeignKey('Usuarioempleado', models.DO_NOTHING, db_column='idUsuarioEmp')  # Field name made lowercase.
    idrol = models.ForeignKey(CatRols, models.DO_NOTHING, db_column='IdRol')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'rolusuario'


class Tablaprogresiva(models.Model):
    codir = models.CharField(db_column='CodIr', primary_key=True, max_length=10, db_collation='utf8_general_ci')  # Field name made lowercase.
    fecha = models.DateTimeField(db_column='Fecha')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'tablaprogresiva'


class Tipocontrato(models.Model):
    codtipocont = models.CharField(db_column='CodTipoCont', primary_key=True, max_length=8, db_collation='utf8_general_ci')  # Field name made lowercase.
    tipo = models.TextField(db_column='Tipo')  # Field name made lowercase.
    fechainicio = models.DateField(db_column='FechaInicio')  # Field name made lowercase.
    fechafinal = models.DateField(db_column='FechaFinal')  # Field name made lowercase.
    tipojornada = models.CharField(db_column='TipoJornada', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tipocontrato'


class Tipofuncion(models.Model):
    idtipofuncion = models.AutoField(db_column='IdTipoFuncion', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'tipofuncion'


class Tipoincentivo(models.Model):
    idtipoincentivo = models.AutoField(db_column='IdTipoIncentivo', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=20, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'tipoincentivo'


class Tiporequisito(models.Model):
    idrequisito = models.AutoField(db_column='IdRequisito', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'tiporequisito'


class Tipovacacion(models.Model):
    idtipovacacion = models.AutoField(db_column='IdTipoVacacion', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=20, db_collation='utf8_general_ci')  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'tipovacacion'


class Titulos(models.Model):
    idtitulo = models.AutoField(db_column='IdTitulo', primary_key=True)  # Field name made lowercase.
    nombretitulo = models.CharField(db_column='NombreTitulo', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    abreviacion = models.CharField(db_column='Abreviacion', max_length=5, db_collation='utf8_general_ci')  # Field name made lowercase.
    relevancia = models.IntegerField(db_column='Relevancia')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'titulos'


class Usuarioempleado(models.Model):
    idusuarioemp = models.AutoField(db_column='idUsuarioEmp', primary_key=True)  # Field name made lowercase.
    usuario = models.CharField(db_column='Usuario', max_length=100, db_collation='utf8_general_ci')  # Field name made lowercase.
    hashpass = models.TextField(db_column='HashPass')  # Field name made lowercase.
    correoinstitucional = models.TextField(db_column='CorreoInstitucional')  # Field name made lowercase.
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'usuarioempleado'


class Usuariopostulante(models.Model):
    idusuario = models.AutoField(db_column='IdUsuario', primary_key=True)  # Field name made lowercase.
    usuario = models.CharField(db_column='Usuario', max_length=100, db_collation='utf8_general_ci')  # Field name made lowercase.
    hashpass = models.TextField(db_column='HashPass')  # Field name made lowercase.
    correoprop = models.TextField(db_column='CorreoProp')  # Field name made lowercase.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IdPersona',blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'usuariopostulante'


class Vacacioneacumuladas(models.Model):
    idvacaciones = models.AutoField(db_column='IdVacaciones', primary_key=True)  # Field name made lowercase.
    cantidad = models.FloatField(db_column='Cantidad')  # Field name made lowercase.
    pagado = models.FloatField(db_column='Pagado')  # Field name made lowercase.
    dia = models.DateTimeField(db_column='Dia')  # Field name made lowercase.
    agregadopor = models.CharField(db_column='AgregadoPor', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    detalle = models.TextField(db_column='Detalle')  # Field name made lowercase.
    justificado = models.TextField(db_column='Justificado')  # Field name made lowercase. This field type is a guess.
    codempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='CodEmpleado')  # Field name made lowercase.
    idperiodolaboral = models.ForeignKey(Periodolaboral, models.DO_NOTHING, db_column='IdPeriodoLaboral')  # Field name made lowercase.
    idtipovacacion = models.ForeignKey(Tipovacacion, models.DO_NOTHING, db_column='IdTipoVacacion')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'vacacioneacumuladas'


class Vacante(models.Model):
    codvacante = models.CharField(db_column='CodVacante', primary_key=True, max_length=8, db_collation='utf8_general_ci')  # Field name made lowercase.
    descripcion = models.CharField(db_column='Descripcion', max_length=100, db_collation='utf8_general_ci')  # Field name made lowercase.
    presupuestopublicidad = models.FloatField(db_column='PresupuestoPublicidad')  # Field name made lowercase.
    fechalimiterecepcion = models.DateField(db_column='FechaLimiteRecepcion')  # Field name made lowercase.
    fechacontratacion = models.DateField(db_column='FechaContratacion')  # Field name made lowercase.
    fechaelaboracion = models.DateField(db_column='FechaElaboracion')  # Field name made lowercase.
    elaboradapor = models.CharField(db_column='ElaboradaPor', max_length=25, db_collation='utf8_general_ci')  # Field name made lowercase.
    autorizadapor = models.CharField(db_column='AutorizadaPor', max_length=25, db_collation='utf8_general_ci', null=False)  # Field name made lowercase.
    estado = models.BooleanField(db_column='Estado', null=True)  # Field name made lowercase. This field type is a guess.
    idtipovacante = models.ForeignKey(CatTipovacante, models.DO_NOTHING, db_column='IdTipoVacante')  # Field name made lowercase.
    codcargo = models.ForeignKey(Cargo, models.DO_NOTHING, db_column='Codcargo')  # Field name made lowercase.
    idpublicidad = models.ForeignKey(CatPublicidad, models.DO_NOTHING, db_column='IdPublicidad')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'vacante'
        
    def __str__(self):
        return f"{self.codvacante} - {self.idtipovacante} - {self.codcargo.nombrecargo}"
