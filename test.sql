create database test_demo;

use test_demo;
create table students(
	id int    auto_increment primary key,
    name_student varchar(100) not null,
    address varchar(100),
    point double,
    class_name varchar(100) not null
);

insert into students(name_student, address, point, class_name) value("hang", "QN", 10, "lop");

select * from students;

delete from students where id = 1;

drop table students;
