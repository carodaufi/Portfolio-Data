use netflix;

/**SELECT
    COUNT(CASE WHEN rotten_tomatoes IS NOT NULL THEN 1 END) AS no_nulos,
    COUNT(CASE WHEN rotten_tomatoes = '' THEN 1 END) AS vacios,
    COUNT(CASE WHEN rotten_tomatoes IS NULL THEN 1 END) AS nulos,
    COUNT(DISTINCT rotten_tomatoes) AS distintos
FROM oscar;**/

#A. Seleccionar los títulos con runtime superior a 90 y lenguaje Francés. Incluir el tipo de contenido. Ordenar los títulos de menor a mayor.

/**select c.title_content as 'Título', p.runtime as 'Duración', p.language as 'Lenguaje', c.type as 'Tipo'
from production p 
inner join content c on p.id_content=c.id_content 
where runtime>90 AND language='French'
order by p.runtime;**/

#B. Seleccionar aquellos títulos que posean director y país de origen. Filtrar por aquellas que tengan un Runtime mayor a 70. Ordenar los títulos de manera ascendente.

/**select c.title_content as 'Título', c.director as 'Director', c.country as 'País de origén', p.runtime as 'Duración' 
from content c
inner join production p on c.id_content=p.id_content
where director is not null and country is not null and runtime>70
order by runtime;**/

#C. Sume el Runtime de las películas que tengan como único país de origen United States, India, Japan, Spain y Mexico, discriminando y ordenando por país. Incluya la columna género.

/**select sum(p.runtime) as 'Duración total',c.country as 'País', p.genre as 'Género' from production p
inner join content c on p.id_content=c.id_content
where c.country in ('United States', 'India', 'Japan', 'Spain', 'Mexico') and c.type='Movie'
group by country;**/

#D. Mostrar las películas clasificadas como drama por netflix, que hayan ganado el Oscar entre 2010 y 2020 y que estén en esta plataforma

/**select c.title_content as 'Título', c.listed_in as 'Género', o.year_ceremony as 'Año de ceremonia' from content c 
inner join oscar o on c.id_content=o.id_content
where c.listed_in='Dramas' and o.winner=1 and o.year_ceremony between 2010 and 2020
group by c.title_content
order by o.year_ceremony;**/

#E. Seleccionar el título y el género de las películas puntuadas por IMDB entre 7 y 9. Obtener los títulos en idioma inglés.

/**select c.title_content as 'Título', c.listed_in as 'Género', o.imdb as 'Puntuación IMDB' from content c
inner join oscar o on c.id_content=o.id_content
where o.imdb between 7 and 9 and c.country in('United States', 'United Kingdom') 
group by c.title_content
order by o.imdb;**/

#F. Cuente la cantidad de títulos de cada género de la tabla productions. Ordene de manera descendente por las cantidades y ascendente por el género.

/**select count(title_production) as 'Total de películas', genre as 'Género' from production
group by genre
order by count(title_production) DESC, genre ASC;**/

#G. Analizar la relación entre Budget y Box Office. Calcular el ratio Budget/Box Office para las peliculas con un puntaje IMDB entre 7 y 9, sin mostrar nulos y no repetidos.

/**select title_oscar as 'Título',imdb as 'IMDB', budget as 'Presupuesto', box_office as 'Taquilla',  round((budget_x_million/box_office_x_million),2) as 'Ratio' 
from oscar
where imdb between 7 and 9 and round((budget_x_million/box_office_x_million),2) is not null
group by title_oscar;**/

#H. Obtener las películas que ganaron el Oscar a Best Picture, ordenadas de manera descendente por año ganador.

/**select title_oscar as 'Película ganadora', category as 'Categoría', year_ceremony as 'Año de ceremonia' 
from oscar
where category='Best Picture' and winner=1
order by year_ceremony DESC;**/

#I. Mostrar el título y el año de ceremonia de los oscar para las peliculas puntuadas por IMDB entre 7 y 9. Ordenarlos alfabéticamente por títulos y de mayor a menor por año de ceremonia.

/**select title_oscar as 'Título', year_ceremony as 'Año de ceremonia', imdb as 'IMDB'
from oscar
where imdb between 7 and 9
group by title_oscar
order by year_ceremony DESC, title_oscar;**/

#J. Mostrar una lista de las películas originales de netflix ganadoras del oscar (si las hubiera) mostrando las columnas title, category, genre runtime, el imdb_score, la premiere y el año de la ceremonia.

/**select p.title_production as 'Título', o.category as 'Categoría', p.genre as 'Género', p.runtime as 'Duración', p.imdb_score as 'IMDB', p.premiere as 'Premiere', o.year_ceremony as 'Año de ceremonia'
from production p
inner join oscar o on p.id_content=o.id_content
where winner=1;**/

#K. Mostrar una lista de las nominaciones al oscar de películas originales de netflix (si las hubiera) que no fueron ganadoras del premio,mostrando las columnas título, category y año de la ceremonia.

/**select p.title_production as 'Título', o.category as 'Categoría', year_ceremony as 'Año de ceremonia'
from production p 
inner join oscar o on p.id_content=o.id_content
where o.winner=0;**/

