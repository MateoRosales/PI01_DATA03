-- Limpieza y transformacion

ALTER TABLE carreras CHANGE Fecha Fecha DATE;
UPDATE carreras SET Hora = REPLACE(Hora,'\N',NULL);
ALTER TABLE carreras CHANGE Hora Hora TIME;

ALTER TABLE circuitos CHANGE Latitud Latitud DECIMAL (10,7);
ALTER TABLE circuitos CHANGE Longitud Longitud DECIMAL (10,7);

UPDATE clasificacion SET Sesion1 = REPLACE(Sesion1,'\N',NULL);
UPDATE clasificacion SET Sesion2 = REPLACE(Sesion2,'\N',NULL);
UPDATE clasificacion SET Sesion3 = REPLACE(Sesion3,'\N',NULL);
ALTER TABLE clasificacion CHANGE Sesion1 Sesion1 TIME;
ALTER TABLE clasificacion CHANGE Sesion2 Sesion2 TIME;
ALTER TABLE clasificacion CHANGE Sesion3 Sesion3 TIME;

ALTER TABLE vueltas CHANGE Duracion Posicion INTEGER;

ALTER TABLE paradas CHANGE Tiempo Tiempo TIME;

ALTER TABLE pilotos CHANGE Nacimiento Nacimiento DATE;

UPDATE resultados SET Posicion = REPLACE(Posicion,'\N',NULL);
UPDATE resultados SET Milisegundos = REPLACE(Milisegundos,'\N',NULL);
ALTER TABLE resultados CHANGE Posicion Posicion INTEGER;
ALTER TABLE resultados CHANGE Milisegundos Milisegundos INTEGER;

ALTER TABLE constructores CHANGE Nombre Escuderia VARCHAR(70);


-- Indice y claves primarias

ALTER TABLE carreras ADD PRIMARY KEY(IdCarrera);
ALTER TABLE carreras ADD INDEX(Año);
ALTER TABLE carreras ADD INDEX(Ronda);
ALTER TABLE carreras ADD INDEX(IdCircuito);

ALTER TABLE circuitos ADD PRIMARY KEY(IdCircuito);

ALTER TABLE clasificacion ADD PRIMARY KEY(Idclasificacion);
ALTER TABLE clasificacion ADD INDEX(IdCarrera);
ALTER TABLE clasificacion ADD INDEX(IdPiloto);
ALTER TABLE clasificacion ADD INDEX(IdConstructor);
ALTER TABLE clasificacion ADD INDEX(Posicion);

ALTER TABLE vueltas ADD INDEX(IdCarrera);
ALTER TABLE vueltas ADD INDEX(IdPiloto);
ALTER TABLE vueltas ADD INDEX(Vuelta);
ALTER TABLE vueltas ADD INDEX(Posicion);
ALTER TABLE vueltas ADD INDEX(Milisegundos);

ALTER TABLE constructores ADD PRIMARY KEY(IdConstructor);

ALTER TABLE paradas ADD INDEX(IdCarrera);
ALTER TABLE paradas ADD INDEX(IdPiloto);
ALTER TABLE paradas ADD INDEX(Vuelta);
ALTER TABLE paradas ADD INDEX(Parada);
ALTER TABLE paradas ADD INDEX(Milisegundos);

ALTER TABLE pilotos ADD PRIMARY KEY(IdPiloto);

ALTER TABLE resultados ADD PRIMARY KEY(IdResultado);
ALTER TABLE resultados ADD INDEX(IdCarrera);
ALTER TABLE resultados ADD INDEX(IdPiloto);
ALTER TABLE resultados ADD INDEX(IdConstructor);
ALTER TABLE resultados ADD INDEX(Posicion);
ALTER TABLE resultados ADD INDEX(Milisegundos);

-- Claves foraneas y restricciones

ALTER TABLE carreras ADD CONSTRAINT carrera_fk_circuito FOREIGN KEY (IdCircuito) REFERENCES circuitos (IdCircuito) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE vueltas ADD CONSTRAINT vuelta_fk_carrera FOREIGN KEY (IdCarrera) REFERENCES carreras (IdCarrera) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE vueltas ADD CONSTRAINT vuelta_fk_piloto FOREIGN KEY (IdPiloto) REFERENCES pilotos (IdPiloto) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE paradas ADD CONSTRAINT parada_fk_carrera FOREIGN KEY (IdCarrera) REFERENCES carreras (IdCarrera) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE paradas ADD CONSTRAINT parada_fk_piloto FOREIGN KEY (IdPiloto) REFERENCES pilotos (IdPiloto) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE clasificacion ADD CONSTRAINT clasificacion_fk_carrera FOREIGN KEY (IdCarrera) REFERENCES carreras (IdCarrera) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE clasificacion ADD CONSTRAINT clasificacion_fk_piloto FOREIGN KEY (IdPiloto) REFERENCES pilotos (IdPiloto) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE clasificacion ADD CONSTRAINT clasificacion_fk_constructor FOREIGN KEY (IdConstructor) REFERENCES constructores (IdConstructor) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE resultados ADD CONSTRAINT resultado_fk_carrera FOREIGN KEY (IdCarrera) REFERENCES carreras (IdCarrera) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE resultados ADD CONSTRAINT resultado_fk_piloto FOREIGN KEY (IdPiloto) REFERENCES pilotos (IdPiloto) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE resultados ADD CONSTRAINT resultado_fk_constructor FOREIGN KEY (IdConstructor) REFERENCES constructores (IdConstructor) ON DELETE RESTRICT ON UPDATE RESTRICT;


