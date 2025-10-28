Funcion prestamo <- ConteoPrestamos(d, libroEjemplar, estadoEjemplar, usuarioEjemplar, k)
	Definir prestamo, i Como Entero
	prestamo <- 0
	
	Para i <- 1 Hasta k-1 con Paso +1 Hacer
		Si usuarioEjemplar[i] = d y estadoEjemplar[i] = 2
			prestamo = prestamo + 1
		FinSi
	FinPara
	
FinFuncion
Funcion cantidad <- ContarDisponibles(codigo, t, libroEjemplar, estadoEjemplar, k)
	Definir cantidad Como Entero
	cantidad <- 0
	
	Para i <- 1 Hasta k-1 con Paso +1 Hacer
		Si libroEjemplar[i] = codigo[t] Y estadoEjemplar[i] = 1
			cantidad <- cantidad + 1
		FinSi
	FinPara
FinFuncion
Funcion posicion <- BuscarEjemplarDisponible(codigo, t, libroEjemplar, estadoEjemplar, k)
	Definir posicion, i como Entero
	
	posicion <- 0
	
	Para i <- 1 Hasta k-1 Con Paso +1 Hacer
		Si libroEjemplar[i] = codigo[t] Y estadoEjemplar[i] = 1 Entonces
			posicion <- i
		FinSi
	FinPara
FinFuncion
SubProceso libros(j Por Referencia, ejemplares, estado, titulo, idEjemplar, libroEjemplar, estadoEjemplar, usuarioEjemplar, codigo, k por Referencia)
	Definir op como Entero
	Dimension autor[5]
	Dimension genero[5]
	Dimension publicacion[5]
	
	op <- 0
	
	Mientras op<>4 Hacer
		Escribir "========================="
		Escribir "    GESTI�N DE LIBROS"
		Escribir "========================="
		Escribir "1. Registrar nuevos libros"
		Escribir "2. Buscar libros"
		Escribir "3. Ver lista de todos los libros disponibles"
		Escribir "4. Volver a la pantalla principal"
		
		Leer op
		
		Segun op Hacer
			1:
				Limpiar Pantalla
				registrolibros(j, ejemplares, estado, titulo, autor, genero, publicacion, codigo, idEjemplar, libroEjemplar, usuarioEjemplar, estadoEjemplar, k)
			2:
				Limpiar Pantalla
				busquedalibros(j, ejemplares, estado, titulo, autor, genero, publicacion, codigo)
			3:
				Limpiar Pantalla
				listarlibros(j, ejemplares, estado, titulo, autor, genero, publicacion, codigo)
			4: 
				Limpiar Pantalla
				
			De Otro Modo:
				Escribir "Opci�n no v�lida"
		Fin Segun
	FinMientras
FinSubProceso

SubProceso registrolibros(j por Referencia, ejemplares, estado, titulo, autor, genero, publicacion, codigo, idEjemplar, libroEjemplar, usuarioEjemplar, estadoEjemplar, k Por Referencia)
	Definir numEjemplares, h como Entero
	
	Escribir "=========================="
	Escribir "    REGISTRO DE LIBROS"
	Escribir "=========================="
	
	codigo[j] <- j 
	
	Escribir "Ingrese el t�tulo del libro"
	Leer titulo[j]
	Escribir "Ingrese el autor del libro"
	Leer autor[j]
	Escribir "Ingrese la categor�a/g�nero a la que pertenece el libro"
	Leer genero[j]
	Escribir "Ingrese el a�o de publicaci�n"
	Leer publicacion[j]
	Escribir "Ingrese el n�mero de ejemplares disponibles del libro"
	Leer numEjemplares
	
	ejemplares[j] <- numEjemplares
	
	//Crear ejemplares individuales
	Para h <- 1 Hasta numEjemplares con Paso +1 Hacer
		idEjemplar[k] <- k
		libroEjemplar[k] <- codigo[j] //Pertenece a este ejemplar
		estadoEjemplar[k] <- 1
		usuarioEjemplar[k] <- 0
		
		k = k + 1
	FinPara
	
	Escribir "Se registr� el libro ", titulo[j], " de ", autor[j], ", G�nero/Categor�a ", genero[j], ", publicado en ", publicacion[j], ", con el c�digo ", codigo[j], ". ", numEjemplares, " ejemplares disponibles"
	
	j = j + 1
	
	Esperar Tecla
FinSubProceso

SubProceso busquedalibros(j, ejemplares, estado, titulo, autor, genero, publicacion, codigo)
	Definir op, u Como Entero
	Definir busqueda Como Caracter
	
	u <- 1
	
	Escribir "=========================="
	Escribir "    B�SQUEDA DE LIBROS"
	Escribir "=========================="
	Escribir "Seleccione el m�todo por el cual desea buscar el libro"
	Escribir "1. T�tulo"
	Escribir "2. Autor"
	Escribir "3. Categor�a"
	Escribir "4. C�digo"
	Leer op
	
	Segun op Hacer
		1: 
			Escribir "Ingrese el t�tulo del libro"
			Leer busqueda
			Para i <- 1 Hasta j-1 Hacer
				Si titulo[i] = busqueda
					u <- i
				FinSi
			FinPara
			
			Si u <> 0
				Escribir "Se encontr� la informaci�n del libro con c�digo ", codigo[u]
				Escribir titulo[u]
				Escribir "Autor: ", autor[u]
				Escribir "Categor�a/g�nero: ", genero[u]
				Escribir "A�o de publicaci�n: ", publicacion[u]
				Escribir "Con ", ejemplares[u], " ejemplares disponibles para pr�stamo."
			SiNo
				Escribir "No se encontr� el libro"
			FinSi
			Esperar Tecla
		2:
			Escribir "Ingrese el autor del libro"
			Leer busqueda
			Para i <- 1 Hasta j-1 Hacer
				Si autor[i] = busqueda
					u <- i
				FinSi
			FinPara
			
			Si u <> 0
				Escribir "Se encontr� la informaci�n del libro con c�digo ", codigo[u]
				Escribir titulo[u]
				Escribir "Autor: ", autor[u]
				Escribir "Categor�a/g�nero: ", genero[u]
				Escribir "A�o de publicaci�n: ", publicacion[u]
				Escribir "Con ", ejemplares[u], " ejemplares disponibles para pr�stamo."
			SiNo
				Escribir "No se encontr� el libro"
			FinSi
			Esperar Tecla
		3: 
			Escribir "Ingrese la categor�a/g�nero del libro"
			Leer busqueda
			Para i <- 1 Hasta j-1 Hacer
				Si genero[i] = busqueda
					u <- i
				FinSi
			FinPara
			
			Si u <> 0
				Escribir "Se encontr� la informaci�n del libro con c�digo ", codigo[u]
				Escribir titulo[u]
				Escribir "Autor: ", autor[u]
				Escribir "Categor�a/g�nero: ", genero[u]
				Escribir "A�o de publicaci�n: ", publicacion[u]
				Escribir "Con ", ejemplares[u], " ejemplares disponibles para pr�stamo."
			SiNo
				Escribir "No se encontr� el libro"
			FinSi
		4: 
			Escribir "Ingrese el c�digo del libro"
			Leer busqueda
			Si  codigo[busqueda] <> 0
				Escribir "Se encontr� la informaci�n del libro con c�digo ", codigo[u]
				Escribir titulo[busqueda]
				Escribir "Autor: ", autor[busqueda]
				Escribir "Categor�a/g�nero: ", genero[busqueda]
				Escribir "A�o de publicaci�n: ", publicacion[busqueda]
				Escribir "Con ", genero[busqueda], " ejemplares disponible para pr�stamo."
			SiNo
				Escribir "No se encontr� el libro"
			FinSi
		De Otro Modo: 
			Escribir "Opci�n no v�lida"
	FinSegun
FinSubProceso

SubProceso listarlibros(j, ejemplares, estado, titulo, autor, genero, publicacion, codigo)
	Escribir "============================"
	Escribir "     LIBROS DISPONIBLES"
	Escribir "============================"
	
	Para i<-1 Hasta j-1 Con Paso +1 Hacer
		Escribir "Ejemplar de c�digo no. ", codigo[i]
		Escribir titulo[i]
		Escribir "Autor: ", autor[i]
		Escribir "G�nero/Categor�a: " Sin Saltar
		Escribir genero[i]
		Escribir "A�o de publicaci�n: ", publicacion[i]
		Escribir "No. de ejemplares disponibles: ", ejemplares[i]
		Escribir "--------------------------------------"
	Fin Para
	
	Esperar Tecla
FinSubProceso

SubProceso usuarios(i Por Referencia, id, nombre, carne, prestamo, telefono, correo, fecha)
	Definir opc como Entero
	
	opc <- 0
	
	Mientras opc<>5 Hacer
		Escribir "========================="
		Escribir "   GESTI�N DE USUARIOS"
		Escribir "========================="
		Escribir "1. Registrar nuevos usuarios"
		Escribir "2. Consultar informaci�n de usuarios"
		Escribir "3. Modificar datos de usuarios existentes"
		Escribir "4. Ver lista de todos los usuarios"
		Escribir "5. Volver a la pantalla principal"
		
		Leer opc
		
		Segun opc Hacer
			1:
				Limpiar Pantalla
				registro(i, id, nombre, carne, prestamo, telefono, correo, fecha)
			2:
				Limpiar Pantalla
				consulta(i, id, nombre, carne, telefono, correo, fecha)
			3:
				Limpiar Pantalla
				modificar(id, nombre, carne,telefono, correo)
			4:
				Limpiar Pantalla
				listar(i, id, nombre, carne, telefono, correo, fecha)
			5: 
				Limpiar Pantalla
				
			De Otro Modo:
				Escribir "Opci�n no v�lida"
		Fin Segun
	FinMientras
	
FinSubProceso

SubProceso registro(i Por Referencia, id, nombre por Referencia, carne, prestamo, telefono, correo, fecha)
	
	Escribir "================================="
	Escribir "    REGISTRO DE ESTUDIANTES"
	Escribir "================================="
	id[i] <- i
	
	Escribir "Ingrese el nombre del estudiante"
	Leer nombre[i]
	Escribir "Ingrese el carn� o DPI del estudiante"
	Leer carne[i]
	Escribir "Ingrese el n�mero de tel�fono del estudiante"
	Leer telefono[i]
	Escribir "Ingrese el correo del estudiante"
	Leer correo[i]
	Escribir "Ingrese la fecha (DD/MM/AAAA)"
	Leer fecha[i]
	Escribir "Se registr� al estudiante con ID: ", id[i], " ", nombre[i], ", Carn� ", carne[i], ", N�mero de tel�fono ", telefono[i], ", Direcci�n de correo electr�nico ", correo[i], ", en la fecha actual de ", fecha[i]
	
	i <- i + 1
	Esperar Tecla
	
FinSubProceso

SubProceso consulta(i, id, nombre, carne, telefono, correo, fecha)
	Definir aux como Entero
	Definir usuario como Logico
	
	Escribir "========================="
	Escribir "   CONSULTAR USUARIOS"
	Escribir "========================="
	Escribir "Ingrese el ID del estudiante"
	Leer aux
	
	Escribir "Se encontr� la siguiente informaci�n del estudiante con ID ", aux
	Escribir nombre[aux], ", Carn� o DPI ", carne[aux], ", No. de tel�fono ", telefono[aux], ", Correo electr�nico ", correo[aux]
	Escribir "Registrado el d�a ", fecha[aux]
	
	Esperar Tecla
FinSubProceso

SubProceso modificar(id, nombre, carne, telefono, correo)
	Definir op, k como Entero
	Definir aux como Caracter
	
	Escribir "=================================="
	Escribir "      MODIFICAR INFORMACI�N"
	Escribir "=================================="
	Escribir "Ingrese el ID del estudiante a modificar"
	Leer k
	Escribir "Seleccione la informaci�n del usuario que desee modificar"
	Escribir "1. Nombre"
	Escribir "2. Carn�/DPI"
	Escribir "3. Tel�fono"
	Escribir "4. Correo electr�nico"
	Leer op
	
	Segun op Hacer
		1:
			Escribir "Ingrese el nuevo nombre a colocar"
			Leer aux
			nombre[id[k]] <- aux
			Escribir "Informaci�n modificada"
		2: 
			Escribir "Ingrese el nuevo no. de registro a colocar"
			Leer aux
			carne[id[k]] <- aux
			Escribir "Informaci�n modificada"
		3:
			Escribir "Ingrese el nuevo no. de tel�fono a colocar"
			Leer aux
			telefono[id[k]] <- aux
			Escribir "Informaci�n modificada"
		4: 
			Escribir "Ingrese el nuevo correo electr�nico a colocar"
			Leer aux
			correo[id[k]] <- aux
			Escribir "Informaci�n modificada"
		De Otro Modo:
			Escribir "Opci�n no v�lida"
	FinSegun
	
	Esperar Tecla
FinSubProceso

SubProceso listar(i, id, nombre, carne, telefono, correo, fecha)
	
	Escribir "=========================="
	Escribir " ESTUDIANTES REGISTRADOS"
	Escribir "=========================="
	Para u<-1 Hasta i-1 Con Paso +1 Hacer
		Escribir "Estudiante con no. de ID ", id[u] 
		Escribir nombre[u]
		Escribir carne[u]
		Escribir telefono[u]
		Escribir correo[u]
		Escribir "Fecha de registro " Sin Saltar
		Escribir fecha[u]
		Escribir "------------------------------"
	Fin Para
	
	Esperar Tecla
FinSubProceso

SubProceso prestamos(titulo, ejemplares, estado, nombre, i, j, idEjemplar, libroEjemplar, estadoEjemplar, usuarioEjemplar, k, codigo, fechaDevolucion, fechaPrestamo) 
	Definir op como Entero
	
	op = 0
	
	Mientras op<>5 Hacer
		Escribir "=========================="
		Escribir " PR�STAMOS Y DEVOLUCIONES"
		Escribir "=========================="
		Escribir "1. Pr�stamo de libros"
		Escribir "2. Devoluci�n de libros"
		Escribir "3. Consulta de pr�stamos activos seg�n usuario"
		Escribir "4. Listado de pr�stamos activos"
		Escribir "5. Volver al men� principal"
		
		Leer op
		
		Segun op Hacer
			1:
				Limpiar Pantalla
				prestamousuarios(titulo, ejemplares, estado, nombre, i, j, idEjemplar, libroEjemplar, estadoEjemplar, usuarioEjemplar, k, codigo, fechaDevolucion, fechaPrestamo)
			2:
				Limpiar Pantalla
			3:
				Limpiar Pantalla
				consultaprestamos(nombre, titulo, i, j, idEjemplar, libroEjemplar, estadoEjemplar, usuarioEjemplar, k, fechaDevolucion, codigo)
			4: 
				Limpiar Pantalla
			5:
				Limpiar Pantalla
			De Otro Modo:
				Escribir "Opci�n no v�lida"
		Fin Segun
	FinMientras
FinSubProceso

SubProceso prestamousuarios(titulo, ejemplares, estado, nombre, i, j, idEjemplar, libroEjemplar, estadoEjemplar, usuarioEjemplar, k, codigo, fechaDevolucion, fechaPrestamo)
	Definir usuario como Logico
	Definir busqueda como Caracter
	Definir d, t, numPrestamos, disponibles, ejemplar como Entero
	
	disponibles <- 0
	usuario <- Falso
	d <- 0
	t <- 0
	
	Escribir "============================="
	Escribir "PR�STAMO DE LIBRO A USUARIOS"
	Escribir "============================="
	Escribir "Ingrese el nombre del estudiante"
	Leer busqueda
	
	Si i = 1 Entonces
		Escribir "No hay usuarios registrados en el sistema"
		Escribir "Por favor registre usuarios primero en Gesti�n de Usuarios"
	SiNo
	
	//Buscar usuario
	Para u<-1 Hasta i-1 con Paso +1 Hacer
		Si nombre[u] = busqueda
			usuario = Verdadero
			d <- u
		FinSi
	FinPara
	
	Si usuario = Verdadero 
		numPrestamos <- ConteoPrestamos(d, estadoEjemplar, usuarioEjemplar, libroEjemplar, k)
		Si numPrestamos < 3 Entonces
			Escribir "Ingrese el t�tulo del libro"
			Leer busqueda
			
			//Buscar la existencia del libro
			Para u <- 1 Hasta j-1 con Paso +1 Hacer
				Si titulo[u] = busqueda
					t <- u
				FinSi
			FinPara
			
			Si t <> 0
				disponibles <- ContarDisponibles(codigo, t, libroEjemplar, estadoEjemplar, k)
			FinSi
			
			Si disponibles > 0
				ejemplar <- BuscarEjemplarDisponible(codigo, t, libroEjemplar, estadoEjemplar, k)
				
				//Prestar ejemplar
				estadoEjemplar[ejemplar] <- 2
				usuarioEjemplar[ejemplar] <- d
				
				Escribir "Ingrese la fecha de hoy (DD/MM/AAAA)"
				Leer fechaPrestamo[ejemplar]
				
				Escribir "Ingrese la fecha de devoluci�n (DD/MM/AAAA)"
				Leer fechaDevolucion[ejemplar]
				
				Escribir "Pr�stamo Realizado"
				Escribir "--------------------------------------"
				Escribir "Ejemplar No. ", idEjemplar[ejemplar]
				Escribir "Libro: ", titulo[t]
				Escribir "Fecha de pr�stamo: ", fechaPrestamo[ejemplar]
				Escribir "Fecha de devoluci�n: ", fechaDevolucion[ejemplar]
			SiNo
				Escribir "No hay ejemplares disponibles"
			FinSi
		SiNo
			Escribir "El usuario tiene 3 pr�stamos activos"
		FinSi
	SiNo
		Escribir "Usuario no encontrado"
	FinSi
FinSi
	Esperar Tecla
FinSubProceso

SubProceso consultaprestamos(nombre, titulo, i, j, idEjemplar, libroEjemplar, estadoEjemplar, usuarioEjemplar, k, fechaDevolucion, codigo)
	Definir busqueda Como Caracter
	Definir idUsuario, codigoLibro Como Entero
	Definir encontrado Como Logico
	
	encontrado <- Falso
	
	Escribir "================================"
	Escribir " CONSULTA DE PR�STAMOS ACTIVOS"
	Escribir "================================"
	Escribir "Ingrese el nombre del estudiante"
	Leer busqueda
	
	Para h <- 1 Hasta i-1 con Paso +1 Hacer
		Si nombre[h] = busqueda Entonces
			idUsuario <- h
			encontrado <- Verdadero
		FinSi
	FinPara
	
	Si encontrado = Verdadero
		Escribir "Pr�stamos activos de ", nombre[idUsuario], ":"
		Escribir "================================"
		
		Para h <- 1 Hasta k-1 con Paso +1 Hacer
			Si usuarioEjemplar[h] = idUsuario Y estadoEjemplar[h] = 2 Entonces
				codigoLibro <- libroEjemplar[h]
				
				Para u <- 1 Hasta j-1 con Paso +1 Hacer
					Si codigo[u] = codigoLibro Entonces
						Escribir "Ejemplar #", idEjemplar[h]
						Escribir "Libro: ", titulo[u]
						Escribir "Fecha de devoluci�n: ", fechaDevolucion[h]
						Escribir "--------------------------------------"
					FinSi
				FinPara
			FinSi
		FinPara
	SiNo
		Escribir "Usuario no encontrado"
	FinSi
	
	Esperar Tecla
FinSubProceso

Proceso biblioteca_principal
	Definir op, i, j, k Como Entero 
	Definir id, ejemplares, prestamo Como Entero
	Definir nombre, carne, telefono, correo, fecha como Caracter
	Definir estado, titulo como Caracter
	
	// Datos Problema 1
	Dimension titulo[5]
	Dimension ejemplares[5]
	Dimension estado[5]
	Dimension codigo[5]
	
	Dimension idEjemplar[20]
	Dimension libroEjemplar[20]
	Dimension estadoEjemplar[20]
	Dimension usuarioEjemplar[20]
	
	// Datos Problema 2
	Dimension id[5]
	Dimension nombre[5]
	Dimension carne[5]
	Dimension telefono[5]
	Dimension correo[5]
	Dimension fecha[5]
	
	//Datos Problema 3
	Dimension fechaDevolucion[20]
	Dimension fechaPrestamo[20]

	i <- 1 //Conteo de n�mero de estudiantes registrados
	j <- 1 //Conteo de n�mero de espacios en el arreglo de libros registrados
	k <- 1 //Conteo de ejemplares f�sicos disponibles
	
	prestamo <- 0
	op <- 0
	
	Mientras op<>4 Hacer
		Escribir "==================================="
		Escribir " SISTEMA DE GESTI�N DE BIBLIOTECA"
		Escribir "==================================="
		Escribir "1. Gesti�n de Libros"
		Escribir "2. Gesti�n de Usuarios"
		Escribir "3. Pr�stamos y Devoluciones"
		Escribir "4. Salir"
		Escribir "=================================="
		Escribir "Ingrese opci�n:" Sin Saltar 
		
		Leer op
		
		Segun op Hacer
			1:
				Limpiar Pantalla
				libros(j, ejemplares, estado, titulo, idEjemplar, libroEjemplar, estadoEjemplar, usuarioEjemplar, codigo, k)
			2:
				Limpiar Pantalla
				usuarios(i, id, nombre, carne, prestamo, telefono, correo, fecha)
			3:
				Limpiar Pantalla
				prestamos(titulo, ejemplares, estado, nombre, i, j, idEjemplar, libroEjemplar, estadoEjemplar, usuarioEjemplar, k, codigo, fechaDevolucion, fechaPrestamo) 
			4: 
				Escribir "Saliendo..."
			De Otro Modo:
				Escribir "Opci�n no v�lida"
		Fin Segun
		
	Fin Mientras
FinProceso