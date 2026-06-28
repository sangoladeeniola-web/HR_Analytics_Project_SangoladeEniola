SELECT COUNT(*) AS Total_Employees
FROM [HR_Project].[dbo].[HR_Data]

SELECT COUNT(*) AS Active_Employees
FROM [HR_Project].[dbo].[HR_Data]
WHERE termdate IS NULL;

SELECT COUNT(*) AS Former_Employees
FROM [HR_Project].[dbo].[HR_Data]
WHERE termdate IS NOT NULL;

SELECT
    department,
    COUNT(*) AS Employee_Count
FROM [HR_Project].[dbo].HR_Data
GROUP BY department
ORDER BY Employee_Count DESC;

WITH DepartmentStats AS
(
    SELECT
        department,
        COUNT(*) AS Employee_Count
    FROM [HR_Project].[dbo].HR_Data
    GROUP BY department
)
SELECT *
FROM DepartmentStats
ORDER BY Employee_Count DESC;

SELECT
    department,
    COUNT(*) AS Employee_Count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS Department_Rank
FROM [HR_Project].[dbo].HR_Data
GROUP BY department;


  WITH AttritionCTE AS
(
    SELECT
        department,
        COUNT(*) AS Total_Hired,
        SUM(CASE WHEN termdate IS NOT NULL THEN 1 ELSE 0 END) AS Total_Left
    FROM [HR_Project].[dbo].[HR_Data]
    GROUP BY department
)
SELECT
    department,
    Total_Hired,
    Total_Left,
    ROUND(CAST(Total_Left AS FLOAT) / Total_Hired * 100, 2) AS Attrition_Rate_Pct
FROM AttritionCTE
ORDER BY Attrition_Rate_Pct DESC;


SELECT
    department,
    ROUND(AVG(CAST(DATEDIFF(YEAR, hire_date, GETDATE()) AS FLOAT)), 1) AS Avg_Tenure_Years
FROM [HR_Project].[dbo].[HR_Data]
GROUP BY department
ORDER BY Avg_Tenure_Years DESC;


SELECT
    department,
    gender,
    COUNT(*) AS Gender_Count,
    RANK() OVER (PARTITION BY department ORDER BY COUNT(*) DESC) AS Gender_Rank
FROM [HR_Project].[dbo].[HR_Data]
WHERE termdate IS NULL
GROUP BY department, gender
ORDER BY department;


