
Exploratory Data Analysis (EDA) on Layoffs Data
Project Overview
This repository contains SQL scripts for performing Exploratory Data Analysis (EDA) on the layoffs data from the world_layoffs database. The analysis focuses on understanding key metrics and trends in layoffs, including total layoffs, company rankings, monthly trends, and more. The project involves multiple SQL queries to gather insights from the layoffs_staging2 table, with a focus on the impact of layoffs across different companies, industries, and years.

Key Features
The SQL queries are organized into sections that perform the following tasks:

Database Setup & Initial Data Inspection:

Ensures the correct database is selected (world_layoffs).
Displays all records from the layoffs_staging2 table to inspect the raw data.
Maximum Layoffs:

Finds the maximum number of total layoffs and maximum percentage of layoffs across all records.
100% Layoffs:

Filters records where the percentage of layoffs is 100% and orders them by funds raised, in descending order.
Total Layoffs by Company, Industry, and Stage:

Calculates the total number of layoffs for each company, grouped by company, industry, and stage.
Results are ordered by total layoffs in descending order.
Date Range of Layoffs Data:

Retrieves the starting and ending dates of the layoffs data to understand the time span of available records.
Monthly Layoffs:

Aggregates and sums the total number of layoffs for each month, ordered by month.
Rolling Total of Layoffs:

Uses a Common Table Expression (CTE) to calculate a rolling total of layoffs month by month. This helps track the cumulative layoffs over time.
Total Layoffs by Company and Year:

Groups data by company and year, calculating the total layoffs for each company by year, ordered by the total number of layoffs in descending order.
Ranking Top Companies by Year:

Ranks companies by the total number of layoffs per year using the DENSE_RANK() function.
Retrieves the top 5 companies with the highest number of layoffs each year.
Tools & Technologies
SQL: The project uses SQL to interact with the database and perform various analyses on the layoffs data.
Database: The analysis is performed on the world_layoffs database, which contains the relevant layoffs data in the layoffs_staging2 table.
Requirements
To run the queries in this project, you need:

A SQL Server or compatible relational database management system (RDBMS).
Access to the world_layoffs database and the layoffs_staging2 table.
Basic knowledge of SQL and data analysis techniques.
