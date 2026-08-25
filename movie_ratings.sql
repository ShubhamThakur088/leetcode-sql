WITH movie_ratings AS (
    SELECT mvr.user_id, usr.name, COUNT(mvr.movie_id) AS mv_cnt, rating FROM movierating mvr
    JOIN users usr ON usr.user_id = mvr.user_id
    JOIN movies mv ON mv.movie_id = mvr.movie_id
    GROUP BY mvr.user_id
    ORDER BY name),    
    movie_avgs AS (
        SELECT mvr.movie_id, AVG(mvr.rating) AS movie_avg_rate, mv.title FROM movierating mvr
        JOIN users usr ON usr.user_id = mvr.user_id
        JOIN movies mv ON mv.movie_id = mvr.movie_id
        WHERE strftime('%Y-%m', mvr.created_at) = '2020-02'
        GROUP BY mvr.movie_id
        ORDER BY mv.title
    )SELECT movie_ratings.name AS results FROM movie_ratings
		WHERE movie_ratings.mv_cnt = (SELECT MAX(movie_ratings.mv_cnt) FROM movie_ratings) 
		AND movie_ratings.name = (SELECT MIN(movie_ratings.name) FROM movie_ratings)
		UNION ALL
		SELECT movie_avgs.title FROM movie_avgs 
		WHERE 
		movie_avgs.movie_avg_rate = (SELECT MAX(movie_avgs.movie_avg_rate) FROM movie_avgs)
		AND 
		movie_avgs.title = (SELECT MIN(movie_avgs.title) FROM movie_avgs 
                        WHERE movie_avgs.movie_avg_rate = (
                                                SELECT MAX(movie_avgs.movie_avg_rate)
                                                FROM movie_avgs))