use netflix;

#describe content;
#describe production;
#select count(*) from content;
#select count(*) from production;


/**SELECT
    COUNT(CASE WHEN language IS NOT NULL THEN 1 END) AS no_nulos,
    COUNT(CASE WHEN language = '' THEN 1 END) AS vacios,
    COUNT(CASE WHEN language IS NULL THEN 1 END) AS nulos,
    COUNT(DISTINCT runtime) AS distintos
FROM production**/


#Listar todos los registros de la tabla, visualizando las columnas type, title_content, country, rating, duration, listed_in.
#select type as "Tipo", title_content as "Título", country as "País", rating as "Clasificación", duration as "Duración", listed_in as "Etiqueta" from content;


#Mostrar todas las filas de la tabla, presentando las columnas id_content, title_production, genre, runtime, imdb_Score.
#select id_content as "Referencia", title_production as "Título", genre as "Género", runtime as "Duración", imdb_Score as "Puntuación IMDB" from production;


#Generar un listado de todas las películas en las que participe Argentina, mostrando las columnas id_content, type, title_content, director, cast, rating, duration, listed_in.
#select id_content as "ID", type as "Tipo", title_content as "Título", director as "Director", cast as "Reparto", rating as "Clasificación", duration as "Duración", listed_in as "Etiqueta" from content where country="Argentina";


#Presentar un listado con las columnas id_production, title_production, genre, language, imdb_score de los registros de la tabla en las que el imdb_score sea superior a 7.5.
#select id_production as "ID", title_production as "Título", genre as "Género", language as "Lenguaje", imdb_score as "Puntuación IMDB" from production where imdb_score>7.5;


# Mostrar las columnas id_content, type, title_content, listed_in de los registros en los que el rating público general o admitido para todas las edades
#select id_content as "ID", type as "Tipo", title_content as "Título", listed_in as "Etiqueta" from content where rating="TV-PG" or rating="PG" or rating="G";


#Obtener una lista con las columnas id_production, title_production, genre de los registros en que duration sea menor o igual a 105 minutos pero que además tenga una duración de al menos 60 minutos
#select id_production as "ID", title_production as "Título", genre as "Género" from production where runtime between 60 and 150;


# Obtener la cantidad de registros discriminando por type y rating, ordenados alfabéticamente por rating y por type.
#select count(*) as "Total",type as "Tipo",rating as "Clasificación" from content group by rating,type;


#Mostrar la cantidad  de películas en los idiomas portugués, francés, alemán, italiano y español, ordenados por cantidad, de mayor a menor.
/**select count(c.type='Movie') as "Total de películas", p.language as "Lenguaje" 
from production p 
inner join content c on p.id_content=c.id_content 
where language in ('Portuguese','French','German','Italian','Spanish') 
group by language 
order by count(c.type) DESC;**/



 select * from content;