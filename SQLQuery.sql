
create database [Student Depression Analysis Tableau];

use [Student Depression Analysis Tableau];

select * from [dbo].[Depression+Student+Dataset];

-- count how many male and female are in data
select gender, count(*) as gender_count from [dbo].[Depression+Student+Dataset]
group by gender;

-- update male as m and female as f
update [dbo].[Depression+Student+Dataset]
set Gender = 'M' where Gender = 'Male';

update [dbo].[Depression+Student+Dataset]
set Gender = 'F' where Gender = 'Female';

-- check for null values in gender column
select * from [dbo].[Depression+Student+Dataset]
where gender is null;

-- check for blank values in gender column
select * from [dbo].[Depression+Student+Dataset]
where gender = '';

-- group the age and get the count of each age
select age, count(*) as age_count from [dbo].[Depression+Student+Dataset]
group by age
order by age desc;

-- get min and max age
select min(age) from [dbo].[Depression+Student+Dataset];
select max(age) from [dbo].[Depression+Student+Dataset];

-- create a new column age group and group the ages
alter table [dbo].[Depression+Student+Dataset]
add Age_Group varchar(max);

select * from [dbo].[Depression+Student+Dataset];

update [dbo].[Depression+Student+Dataset]
set age_group =
case when age between 18 and 24 then 'A1'
else case when age between 25 and 30 then 'A2'
else 'A3' end end;

-- get count of each age group
select age_group, count(*) as age_group_count from [dbo].[Depression+Student+Dataset]
group by age_group;


-- Interprete the data using group by 

select * from INFORMATION_SCHEMA.columns where table_name 
like 'Depression+Student+Dataset'

select Academic_Pressure, count(*) as total from [Depression+Student+Dataset]
group by Academic_Pressure;

select Study_Satisfaction, count(*) as total from [Depression+Student+Dataset]
group by Study_Satisfaction;

select Sleep_Duration, count(*) as total from [Depression+Student+Dataset]
group by Sleep_Duration;

select Dietary_Habits, count(*) as total from [Depression+Student+Dataset]
group by Dietary_Habits;

select Have_you_ever_had_suicidal_thoughts, count(*) as total from [Depression+Student+Dataset]
group by Have_you_ever_had_suicidal_thoughts;

select Study_Hours, count(*) as total from [Depression+Student+Dataset]
group by Study_Hours
order by total desc;

select Financial_Stress, count(*) as total from [Depression+Student+Dataset]
group by Financial_Stress;

select Family_History_of_Mental_Illness, count(*) as total from [Depression+Student+Dataset]
group by Family_History_of_Mental_Illness;

select Depression, count(*) as total from [Depression+Student+Dataset]
group by Depression;


-- create an index to identify the each record
select * from [Depression+Student+Dataset]

alter table [Depression+Student+Dataset]
add Index_Column int identity(1,1)

-- update depression col vals from 0,1 to no, yes
update [Depression+Student+Dataset]
set Depression = 'No' where Depression = '0'

update [Depression+Student+Dataset]
set Depression = 'Yes' where Depression = '1'

-- but first lets covert datatype of depression but first see the datatype of depression col
select * from INFORMATION_SCHEMA.columns where TABLE_NAME LIKE 'Depression+Student+Dataset'
-- its a bit datatype

-- now convert it into varchar
ALTER TABLE [Depression+Student+Dataset]
ALTER COLUMN DEPRESSION VARCHAR(MAX)

-- see the changes again
select * from INFORMATION_SCHEMA.columns where TABLE_NAME LIKE 'Depression+Student+Dataset'

-- now run above two update queries 

select Depression,count(*) as total from [Depression+Student+Dataset] group by Depression

