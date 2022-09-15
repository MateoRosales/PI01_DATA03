# Año con más carreras

query1= 'SELECT Año, COUNT(*) AS CantCarreras '\
        'FROM carreras '\
        'GROUP BY Año '\
        'ORDER BY CantCarreras DESC '\
        'LIMIT 1'

# Piloto con mayor cantidad de primeros puestos

query2= 'SELECT c.IdPiloto,Nombre, Apellido, CantVictorias, p.URL '\
        'FROM '\
	    '(SELECT IdPiloto, count(*) AS CantVictorias '\
	    'FROM clasificacion '\
    	'WHERE Posicion=1 '\
    	'GROUP BY IdPiloto '\
    	'ORDER BY CantVictorias DESC '\
    	'LIMIT 1) as c '\
        'JOIN pilotos AS p ON c.IdPiloto=p.IdPiloto '

# Nombre del circuito más corrido

query3= 'SELECT ci.Nombre,ca.CantCarreras,ci.Localidad,ci.Pais,ci.URL '\
        'FROM '\
	    '(SELECT IdCircuito, count(*) AS CantCarreras '\
	    'FROM carreras '\
	    'GROUP BY IdCircuito '\
	    'ORDER BY CantCarreras DESC '\
	    'LIMIT 1) AS ca '\
        'JOIN circuitos AS ci ON ca.IdCircuito=ci.IdCircuito '

# Piloto con mayor cantidad de puntos en total, cuyo constructor sea de nacionalidad sea American o British

query4= 'SELECT p.IdPiloto, p.Nombre, p.Apellido, SUM(r.Puntos) AS PuntosTotal, r.IdConstructor, c.Escuderia, c.Nacionalidad '\
        'FROM resultados AS r '\
        'JOIN pilotos AS p ON r.IdPiloto=p.IdPiloto '\
        'JOIN '\
	    '(SELECT * '\
	    'FROM constructores '\
	    'WHERE Nacionalidad IN ("American","British")) AS c '\
        'ON r.IdConstructor=c.IdConstructor '\
        'GROUP BY r.IdPiloto '\
        'ORDER BY PuntosTotal DESC '\
        'LIMIT 1 '