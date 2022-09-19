insert into $(target_database).dbo.schools (school_name) 
values ('$(source_database)')

insert into $(target_database).dbo.courses (school_id, course_level, course_code, course_name)
select
	(select distinct school_id from $(target_database).dbo.schools where school_name = '$(source_database)'),
	case 
		when isnumeric(left(course_code,2)) = 1 then cast(left(course_code,2) as int)
		else cast(left(course_code,1) as int)
	end,
	right(course_code, len(course_code) - case 
		when isnumeric(left(course_code,2)) = 1 then 2
		else 1
	end),
	course_description
from
	$(source_database).dbo.courses

insert into $(target_database).dbo.students (school_id,student_name)
select
	(select distinct school_id from $(target_database).dbo.schools where school_name = '$(source_database)'),
	firstname + ' ' + lastname
from
	$(source_database).dbo.kids

insert into $(target_database).dbo.course_grades (student_id,course_id,final_grade)
select
	ts.student_id,
	tc.course_id,
	g.course_grade as final_grade
from $(source_database).dbo.course_grades g
inner join $(source_database).dbo.kids ss on ss.student_id = g.student_id 
inner join $(target_database).dbo.students ts on ss.firstname + ' ' + lastname = ts.student_name
inner join $(source_database).dbo.courses sc on g.course_id = sc.course_id
inner join $(target_database).dbo.courses tc 
		on tc.course_code = right(sc.course_code,case 
													when isnumeric(left(sc.course_code,2)) = 1 then len(sc.course_code)-2
													else len(sc.course_code)-1
												end) 
		and tc.course_name = sc.course_description 
		and tc.school_id = (select school_id from $(target_database).dbo.schools where school_name = '$(source_database)')
 
