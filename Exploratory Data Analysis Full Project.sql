-- Exploratory Data Analysis Full Project (EDA Process)

-- Makes sure we are using the correct Database and also selects and shows everything
-- from the current database

use world_layoffs;

select * 
from layoffs_staging2;

-- Maximum Total Laid off and Maximum percentage laid off

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

--  Selects everything where there was 100% lay off and sorts them in descending order.

select * 
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;

-- Sum of Laid Off based on Company, Industry, Stage in desc order

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

-- Shows the Date where the data begins and the data ends 

select min(`date`) as Starting_date, max(`date`) as End_Date
from layoffs_staging2;

-- Sum of Total laid off based on each month of the year .

select substring(`date`, 1, 7) as `MONTH` , sum(total_laid_off)
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `MONTH`
order by 1 asc;



-- Rolling Total  CTE (Common Table Expression)

with Rolling_Total as 
(
select substring(`date`, 1, 7) as `MONTH` , sum(total_laid_off) as Total_Off
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `MONTH`
order by 1 asc
)
select `MONTH`,Total_off,
sum(Total_off) over (order by `MONTH` ) as rolling_total
from Rolling_Total;

--

select company,YEAR(`date`) ,sum(total_laid_off)
from layoffs_staging2
group by company, YEAR(`date`)
order by 3 desc;


-- Ranking the Top 5 Companies with Highest number of lay off on the basis of year. 

With  Company_Year (Company, Years, Total_laid_Off) as
(
select company,YEAR(`date`) ,sum(total_laid_off)
from layoffs_staging2
group by company, YEAR(`date`)
), Company_Year_Rank as 
(select * , dense_rank() Over (partition by Years order by Total_laid_Off Desc) as Ranks
from Company_Year
where years is not null
)
select *
from Company_Year_Rank
where Ranks <= 5;


