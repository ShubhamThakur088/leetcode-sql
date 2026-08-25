SELECT 
    query_name, 
    ROUND(SUM(1.0*rating/position)/COUNT(query_name), 2) AS quality,
    ROUND((1.0*SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)/COUNT(query_name))*100.00, 2) AS poor_query_percentage
FROM queries
GROUP BY query_name