# HR_Analytics_Project_SangoladeEniola
Analyzed 22,214 employee records using SQL Server. Covers workforce overview, attrition rate, tenure, and demographic breakdown across 13 departments. Techniques used: CTEs, JOINs, and Window Functions (RANK, PARTITION BY).
# HR Analytics SQL Project

## Overview
This project analyzes a Human Resources dataset of 22,214 employee records 
using SQL. The goal is to extract meaningful insights about workforce 
composition, department headcount, employee retention, attrition rates, 
tenure, and demographic diversity.

## Dataset
- Source: HR_Data.csv
- Records: 22,214 employees
- Columns: id, name, gender, race, department, jobtitle, 
  location, hire_date, termdate, birthdate

## SQL Techniques Used
- CTEs (Common Table Expressions)
- JOINs (INNER JOIN and LEFT JOIN)
- Window Functions (RANK, ROW_NUMBER, SUM OVER PARTITION BY)
- CASE WHEN for conditional logic
- DATEDIFF for tenure and age calculations
- Aggregate functions (COUNT, SUM, AVG, ROUND)

## Key Analysis
- Workforce overview (total, active, terminated employees)
- Department headcount ranked by size
- Attrition rate per department
- Average employee tenure by department
- Gender and race diversity breakdown

## Tools
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

## Files
- HR_ANALYTICS_COMPLETE.sql — all SQL queries with explanations
- HR_Analytics_Report.docx — written report of findings
