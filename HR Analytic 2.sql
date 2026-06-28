USE HR_Project;
GO

CREATE TABLE Department_Manager (
    department NVARCHAR(50),
    manager_name NVARCHAR(100)
);


INSERT INTO Department_Manager
VALUES
('Engineering', 'John Smith'),
('Accounting', 'Mary Johnson'),
('Sales', 'David Brown'),
('Human Resources', 'Sarah Wilson'),
('Training', 'Michael Davis');


SELECT
    h.first_name,
    h.last_name,
    h.department,
    d.manager_name
FROM HR_Data h
INNER JOIN Department_Manager d
ON h.department = d.department;


WITH DepartmentStats AS
(
    SELECT
        department,
        COUNT(*) AS Employee_Count
    FROM HR_Data
    GROUP BY department
)

SELECT *
FROM DepartmentStats
ORDER BY Employee_Count DESC;


SELECT
    department,
    COUNT(*) AS Employee_Count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS Department_Rank
FROM HR_Data
GROUP BY department;


WITH DepartmentStats AS
(
    SELECT
        department,
        COUNT(*) AS Employee_Count
    FROM HR_Data
    GROUP BY department
)

SELECT
    ds.department,
    ds.Employee_Count,
    dm.manager_name,
    RANK() OVER (ORDER BY ds.Employee_Count DESC) AS Department_Rank
FROM DepartmentStats ds
LEFT JOIN Department_Manager dm
    ON ds.department = dm.department
ORDER BY Department_Rank;


