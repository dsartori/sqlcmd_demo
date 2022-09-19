insert into $(target_database).dbo.schools (school_name) 
values ('$(source_database)')

insert into $(target_database).dbo.courses (school_id,course_level, course_code, course_name)
select
	(select distinct school_id from $(target_database).dbo.schools where school_name = '$(source_database)'),
	class_level,
	left(class_name,charindex('-',class_name)-1),
	right(class_name,len(class_name)-charindex('-',class_name))
from
	$(source_database).dbo.classes

insert into $(target_database).dbo.students (school_id,student_name)
select
	(select distinct school_id from $(target_database).dbo.schools where school_name = '$(source_database)'),
	student_name
from
	$(source_database).dbo.students

insert into $(target_database).dbo.course_grades (student_id,course_id,final_grade)
select
	ts.student_id,
	tc.course_id,
	(g.midterm_exam + g.final_exam) / 2 as final_grade
from $(source_database).dbo.grades g
inner join $(source_database).dbo.students ss on ss.student_id = g.student_id
inner join $(target_database).dbo.students ts on ss.student_name = ts.student_name
inner join $(source_database).dbo.classes sc on g.class_id = sc.class_id 
inner join $(target_database).dbo.courses tc on tc.course_code + '-' + tc.course_name = sc.class_name and tc.school_id = (select school_id from $(target_database).dbo.schools where school_name = '$(source_database)')
