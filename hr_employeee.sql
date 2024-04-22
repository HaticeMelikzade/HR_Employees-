SELECT *
FROM hr_empl;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'hr_empl';



--Total Employee Count--
SELECT Gender, COUNT(*) AS EmployeeNumber
FROM hr_empl
GROUP BY Gender

UNION ALL

SELECT 'Total' AS Gender, COUNT(*) AS EmployeeNumber
FROM hr_empl;


--Attrition Rate by AGE--
SELECT Age,
       Attrition,
       COUNT(*) AS count,
       (COUNT(*) / (SELECT COUNT(*) FROM hr_empl WHERE Attrition = 'Yes')) * 100 AS attrition_rate
FROM hr_empl
WHERE Attrition = 'Yes'
GROUP BY Age, Attrition
ORDER BY COUNT DESC ;

--Attrition Rate by Gender--
SELECT Gender,
       Attrition,
       COUNT(*) AS count
FROM hr_empl
WHERE Attrition = 'Yes'
GROUP BY Gender, Attrition;


-- Attrition Count by Age and Gender --
SELECT 
    Age,
    SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS female_count,
    SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS male_count
FROM 
    hr_empl
GROUP BY 
    Age;


--Attrition Rate with Job Satisfaction--
SELECT 
       CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
      
    END AS JobSatisfaction,
	EmployeeNumber, JobRole, JobLevel,Attrition, Department,Gender
	FROM hr_empl
WHERE Attrition = 'Yes'
ORDER BY JobSatisfaction Desc;

--Attrition Rate by Education--

SELECT 
    CASE Education
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
    END AS Education,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes_count,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no_count
FROM hr_empl
GROUP BY Education
ORDER BY attrition_yes_count DESC;


-- Departments Environment Satisfaction --
SELECT Department,
       AVG(EnvironmentSatisfaction) AS avg_job_environment_satisfaction,
       COUNT(*) AS attrition_yes_count
FROM hr_empl
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY attrition_yes_count DESC;




--by Performance Rating--
SELECT 
    PerformanceRating,
    COUNT(*) AS attrition_count
FROM hr_empl
WHERE Attrition = 'Yes'
GROUP BY PerformanceRating;

--by Distance from home--
SELECT 
    JobRole,
    DistanceFromHome,
    COUNT(*) AS attrition_count
FROM hr_empl
WHERE Attrition = 'Yes'
GROUP BY JobRole, DistanceFromHome
ORDER BY DistanceFromHome DESC;


--average monthly come with education correlation with Attrition--

SELECT 
    CASE Education
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
    END AS Education,
    AVG(MonthlyIncome) AS avg_monthly_income,
    COUNT(*) AS attrition_count
FROM hr_empl
WHERE Attrition = 'Yes'
GROUP BY Education
ORDER BY avg_monthly_income DESC;


--Attrition count based on job involvment--
SELECT 
    CASE JobInvolvement
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS JobInvolvement,
    COUNT(*) AS attrition_count
FROM hr_empl
WHERE Attrition = 'Yes'
GROUP BY JobInvolvement;



-- Attrition Rate by Work-Life Balance --
SELECT 
    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad'
        WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better'
        WHEN 4 THEN 'Best'
    END AS WorkLifeBalance,
    COUNT(*) AS attrition_count
FROM 
    hr_empl
WHERE 
    Attrition = 'Yes'
GROUP BY 
    WorkLifeBalance;


-- Attrition Rate by Relationship Satisfaction --
SELECT 
    CASE RelationshipSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS RelationshipSatisfaction,
    COUNT(*) AS attrition_count
FROM 
    hr_empl
WHERE 
    Attrition = 'Yes'
GROUP BY 
    RelationshipSatisfaction;



-- Attrition Rate by Overall Job Satisfaction --
SELECT 
    CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS JobSatisfaction,
    COUNT(*) AS attrition_count
FROM 
    hr_empl
WHERE 
    Attrition = 'Yes'
GROUP BY 
    JobSatisfaction;
