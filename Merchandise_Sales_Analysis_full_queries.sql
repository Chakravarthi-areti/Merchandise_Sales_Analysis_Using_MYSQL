/* PERCENTAGE SALES OF BOTH MALE AND FEMALE IN MERCHANDISE SALES */


WITH male_sales AS (
    SELECT SUM(Total_Sales) AS tsalM
    FROM merch
    WHERE buyer_gender = 'Male'
),
female_sales AS (
    SELECT SUM(Total_Sales) AS tsalF
    FROM merch
    WHERE buyer_gender = 'Female'
)
SELECT 
    (fs.tsalF * 100.0) / (ms.tsalM + fs.tsalF) AS female_perce,
    (ms.tsalM * 100) / (ms.tsalM + fs.tsalF) as male_perce
    
FROM 
    
    female_sales fs,
    male_sales ms;
    
    
    
/* PERCENTAGE OF SALES FROM EACH LOCATION */

WITH cte1 AS (
    SELECT order_location, SUM(Total_sales) AS tsal
    FROM merch
    GROUP BY order_location
),
cte2 AS (
    SELECT SUM(Total_sales) AS tsal1
    FROM merch
)
SELECT 
    cte1.order_location,
    (cte1.tsal * 100.0) / cte2.tsal1 AS percentage_sales
FROM 
    cte1, cte2;
    
/* sales by month */

SELECT 
    order_location,
    DATE_FORMAT(STR_TO_DATE(order_date, '%Y-%m-%d'), '%Y') AS sales_month,
    SUM(Total_sales) AS monthly_sales
FROM merch
GROUP BY order_location, sales_month
ORDER BY order_location, sales_month;


/* WHICH PRODUCT CATEGORY PERFORM THE BEST */ 

select product_category,sum(Total_sales) as saling_amount
 from merch
 group by 1
 order by sum(Total_sales) desc;
 
 
/* RATING AND REVIEW AFFECTING SALES */

select rating,review,
sum(total_sales) as tsal 
from 
merch 
group by 1,2; 


/* SALES FOR INTERNATIONAL SHIPPING */


SELECT 
    International_Shipping,
    SUM(Total_sales) AS monthly_sales,
    COUNT(*) AS order_count
FROM merch
GROUP BY international_shipping
ORDER BY international_shipping;


/* SALES BY GENDER DEMOGRAPHICS */

SELECT  
    buyer_gender,
    CASE 
        WHEN buyer_age < 25 THEN 'Under 25'
        WHEN buyer_age BETWEEN 25 AND 34 THEN '25-34'
        WHEN buyer_age BETWEEN 35 AND 44 THEN '35-44'
        WHEN buyer_age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+' 
    END AS age_group,
    COUNT(DISTINCT Order_ID) AS num_buyers,
    SUM(Total_sales) AS total_sales
FROM merch 
GROUP BY buyer_gender, age_group;



