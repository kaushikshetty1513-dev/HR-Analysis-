use hr;
#1 Attrition Rate
select concat(round(avg(Att_rate)*100,2),'%') as Attrition_Rate
from hr1;
#2 Average Attrition rate for all Departments
select department , concat(round(avg(Att_rate)*100,2),"%") as average_attrition_Percentage
from hr1
group by department;

#3 Average Hourly rate of Male Research Scientist
select JobRole,gender ,avg(HourlyRate) as Avg_HourlyRate
from hr1
where gender = "Male"  and JobRole = "Research Scientist";

#4 Attrition rate Vs Monthly income stats
select case when h2.MonthlyIncome<2000 then "Below 2k"
when h2.MonthlyIncome between 2000 and 4999 then '2k-4.9k'
when h2.MonthlyIncome between 5001 and 7999 then '5k-7.9k'
else 'Above 8k'
end as Income_Group, concat(round(avg(h1.Att_rate)*100,2),"%") as average_attrition_Percentage
from hr1 h1 join hr2 h2 on
h1.EmployeeNumber = h2.`Employee ID`
group by Income_Group
order by Income_group ;

#5 Average working years for each Department
select h1.department , round(avg(h2.TotalWorkingYears),2) as Avg_Years_Of_Department
from hr1 h1 join hr2 h2 on
h1.EmployeeNumber = h2.`Employee ID`
group by h1.Department;

#6 Job Role Vs Work life balance
SELECT h1.JobRole,ROUND(AVG(h2.WorkLifeBalance), 2) AS Avg_WorkLifeBalance_Score,concat(ROUND(AVG(h1.Att_rate)*100, 2),"%") AS ATT_Rate
FROM hr1 h1 join hr2 h2 on 
h1.EmployeeNumber = h2.`Employee ID`
GROUP BY JobRole;

#7 Attrition rate Vs Year since last promotion relation
select case when h2.YearsSinceLastPromotion between 1 and 10 then '1-10 Years'
when h2.YearsSinceLastPromotion between 11 and 20 then '11-20 Years' 
when h2.YearsSinceLastPromotion between 21 and 30 then '21-30 Years'
when h2.YearsSinceLastPromotion between 31 and 40 then '31-40 Years'
else 'Above 40 Years'
end as Year_Group, concat(ROUND(AVG(h1.Att_rate)*100, 2),"%") AS ATT_Rate
from hr1 h1 join hr2 h2 on
h1.EmployeeNumber = h2.`Employee ID`
group by Year_Group
order by Year_Group;





