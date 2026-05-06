create database mall_customers_analysis;

use mall_customers_analysis;

CREATE TABLE mall_customers (
    `CustomerID` INT PRIMARY KEY,
    `Gender` VARCHAR(100),
    `Age` INT,
    `Annual Income` INT,
    `Spending Score` INT,
    `Age Group` VARCHAR(50),
    `Spending Score Category` VARCHAR(50)
);

SELECT 
    `CustomerID`,
    `Gender`,
    `Age`,
    `Annual Income`,
    `Spending Score`,
    
    CASE 
        WHEN `Annual Income` >= 80 AND `Spending Score` >= 70 THEN 'High Value Customers'
        WHEN `Annual Income` >= 50 AND `Spending Score` >= 50 THEN 'Mid Value Customers'
        WHEN `Spending Score` < 40 THEN 'Low Engagement Customers'
        ELSE 'General Customers'
    END AS Customer_Segment
FROM cleaned_mall_customers;

SELECT 
    `Spending Score Category`,
    COUNT(*) AS Total_Customers,
    AVG(`Spending Score`) AS Avg_Spending
FROM cleaned_mall_customers
GROUP BY `Spending Score Category`
ORDER BY Avg_Spending DESC;

SELECT 
    `Age Group`,
    COUNT(*) AS Total_Customers,
    AVG(`Spending Score`) AS Avg_Spending_Score,
    AVG(`Annual Income`) AS Avg_Income
FROM cleaned_mall_customers
GROUP BY `Age Group`
ORDER BY Avg_Spending_Score DESC;

SELECT 
    `Gender`,
    COUNT(*) AS Total_Customers,
    AVG(`Annual Income`) AS Avg_Income,
    AVG(`Spending Score`) AS Avg_Spending_Score
FROM cleaned_mall_customers
GROUP BY `Gender`;

SELECT 
    `CustomerID`,
    `Gender`,
    `Age`,
    `Annual Income`,
    `Spending Score`
FROM cleaned_mall_customers
WHERE `Annual Income` > 70 AND `Spending Score` > 70
ORDER BY `Spending Score` DESC;

SELECT 
    `Age Group`,
    COUNT(*) AS Customer_Count,
    MAX(`Spending Score`) AS Max_Spending,
    MIN(`Spending Score`) AS Min_Spending,
    AVG(`Spending Score`) AS Avg_Spending
FROM cleaned_mall_customers
GROUP BY `Age Group`
ORDER BY Avg_Spending DESC;

SELECT 
    `Spending Score Category`,
    COUNT(*) AS Total_Customers
FROM cleaned_mall_customers
GROUP BY `Spending Score Category`
ORDER BY Total_Customers DESC;

SELECT 
    `Age Group`,
    `Gender`,
    COUNT(*) AS Customers,
    AVG(`Annual Income`) AS Avg_Income,
    AVG(`Spending Score`) AS Avg_Score
FROM cleaned_mall_customers
GROUP BY `Age Group`, `Gender`
ORDER BY Avg_Score DESC;

select*from cleaned_mall_customers;