SELECT sgn.user_id, ROUND(
    1.0*SUM(CASE WHEN confirms.action = 'confirmed' THEN 1 ELSE 0 END)/COUNT(sgn.user_id), 2)
    AS confirmation_rate
    FROM signups sgn
LEFT JOIN confirmations confirms ON confirms.user_id = sgn.user_id
GROUP BY sgn.user_id
ORDER BY sgn.user_id