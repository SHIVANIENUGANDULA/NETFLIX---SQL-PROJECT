-- CREATING TABLE IN DB
create table netflix (
show_id varchar(15),
type varchar(15),
title varchar(150),
director varchar(250),
casts varchar(1000),
country	varchar(100),
date_added	varchar(50),
release_year INT,
rating	varchar(10),
duration varchar(15),
listed_in	varchar(100),
description varchar(250))

-- ADJUSTED NO.OF CHARACTERS IN DATA TYPE
ALTER TABLE netflix
ALTER COLUMN country TYPE VARCHAR(150);

-- IMPORTED THE TABLE VALUES FROM CSV
SELECT COUNT(*) FROM NETFLIX;
SELECT * FROM NETFLIX;


-- Business Problems &  Solutions of 15 business problems

--1. Count the number of Movies vs TV Shows
	 SELECT type, COUNT(type) FROM netflix
	 GROUP BY type;
  
--2. Find the most common rating for movies and TV shows
     SELECT type, rating FROM  
	        (SELECT type, rating, count(rating),
             RANK() OVER (PARTITION BY type ORDER BY count(rating) desc ) AS rank 
		     FROM netflix
			 GROUP BY 1,2 )
     WHERE rank = 1
     GROUP BY 1,2;

--3. List all movies released in a specific year (e.g., 2020)
     SELECT title,release_year 
	FROM netflix
	WHERE release_year = 2020;

--4. Find the top 5 countries with the most content on Netflix
     SELECT UNNEST(STRING_TO_ARRAY(country,','))AS new_country, COUNT(show_id) AS content FROM netflix
	 WHERE country IS NOT NULL
	 GROUP BY 1
	 ORDER BY 2 DESC
	 LIMIT 5;

--5. Identify the longest movie
     SELECT title FROM netflix  
	 WHERE type = 'Movie' AND duration = (SELECT MAX(duration) FROM netflix) 
	 ORDER BY duration
	 LIMIT 1;

--6. Find content added in the last 5 years
     SELECT show_id, title, date_added FROM netflix
	 WHERE date_added ~* '^\d{1,2}-[A-Za-z]{3}-\d{2}$' and 
           TO_DATE(date_added, 'FMDD-Mon-YY') >= CURRENT_DATE - INTERVAL '5 years';

--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
     SELECT title FROM netflix
	 WHERE director ILIKE '%Rajiv Chilaka%';
	 
--8. List all TV shows with more than 5 seasons
     SELECT title, duration FROM netflix
	 WHERE type = 'TV Show' AND SPLIT_PART(duration, ' ', 1)::INT > 5;
	 
--9. Count the number of content items in each genre
     SELECT UNNEST(STRING_TO_ARRAY(listed_in,','))AS genre, COUNT(show_id) FROM netflix
	 GROUP BY 1
	 ORDER BY 2 desc;

--10. Find each year and the average numbers of content release in India on netflix. 
   --return top 5 year with highest avg content release!
     SELECT 
       EXTRACT(YEAR FROM TO_DATE(date_added, 'FMDD-Mon-YY')) AS year,
       COUNT(*) AS total_releases,
	   ROUND((COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM netflix WHERE country ILIKE '%India%')::NUMERIC),3) as avg_releases
     FROM netflix
     WHERE country ILIKE '%India%' 
         AND date_added ~* '^\d{1,2}-[A-Za-z]{3}-\d{2}$'
     GROUP BY year
     ORDER BY total_releases DESC
     LIMIT 5;

--11. List all movies that are documentaries
      SELECT title FROM netflix
	  WHERE listed_in ILIKE '%documentaries%';

--12. Find all content without a director
      SELECT show_id, title FROM netflix
	  WHERE director IS NULL;
	  
--13. Find how many movies actor 'Salman Khan' appeared in last 10 years! 
	  SELECT COUNT(*) FROM netflix
	  WHERE release_year >= EXTRACT(YEAR FROM CURRENT_DATE) - 10 
	  AND type = 'Movie'
	  AND casts ILIKE '%Salman Khan%';
	   
--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
      SELECT UNNEST(STRING_TO_ARRAY(casts,',')), COUNT(title) FROM netflix
	  WHERE  country ILIKE '%India%'
	  GROUP BY 1
	  ORDER BY 2 DESC
	  LIMIT 10;
      
--15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. 
    --Label content containing these keywords as 'Bad' and all other content as 'Good'.
    --Count how many items fall into each category. 
      SELECT 
	   CASE 
	       WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' 
	       THEN 'Bad'
	       ELSE 'Good'
	       END as category, 
	  COUNT(*) as Total
	  FROM netflix
	  GROUP BY 1;
	 




















