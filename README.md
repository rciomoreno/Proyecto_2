# Proyecto_2

El segundo proyecto, tenía como objetivo limpiar y crear una base de datos de un videoclub en SQL. Los pasos que se han seguido son los siguientes:

LIMPIEZA DE DATOS

En un principio, se nos facilitó una base de datos que consta de 7 tablas:

<img width="683" alt="Captura de Pantalla 2022-11-07 a las 17 45 55" src="https://user-images.githubusercontent.com/115650089/200366612-e6b04a92-11b2-472f-9e09-4088eb200fff.png">

Antes de llevar las tablas al entorno de trabajo de SQL, hubo que limpiarlo, siguiendo los siguientes pasos:

1. Primero, exploré cada una de las tablas para ver su tamaño, tipo de dato, valores nulos, etc. A priori, no parecía que los datos estuvieran excesivamente sucios. 

2. Una vez visto todas las tablas, decidí borrar la columna "last_update" de todas ellas, ya que ésta no aportaba ninguna información relevante. 

3. En la tabla "film", borré la columna "original_language_id", porque consideré que a la hora de alquilar una película, lo importante es saber en qué idiomas está disponible, más allá del idioma original de la misma. Además, podía dar pie a confusión, ya que los id del idioma original y los de los idiomas en los que estaba disponible eran los mismos.

4. Por último, también en la tabla "film", estaba la columna "special_features". En la misma, podíamos ver que cada registro decía si la película en cuestión tenía comentarios, trailers, escenas eliminadas o entre bastidores. Bajo mi punto de vista, el problema con esta columna era que los datos se daban a la vez, es decir, sin ninguna diferenciación entre ellos, por lo que decidí crear 4 columnas (cada una con uno de los elementos que he nombrado) y, en caso de que la película tenga alguno de ellos, se vería "Y" o "N" en caso contrario. Esto facilitaría la búsqueda de películas con cualquiera de estos requerimientos.

<img width="809" alt="Captura de Pantalla 2022-11-07 a las 17 57 27" src="https://user-images.githubusercontent.com/115650089/200369228-b40ca927-60eb-47f1-a0b7-08e482ec6994.png">

RELACIÓN ENTRE TABLAS DE LA BASE DE DATOS

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




