# Proyecto_2

El segundo proyecto, tenía como objetivo limpiar y crear una base de datos de un videoclub en SQL. Los pasos que se han seguido son los siguientes:

LIMPIEZA DE DATOS 🧹

En un principio, se nos facilitó una base de datos que consta de 7 tablas:

<img width="683" alt="Captura de Pantalla 2022-11-07 a las 17 45 55" src="https://user-images.githubusercontent.com/115650089/200366612-e6b04a92-11b2-472f-9e09-4088eb200fff.png">

Antes de llevar las tablas al entorno de trabajo de SQL, hubo que limpiarlo, siguiendo los siguientes pasos:

1. Primero, exploré cada una de las tablas para ver su tamaño, tipo de dato, valores nulos, etc. A priori, no parecía que los datos estuvieran excesivamente sucios. 

2. Una vez visto todas las tablas, decidí borrar la columna "last_update" de todas ellas, ya que ésta no aportaba ninguna información relevante. 

3. En la tabla "film", borré la columna "original_language_id", ya que tenía solo valores nulos.

4. Por último, también en la tabla "film", estaba la columna "special_features". En la misma, podíamos ver que cada registro decía si la película en cuestión tenía comentarios, trailers, escenas eliminadas o entre bastidores. Bajo mi punto de vista, el problema con esta columna era que los datos se daban a la vez, es decir, sin ninguna diferenciación entre ellos, por lo que decidí crear 4 columnas (cada una con uno de los elementos que he nombrado) y, en caso de que la película tenga alguno de ellos, se vería "Y" o "N" en caso contrario. Esto facilitaría la búsqueda de películas con cualquiera de estos requerimientos.

<img width="809" alt="Captura de Pantalla 2022-11-07 a las 17 57 27" src="https://user-images.githubusercontent.com/115650089/200369228-b40ca927-60eb-47f1-a0b7-08e482ec6994.png">

RELACIÓN ENTRE TABLAS DE LA BASE DE DATOS 📊

Una vez teniendo los datos limpios, pasé todas las tablas al entorno de SQL. 

1. Antes de crear las queries había que relacionar las tablas entre sí. Para ello, previamente, modifiqué la tabla "old_HDD" para que ésta me sirviera para relacionar las tablas "category", "actor" y "film", añadiéndole las columnas "film_id", "category_id" y "actor_id":

<img width="630" alt="Captura de Pantalla 2022-11-07 a las 18 07 25" src="https://user-images.githubusercontent.com/115650089/200371431-9d66b37e-99d2-43d7-89c0-b2c3a5d28947.png">

3. Después, concatené las columnas de los nombres y apellidos de todas las tablas creando la nueva columna "full_name".

2. Tras modificar la tabla "old_HDD", mediante "Reverse Engineer" en MYSQL Workbench, creé las relaciones entre las tablas de la siguiente forma:

<img width="982" alt="Captura de Pantalla 2022-11-04 a las 17 30 54" src="https://user-images.githubusercontent.com/115650089/200369878-76ff63ab-3da8-4ebf-a78d-aabfcc7146ba.png">

- Como indico en el paso anterior, utilicé la tabla "old_HDD" modificada para relacionar las tablas "category", "film" y "actor".

- Por otro lado, relacioné las tablas "film" y "rental" a través de la tabla "inventory".

- Por último, relacioné las tablas "language" y "film".

Todas las relaciones se basaron en columnas que tenían en común todas las tablas.


QUERIES  💻

Por último, hice 10 queries sacando varios datos de interés de la base de datos. Estas son algunas de ellas:

<img width="201" alt="Captura de Pantalla 2022-11-07 a las 21 37 26" src="https://user-images.githubusercontent.com/115650089/200410306-29f5f3cb-7950-41cb-a891-f3fe35ca613f.png">

ACTORES CON MÁS PELÍCULAS HECHAS

<img width="609" alt="Captura de Pantalla 2022-11-07 a las 22 07 22" src="https://user-images.githubusercontent.com/115650089/200415571-54199783-faa2-4603-b911-e29ae2884249.png">
<img width="208" alt="Captura de Pantalla 2022-11-07 a las 22 09 15" src="https://user-images.githubusercontent.com/115650089/200415903-070c95c1-b871-4b3c-bc03-5e961042d950.png">

PELÍCULAS QUE DURAN MÁS DE 100 MINUTOS -> 'LONG FILM' / PELÍCULAS QUE DURAN MENOS DE 100 MINUTOS -> 'SHORT FILM' 

<img width="100" alt="Captura de Pantalla 2022-11-07 a las 22 09 38" src="https://user-images.githubusercontent.com/115650089/200415961-a64d6086-e2dd-4753-8e5b-c77ee2f2526e.png">

610 son 'LONG FILM'

<img width="183" alt="Captura de Pantalla 2022-11-07 a las 22 10 49" src="https://user-images.githubusercontent.com/115650089/200416170-74de05f1-ee44-47c0-a615-5020a30863fc.png">

TOP 3 CLIENTES

<img width="175" alt="Captura de Pantalla 2022-11-07 a las 22 12 09" src="https://user-images.githubusercontent.com/115650089/200416427-6a414602-8792-4487-bb77-7cd35bf978b0.png">

NÚMERO DE PELÍCULAS POR GÉNERO

