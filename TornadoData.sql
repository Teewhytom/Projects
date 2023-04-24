SELECT *
FROM tornado_dataset
ORDER BY 4

-- Cleaning date fields

SELECT date, CONVERT(Date, date)
FROM tornado_dataset

ALTER TABLE tornado_dataset
ADD report_date DATE;

UPDATE tornado_dataset
SET report_date = CONVERT(Date, date)

-- Adding Total incidents column for future use

SELECT COUNT(st) AS total_incidents
FROM tornado_dataset


-- Finding total incidents per state

SELECT st, COUNT(st) AS state_total_incidents
FROM tornado_dataset
GROUP BY st
ORDER BY st



-- Finding total deaths in US

SELECT SUM(fat) AS Total_fat
FROM tornado_dataset

-- Finding total deaths by year

SELECT
	yr,
	SUM(fat) as fat_per_yr
FROM tornado_dataset
GROUP BY yr
ORDER BY yr
	
-- Finding total deaths by state

SELECT yr, st, fat
FROM tornado_dataset
WHERE fat > 0
ORDER BY st

-- Finding highest death count by state

SELECT st, SUM(fat) AS Death_by_state
FROM tornado_dataset
GROUP BY st
ORDER BY st 


-- Remove unused columns

SELECT *
FROM tornado_dataset

ALTER TABLE tornado_dataset
DROP Column date







