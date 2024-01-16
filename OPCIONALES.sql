use netflix;

#I. Cuente los tipos de contenido de la tabla “content”. Muestre la descripción de tipos en el resultado de la consulta.

/**select count(type) as 'Cantidad', type as 'Tipo de contenido' from content
group by type;**/

#II. Seleccionar títulos con duración igual a 90 min, que provengan únicamente de United States. Mostrar listed_in. Ordenar los títulos de menor a mayor.

/**select title_content as 'Título', duration as 'Duración', country as 'País', listed_in as 'Categoría' from content
where country='United States' and duration=90
order by title_content;**/

#III. Realizar una consulta similar a la anterior, en donde el campo ‘country’ contenga a United States o a UNITED STATES y el título listado contenga a ‘Horror Movie’ O HORROR MOVIE.

/**select title_content as 'Título', duration as 'Duración', country as 'País', listed_in as 'Categoría' from content
where country='United States' and duration=90 and listed_in='Horror Movies'
order by title_content;**/

#IV.  Mostar la lista de películas puntuadas 85 o más por Metascore que ganaron el Oscar.

/**select title_oscar as 'Título', metascore as 'Puntuación Metascore' from oscar where metascore>=85 and winner=1 and category='Best picture' order by metascore;**/