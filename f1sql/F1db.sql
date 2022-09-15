CREATE DATABASE proyectof1;
USE proyectof1;

SHOW VARIABLES LIKE "secure_file_priv"; -- Te muestra el camino de la carpeta segura

-- Tabla circuitos

DROP TABLE IF EXISTS `circuitos`;
CREATE TABLE IF NOT EXISTS `circuitos`(
	IdCircuito			INTEGER NOT NULL,
	Referencia			VARCHAR(50) NOT NULL,
    Nombre				VARCHAR(70) NOT NULL,
    Localidad			VARCHAR(100) NOT NULL,
	Pais				VARCHAR(70) NOT NULL,
    Latitud				VARCHAR(50),
    Longitud			VARCHAR(50),
    Altitud				INTEGER NOT NULL,
    URL					VARCHAR(100)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\f1\\circuitos.csv'
INTO TABLE `circuitos`
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;      

-- Tabla carreras

DROP TABLE IF EXISTS `carreras`;
CREATE TABLE IF NOT EXISTS `carreras`(
	IdCarrera			INTEGER NOT NULL,
	Año					INTEGER NOT NULL,
    Ronda				INTEGER NOT NULL,
    IdCircuito			INTEGER NOT NULL,
	Nombre				VARCHAR(70) NOT NULL,
    Fecha				VARCHAR(50),
    Hora				VARCHAR(50),
    URL					VARCHAR(100)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\f1\\carreras.csv'
INTO TABLE `carreras`
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;   

-- Tabla pilotos

DROP TABLE IF EXISTS `pilotos`;
CREATE TABLE IF NOT EXISTS `pilotos`(
	IdPiloto			INTEGER NOT NULL,
	Referencia			VARCHAR(50) NOT NULL,
    Numero				VARCHAR(5) NOT NULL,
    Codigo				VARCHAR(10) NOT NULL,
	Nombre				VARCHAR(50) NOT NULL,
    Apellido			VARCHAR(50),
    Nacimiento			VARCHAR(50),
    Nacionalidad		VARCHAR(50),
    URL					VARCHAR(100)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\f1\\pilotos.csv'
INTO TABLE `pilotos`
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;      

-- Tabla clasificacion

DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE IF NOT EXISTS `clasificacion`(
	IdClasificacion		INTEGER NOT NULL,
    IdCarrera			INTEGER NOT NULL,
    IdPiloto			INTEGER NOT NULL,
    IdConstructor		INTEGER NOT NULL,
    Numero				VARCHAR(5) NOT NULL,
    Posicion			INTEGER NOT NULL,
    Sesion1				VARCHAR(30),
    Sesion2				VARCHAR(30),
    Sesion3				VARCHAR(30)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\f1\\clasificacion.csv'
INTO TABLE `clasificacion`
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;   

-- Tabla constructores

DROP TABLE IF EXISTS `constructores`;
CREATE TABLE IF NOT EXISTS `constructores`(
	IdConstructor		INTEGER NOT NULL,
	Referencia			VARCHAR(50) NOT NULL,
    Nombre				VARCHAR(70) NOT NULL,
    Nacionalidad		VARCHAR(50) NOT NULL,
    URL					VARCHAR(100)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\f1\\constructores.csv'
INTO TABLE `constructores`
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;   

-- Tabla paradas

DROP TABLE IF EXISTS `paradas`;
CREATE TABLE IF NOT EXISTS `paradas`(
    IdCarrera			INTEGER NOT NULL,
    IdPiloto			INTEGER NOT NULL,
    Parada				INTEGER NOT NULL,
    Vuelta				INTEGER NOT NULL,
	Tiempo				TIME,
    Duracion			VARCHAR(20),
    Milisegundos		INTEGER NOT NULL
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\f1\\paradas.csv'
INTO TABLE `paradas`
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;   

-- Tabla resultados

DROP TABLE IF EXISTS `resultados`;
CREATE TABLE IF NOT EXISTS `resultados`(
	IdResultado			INTEGER NOT NULL,
    IdCarrera			INTEGER NOT NULL,
    IdPiloto			INTEGER NOT NULL,
    IdConstructor		INTEGER NOT NULL,
    Numero				VARCHAR(5) NOT NULL,
    Parrilla			INTEGER NOT NULL,
    Posicion			VARCHAR(5),
    PosicionTexto		VARCHAR(5),
    PosicionOrden		INTEGER NOT NULL,
    Puntos				DECIMAL(5,1) NOT NULL,
    Vueltas				INTEGER NOT NULL,
    Tiempo				VARCHAR(30),
    Milisegundos		VARCHAR(30),
    VueltaRapida		VARCHAR(5),
    Ranking				VARCHAR(5),
    TiempoVueltaRapida	VARCHAR(20),
    VelVueltaRapida		VARCHAR(20),
    IdEstado			INTEGER NOT NULL
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\f1\\resultados.csv'
INTO TABLE `resultados`
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES; 

-- Tabla vueltas

DROP TABLE IF EXISTS `vueltas`;
CREATE TABLE IF NOT EXISTS `vueltas`(
    IdCarrera			INTEGER NOT NULL,
    IdPiloto			INTEGER NOT NULL,
    Vuelta				INTEGER NOT NULL,
	Duracion			INTEGER NOT NULL,
    Tiempo				VARCHAR(20),
    Milisegundos		INTEGER NOT NULL
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\f1\\vueltas.csv'
INTO TABLE `vueltas`
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;   



