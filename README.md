# Sistema Digital de Gestión de Biblioteca

## Resumen

Este proyecto fue realizado con el fin de desarrollar un sistema digital de biblioteca que maneje el control de libros y usuarios de forma automatizada, gestión de inventario, registro de usuarios, préstamos, devoluciones y reservas. 

Aplicando el uso de arreglos, estructuras cíclicas, secuencias y lógicas a una situación del mundo real. 

## Descripción de la Solución Implementada

Se consideran los siguientes problemas:

**1. Gestión ineficiente de inventario.** Un conteo físico de inventario es vulnerable a los errores, cuando se trata de una gran extensión de inventario, manejar un sistema es lo ideal. Para ello, se implementó una sección dentro del sistema que permite el ingreso de inventario y muestre los datos respecto al uso de estos libros.

**2. Registro manual de usuarios.** Se implementó un apartado en el sistema que permite el ingreso de usuarios, almacenando la información y junto a ello, facilitando la búsqueda de la información del mismo. Asímismo, también se implementó la función de modificar información.

**3. Préstamos y devoluciones desorganizados.** Con la información que el sistema maneja, se desarrollaron funciones para el control de los préstamos y devoluciones de los libros. Incluyendo el manejo de préstamos por usuario, las devoluciones y la vista de préstamos activos en general y por usuario.

## Diagrama de Flujo del Proceso Principal
![This is an alt text.](/biblioteca_principal.png)
El proceso principal maneja los arreglos que guardan la información del sistema, maneja a través del menú las funciones solicitadas por el usuario.


## Estructuras de Datos Utilizadas

**1. Gestión de Libros**

```
	// Arreglos para el manejo de los libros disponibles
    Dimension titulo[5]
	Dimension ejemplares[5]
	Dimension estado[5]
	Dimension codigo[5]

        // Dentro del SubProceso libros
        Dimension autor[5]
	    Dimension genero[5]
	    Dimension publicacion[5]
	
    // Arreglos para el manejo de los ejemplares físicos disponibles
	Dimension idEjemplar[20]
	Dimension libroEjemplar[20]
	Dimension estadoEjemplar[20]
	Dimension usuarioEjemplar[20]

    j <- 1
```
Fueron creados 4 arreglos en el proceso principal para el manejo de los títulos de los libros, los cuales son los que más aportan a la distinción de los ejemplares, otro para los estados:
* 1: Disponible
* 2: Prestado
* 3: Reservado 
Y también un código único para identificar el libro (Este respecto a la existencia de la edición del libro, si está dentro del inventario)
Junto a otros 3 arreglos dentro de los subprocesos que guardan información más específica como autor, género y año de publicación.

Debido a que puede existir más de un ejemplar respecto a la edición de un libro, se implementaron otros 4 arreglos que almacenan la información de
* idEjemplar = Código único de la copia física de la edición ingresada
* libroEjemplar = El código de la edición a la que pertenece el ejemplar existente
* estadoEjemplar = Si está disponible, prestado o reservado.
* usuarioEjemplar = A que usuario está prestado o reservado (en caso de que lo esté)

"j" maneja el conteo de las posiciones ya utilizadas en todos los arreglos.

**2. Gestión de Usuarios**
```
	Dimension id[5]
	Dimension nombre[5]
	Dimension carne[5]
	Dimension telefono[5]
	Dimension correo[5]
	Dimension fecha[5]

    i <- 1
```
Cada vector almacena la información que el nombre indica.

"i" maneja el conteo de las posiciones ya utilizadas en todos los arreglos.

**3. Préstamos y Devoluciones**
```
	Dimension fechaDevolucion[20]
	Dimension fechaPrestamo[20]

    k <- 1
```

Cada vector almacena la fecha de préstamo y devolución de los libros que salen del inventario.

"k" maneja el conteo de las posiciones ya utilizadas en todos los arreglos.

## Resultados Obtenidos y Casos de Prueba Realizados
* 1. Registro de Libros
![This is an alt text.](/3registrolibros.png)
* 2. Búsqueda de Libros por Título
![This is an alt text.](/4busquedalibros.png)
* 3. Búsqueda de Libros por Género/Categoría
![This is an alt text.](/4.2busquedalibros.png)
* 4. Listado Libros Disponibles
![This is an alt text.](/5librosdisponibles.png)
* 5. Ingreso de Usuario
![This is an alt text.](/7ingresoestudiantes.png)
* 6. Consulta de Usuario
![This is an alt text.](/8consultausuarios.png)
* 7. Préstamo de Libros
![This is an alt text.](/11prestamolibro.png)
* 8. En caso de no cumplir con alguna condición para prestar libro
![This is an alt text.](/13usuarionoencontrado.png)

## Limitaciones Conocidas del Sistema

* No cuenta con una función automática que calcule la fecha de devolución del libro.
* Una vez se reinicia la ejecución, la información no queda guardada.
* Es necesario el ID del usuario para poder modificar información y encontrar información del mismo.
