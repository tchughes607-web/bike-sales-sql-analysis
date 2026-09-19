-- Bike Sales Project

CREATE TABLE BikeSales (
    ID INT,
    MaritalStatus VARCHAR(20),
    Gender VARCHAR(10),
    Income VARCHAR(20),
    Children INT,
    Education VARCHAR(50),
    Occupation VARCHAR(50),
    HomeOwner VARCHAR(5),
    Cars INT,
    CommuteDistance VARCHAR(20),
    Region VARCHAR(20),
    Age INT,
    PurchasedBike VARCHAR(5)
);

-- Import Data -- 

SELECT * FROM bikesales;

-- Clean up income -- 

SELECT 
    ID,
    REPLACE(REPLACE(Income, '$', ''), ',', '') AS IncomeClean
FROM BikeSales
LIMIT 10;

-- Who buys bikes more: men or women

SELECT Gender,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Gender
ORDER BY purchase_rate DESC;

-- Which region has the highest bike purchase rate?

SELECT Region,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Region
ORDER BY purchase_rate DESC;

-- Does income affect bike purchasing?

SELECT 
    ROUND(AVG(REPLACE(REPLACE(Income, '$', ''), ',', ''))) AS avg_income,
    `Purchased Bike`
FROM BikeSales
GROUP BY `Purchased Bike`;

-- Which occupations buy bikes the most?

SELECT Occupation,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       COUNT(*) AS total,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Occupation
ORDER BY purchase_rate DESC;

-- Does commute distance influence bike purchasing

SELECT `Commute Distance`,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY `Commute Distance`
ORDER BY purchase_rate DESC;

-- Age profile of bike purchasers

SELECT 
    MIN(Age) AS youngest,
    MAX(Age) AS oldest,
    ROUND(AVG(Age), 1) AS avg_age
FROM BikeSales
WHERE `Purchased Bike` = 'Yes';

-- Bike purchases by marital status

SELECT `Marital Status`,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY `Marital Status`
ORDER BY purchase_rate DESC;

-- Do homeowners buy more bikes?

SELECT `Home Owner`,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY `Home Owner`;

-- Number of cars vs bike purchasing

SELECT Cars,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Cars
ORDER BY Cars;

-- Education level and bike purchasing

SELECT Education,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Education
ORDER BY purchase_rate DESC;

-- High‑income customers who did NOT buy a bike

SELECT *
FROM BikeSales
WHERE REPLACE(REPLACE(Income, '$', ''), ',', '') > 100000
  AND `Purchased Bike` = 'No';
  
  -- Average income by region
  
  SELECT Region,
       ROUND(AVG(REPLACE(REPLACE(Income, '$', ''), ',', ''))) AS avg_income
FROM BikeSales
GROUP BY Region
ORDER BY avg_income DESC;

  -- Children vs bike purchasing
  
SELECT Children,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Children
ORDER BY Children;

-- Age brackets (CASE)

SELECT 
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30–50'
        ELSE '50+'
    END AS age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
    ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY age_group
ORDER BY purchase_rate DESC;

-- Who buys bikes the most? (full profile)

SELECT Gender, Region, Occupation, Education,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Gender, Region, Occupation, Education
ORDER BY purchase_rate DESC
LIMIT 10;

