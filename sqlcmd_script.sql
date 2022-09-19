:setvar target_database "school_district"
:setvar source_database "southland_school"
:r "C:\Users\el_du\OneDrive\Documents\GitHub\sqlcmd_demo\sqlcmd_script_southland.sql"
GO

:setvar target_database "school_district"
:setvar source_database "westland_school"
:r "C:\Users\el_du\OneDrive\Documents\GitHub\sqlcmd_demo\sqlcmd_script_southland.sql"
GO

:setvar target_database "school_district"
:setvar source_database "northland_school"
:r "C:\Users\el_du\OneDrive\Documents\GitHub\sqlcmd_demo\sqlcmd_script_northland.sql"


select 
	sc.school_name,
	s.student_name,
	c.course_code,
	c.course_name,
	cg.final_grade
from school_district.dbo.course_grades cg
inner join school_district.dbo.courses c on cg.course_id = c.course_id
inner join school_district.dbo.students s on cg.student_id = s.student_id
inner join school_district.dbo.schools sc on s.school_id = sc.school_id
order by school_name,  course_code, student_name
