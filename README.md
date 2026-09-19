# bike-sales-sql-analysis
SQL analysis project exploring customer purchasing behaviour using the Bike Sales dataset

Overview
This project explores customer demographics and purchasing behaviour using a Bike Sales dataset.
The goal is to uncover insights using SQL analysis, helping identify which customer groups are most likely to purchase a bike.

The dataset includes fields such as income, gender, marital status, occupation, education, commute distance, region, and whether the customer purchased a bike.

This project is ideal for demonstrating SQL skills in:

Data cleaning

Aggregation

Segmentation

Business analysis

Insight generation

# Database Setup

Create Table

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

Importing the CSV
Imported using MySQL Workbench → Table Data Import Wizard.

# Analysis Questions

This project answers real business questions such as:

Which gender buys more bikes?

Which region has the highest purchase rate?

Does income influence bike purchasing?

Which occupations are most likely to buy a bike?

Does commute distance affect bike purchasing?

What age groups buy bikes the most?

Do homeowners buy more bikes?

How does car ownership relate to bike purchasing?


# Key SQL Queries

-- Gender vs Bike Purchasing

SELECT Gender,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Gender;

-- Region Purchase Rates

SELECT Region,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Region;

-- Income Comparison

SELECT 
    ROUND(AVG(REPLACE(REPLACE(Income, '$', ''), ',', ''))) AS avg_income,
    `Purchased Bike`
FROM BikeSales
GROUP BY `Purchased Bike`;

-- Occupation Purchase Rates

SELECT Occupation,
       COUNT(*) AS total,
       SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS purchased,
       ROUND(SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS purchase_rate
FROM BikeSales
GROUP BY Occupation
ORDER BY purchase_rate DESC;

-- 

📈 Insights & Findings
Based on the SQL analysis:

🚹 Gender
Men and women show similar purchase rates, with slight variation depending on region.

🌍 Region
Pacific region shows a noticeably higher bike purchase rate than Europe.

💼 Occupation
Professional and Skilled Manual roles show stronger purchase behaviour.

🚗 Cars
Customers with 0–1 cars are more likely to buy bikes.

🧍 Age
The 30–50 age group is the strongest purchasing segment.

🏠 Home Ownership
Homeowners show slightly higher purchase rates.

💰 Income
Income is not a strong predictor — many high‑income customers did not buy bikes.

🛣 Commute Distance
Short commutes (0–1 miles) correlate strongly with bike purchasing.
