USE quan_ly_sinh_vien;

SELECT * FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

SELECT Sub.* FROM Subject Sub
JOIN Mark M ON Sub.Sub_Id = M.Sub_Id
WHERE M.Mark = (SELECT MAX(Mark) FROM Mark);

SELECT S.Student_Id, S.Student_Name, S.Class_Id,
    AVG(M.Mark) AS DiemTrungBinh
FROM Student S
JOIN Mark M ON S.Student_Id = M.Student_Id
GROUP BY S.Student_Id, S.Student_Name, S.Class_Id
ORDER BY DiemTrungBinh DESC;