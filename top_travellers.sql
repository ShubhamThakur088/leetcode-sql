WITH riders_distance_travelled AS (
	SELECT usr.id, usr.name, COALESCE(SUM(rds.distance), 0) AS travelled_distance FROM users usr
	LEFT JOIN rides rds ON rds.user_id = usr.id
	GROUP BY usr.id, usr.name
	ORDER BY travelled_distance DESC, usr.name ASC
	)
	SELECT riders_distance_travelled.name, riders_distance_travelled.travelled_distance FROM riders_distance_travelled