WITH total_friends_count AS(SELECT requester_id FROM requestaccepted ra
UNION ALL
SELECT accepter_id FROM requestaccepted ra)
SELECT tfc.requester_id AS id, COUNT(tfc.requester_id) AS num FROM total_friends_count tfc
GROUP BY tfc.requester_id
ORDER BY num DESC LIMIT 1