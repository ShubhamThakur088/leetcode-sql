SELECT std_details.student_id,
    std_details.student_name,
    std_details.subject_name,
    COUNT(exams.student_id) AS attended_exams
    FROM (SELECT
    student_id,
    student_name,
    subject_name
    FROM students stds CROSS JOIN subjects subs) AS std_details
    LEFT JOIN examinations exams ON exams.student_id = std_details.student_id
                                    AND std_details.subject_name = exams.subject_name
    GROUP BY std_details.student_id, std_details.student_name, std_details.subject_name