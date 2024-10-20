select  * from stackoverflow.dbo.survey_resultss
where responseid = 1;


WITH duplicate AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Q120, MainBranch, Age, Employment, RemoteWork, CodingActivities, 
                                     EdLevel, LearnCode, LearnCodeOnline, LearnCodeCoursesCert, YearsCode, YearsCodePro, 
                                     DevType, OrgSize, PurchaseInfluence, TechList, Country, Currency, CompTotal, 
                                     DatabaseHaveWorkedWith, TBranch, ICorPM, WorkExp, ProfessionalTech, Industry, 
                                     ConvertedCompYearly 
                             ORDER BY ResponseId) AS RowNumber
    FROM stackoverflow.dbo.survey_resultss
)
DELETE FROM duplicate WHERE RowNumber > 1;

select max( convertedcompyearlyint)as maxindustry  ,industry  from stackoverflow.dbo.survey_resultss
group by industry


alter table stackoverflow.dbo.survey_resultss
add convertedcompyearlyint bigint;

update stackoverflow.dbo.survey_resultss
set convertedcompyearlyint = try_cast(convertedCompyearly as int)

select avg( convertedcompyearlyint)from stackoverflow.dbo.survey_resultss

select employment, remotework  from stackoverflow.dbo.survey_resultss
where remotework = 'remote'
group by employment, remotework

SELECT LearnCode, COUNT(*) AS OccurrenceCount
FROM stackoverflow.dbo.survey_resultss
GROUP BY LearnCode
ORDER BY OccurrenceCount DESC;



select YearsCode,currency,convertedcompyearlyint from stackoverflow.dbo.survey_resultss
where yearscode !='na'and currency !='na'and convertedcompyearlyint !=0


with headcount as(

select Employment, Edlevel , count(*)edcount from stackoverflow.dbo.survey_resultss
where Edlevel !='na'and Edlevel = 'Master’s degree (M.A., M.S., M.Eng., MBA, etc.)'
group by Employment, Edlevel 
)

select count(*) from headcount








---TASK 1
--Comapnies or industry developers get paid most
select max( convertedcompyearlyint)as maxcomp ,industry 
    into maxindustrycompensation
     from stackoverflow.dbo.survey_resultss
group by industry


select * from maxindustrycompensation
order by maxcomp desc




--Task2
--How much does remote working matter to employees
select employment, remotework 
into remoteemployment
   from stackoverflow.dbo.survey_resultss
           where remotework = 'remote'
              group by employment, remotework

--Task3
--How does coding experience affect the level of pay
select YearsCode,currency,convertedcompyearlyint 
         into codepay
from stackoverflow.dbo.survey_resultss
where yearscode !='na'and currency !='na'and convertedcompyearlyint !=0

--Task4
---Most popular method of learning to code

select LearnCode , count(*) occurencecount
  into mostusedlearningmethod
from stackoverflow.dbo.survey_resultss
group by LearnCode
order by  occurencecount desc


--Task5
--How does getting a master gives you an upper hand in getting developer jobs


with headcount as(

select Employment, Edlevel , count(*)edcount from stackoverflow.dbo.survey_resultss
where Edlevel !='na'and Edlevel = 'Master’s degree (M.A., M.S., M.Eng., MBA, etc.)'
group by Employment, Edlevel 
)






 
 
--case 
--when convertedcompyearly = 'na' then 0
--else convertedcompyearly

--end 



