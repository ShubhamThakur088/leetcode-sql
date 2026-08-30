SELECT name, bonus FROM bonus b
RIGHT JOIN employee emp ON emp.empid = b.empid
WHERE b.bonus < 1000 OR b.bonus IS NULL