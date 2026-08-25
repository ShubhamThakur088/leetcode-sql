WITH registered_users AS(
        SELECT contest_id, COUNT(reg.user_id) AS enrolled_users FROM register reg
        GROUP BY reg.contest_id
    ),
    users_count AS(
        SELECT COUNT(*) AS total_users FROM users
    )
    SELECT registered_users.contest_id, ROUND((1.0*registered_users.enrolled_users/users_count.total_users)*100 , 2) AS percentage
        FROM registered_users, users_count
        ORDER BY percentage DESC