use student_management;

create table class_students(
	id int auto_increment primary key,
    name_students varchar(100) not null
);

create table teacher(
	id int auto_increment primary key,
    name_teacher varchar(100) not null
);