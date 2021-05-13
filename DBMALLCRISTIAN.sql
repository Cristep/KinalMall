CREATE DATABASE IF NOT EXISTS DBKinalMallCrsitianCumez;
CREATE DATABASE DBKinalMallCrsitianCumez;
USE DBKinalMallCrsitianCumez;

DROP TABLE IF EXISTS Departamentos;
CREATE TABLE IF NOT EXISTS Departamentos(
	id  INT AUTO_INCREMENT  NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY PK_Departamentos(id)

);


DROP TABLE IF EXISTS Cargos;
CREATE TABLE IF NOT EXISTS Cargos(
	id  INT AUTO_INCREMENT  NOT NULL,
    nombre VARCHAR(45),
    PRIMARY KEY PK_Cargos(id)

);


DROP TABLE IF EXISTS Horarios;
CREATE TABLE IF NOT EXISTS Horarios(
	id  INT AUTO_INCREMENT  NOT NULL,
    horararioEntrada VARCHAR(5),
    horarioSalida VARCHAR(5),
    lunes BOOLEAN,
    martes BOOLEAN,
    miercoles BOOLEAN,
    jueves BOOLEAN,
    viernes BOOLEAN,
    PRIMARY KEY PK_Horarios(id)

);

DROP TABLE IF EXISTS tipoClientes;
CREATE TABLE IF NOT EXISTS tipoClientes(
	id  INT AUTO_INCREMENT  NOT NULL,
    descripcion VARCHAR(45),
    PRIMARY KEY PK_TipoClientes(id)

);

DROP TABLE IF EXISTS Locales;
CREATE TABLE IF NOT EXISTS Locales(
	id  INT AUTO_INCREMENT  NOT NULL,
    saldoFavor DECIMAL(11,2),
    saldoContra DECIMAL(11,2),
    mesesPendientes INT,
    disponibilidad BOOLEAN,
    valorLocal DECIMAL (11,2),
    valorAdministracion DECIMAL(11,2),
    PRIMARY KEY PK_Locales(id)

);

DROP TABLE IF EXISTS Administracion;
CREATE TABLE IF NOT EXISTS Administracion(
	id  INT NOT NULL AUTO_INCREMENT,
    direccion VARCHAR(45),
    telefono VARCHAR(8),
    PRIMARY KEY PK_Administracion(id)
);

DROP TABLE IF EXISTS Provedores;
CREATE TABLE IF NOT EXISTS Provedores(
	id  INT NOT NULL AUTO_INCREMENT,
    nitProvedores VARCHAR(45),
    serviciosPrestados VARCHAR(45),
    telefono VARCHAR(8),
    dirrecion VARCHAR(60),
    saldoFavor DECIMAL(11,2),
    saldoContra DECIMAL(11, 2),
	codigoAdministracion INT,
    PRIMARY KEY PK_Provedores(id),
    CONSTRAINT FK_Provedores_Administracion
		FOREIGN KEY (id)
        REFERENCES Administracion(id)
);

DROP TABLE IF EXISTS Clientes;
CREATE TABLE IF NOT EXISTS Clientes(
	id  INT NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(45),
    apellidos VARCHAR(45),
    telefono VARCHAR(8),
    dirrecion VARCHAR(60),
    email VARCHAR(45),
    codigoLocal INT,
    codigoAdministracion INT,
    codigoTipoCLiente INT,
    PRIMARY KEY PK_Clientes(id),
    CONSTRAINT FK_Clientes_Locales
		FOREIGN KEY (codigoLocal)
        REFERENCES Locales(id),
   
   CONSTRAINT FK_Clientes_Administracion     
        FOREIGN KEY (codigoAdministracion)
        REFERENCES administracion(id),
        
   CONSTRAINT FK_Clientes_tipoCliente     
        FOREIGN KEY (codigoTipoCLiente)
        REFERENCES TipoCLiente(id)     
);

DROP TABLE IF EXISTS cuentasPorCobrar;
CREATE TABLE IF NOT EXISTS cuentasPorCobrar(
	id INT NOT NULL  AUTO_INCREMENT,
    numeroFactura VARCHAR(45),
    anio YEAR(4),
    mes int(2),
	valorNetoPago DECIMAL(11,2),
    codigoAdministracion INT,
    codigoCliente INT,
    codigoLocal INT,
    PRIMARY KEY PK_CuentasPorCobrar(id),
	Constraint FK_CuentasPorCobrar_Administracion
		FOREIGN KEY (codigoAdministracion)
        REFERENCES administracion(id),
    Constraint FK_CuentasPorCobrar_Clientes
		FOREIGN KEY (codigoCliente)
        REFERENCES Clientes(id),
    Constraint FK_CuentasPorCobrar_Locales
		FOREIGN KEY (codigoLocal)
        REFERENCES Locales(id)    

);

DROP TABLE IF EXISTS CuentasPorPagar;
CREATE TABLE IF NOT EXISTS CuentasPorPagar(
	id INT NOT NULL AUTO_INCREMENT,
    numeroFactura VARCHAR(45),
    fechaLimite DATE,
    estadoPago VARCHAR(45),
    valorNetoPago VARCHAR(45),
    codigoAdministracion INT, 
    codigoProvedor INT,
    PRIMARY KEY PK_CuentasPorPagar (id),
	Constraint FK_CuentasPorPagar_Administracion
		FOREIGN KEY (codigoAdministracion)
        REFERENCES administracion(id),
    CONSTRAINT FK_CuentasPorPagar_Provedores
		FOREIGN KEY (codigoProvedor)
        REFERENCES Provedores(id)

);

DROP TABLE IF EXISTS Empleado;
CREATE TABLE IF NOT EXISTS Empleado(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45),
    apellido VARCHAR(45),
    email VARCHAR(45),
    telefono VARCHAR(8),    
    fechaContractacion DATE,
    sueldo DECIMAL(11,2),
    codigoDepartamento INT,
    codigoCargo INT,
    codigoHorario INT,
    codigoAdministracion INT,
	PRIMARY KEY PK_Empleado(id),
	Constraint FK_Empleados_Departamentos
		FOREIGN KEY (codigoDepartamento)
        REFERENCES Departamento(id),
    Constraint FK_Empleados_Cargos
		FOREIGN KEY (codigoCargos)
        REFERENCES Cargos(id),
    Constraint FK_Empleados_Horarios
		FOREIGN KEY (codigoHorario)
        REFERENCES Horarios(id),
    Constraint FK_Empleados_Administracion
		FOREIGN KEY (codigoAdministracion)
        REFERENCES Administracion(id)        
        
);






