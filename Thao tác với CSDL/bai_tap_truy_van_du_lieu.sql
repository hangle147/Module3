use quan_ly_sinh_vien;

SELECT * FROM Student
WHERE LOWER(Student_Name) LIKE 'h%';

SELECT * FROM Class
WHERE MONTH(StartDate) = 12;

SELECT * FROM Subject
WHERE Credit BETWEEN 3 AND 5;

UPDATE Student SET Class_Id = 2
WHERE Student_Name = 'Hung';

SELECT S.Student_Name, Sub.Sub_Name, M.Mark FROM Student S
JOIN Mark M ON S.Student_Id = M.Student_Id
JOIN Subject Sub ON M.Sub_Id = Sub.Sub_Id
ORDER BY M.Mark DESC, S.Student_Name ASC;
