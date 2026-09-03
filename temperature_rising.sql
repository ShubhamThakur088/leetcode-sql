SELECT w1.id FROM weather w1
JOIN weather w2 ON DATE(w1.recorddate) = DATE(w2.recorddate, '+1 day')
WHERE w1.temperature > w2.temperature