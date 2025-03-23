![image](https://github.com/user-attachments/assets/56a53dfe-dcff-499b-aaa2-cc325f090823)


# MERCHANDISE SALES ANALYSIS 

# PROBLEM STATEMENT

Lee Chatmen is a popular influencer from the United States with over 7 million Social Media followers. He became famous for his entertaining videos, where he plays popular songs on miniature guitars. In 2023, Lee launched his own line of merchandise. This analysis looks at how his merchandise sales are going and what we can learn from the data.




# Data Table Consists of

| Column Name             | Description |
|-------------------------|-------------|
| **Order_ID**             | Unique identifier for each order |
| **Order_Date**           | Date when the order was placed |
| **Product_ID**           | Unique identifier for each product |
| **Product_Category**     | Category to which the product belongs |
| **Buyer_Gender**         | Gender of the buyer |
| **Buyer_Age**            | Age of the buyer |
| **Order_Location**       | Location where the order was placed |
| **Latitude**             | Latitude coordinate of the order location |
| **Longitude**            | Longitude coordinate of the order location |
| **International_Shipping** | Indicates if the order requires international shipping |
| **Sales_Price**          | Price at which the product was sold |
| **Shipping_Charges**     | Cost incurred for shipping |
| **Sales_per_Unit**       | Sales value per individual unit |
| **Quantity**             | Number of units sold |
| **Total_Sales**          | Total sales value for the order |
| **Rating**               | Customer rating for the product |
| **Review**               | Customer review or feedback |









# Lets's Start Our Analysis 


# 1.Percentage OF Male and Female Users in Customers

**MYSQL QUERY**

```sql

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

```

OUTPUT : 

![image](https://github.com/user-attachments/assets/ee45f997-d3be-4b7a-800b-e3034ee0acbe)


# 2.Percentage of Sales From Each Location 

**MYSQL QUERY**


```sql 


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

```

OUTPUT :

![image](https://github.com/user-attachments/assets/6eca5dad-2154-4d8d-9188-e5eba7e10efa)




# 3. SALES BY MONTH 

**MYSQL QUERY**


```sql 

SELECT 
    order_location,
    DATE_FORMAT(STR_TO_DATE(order_date, '%Y-%m-%d'), '%Y') AS sales_month,
    SUM(Total_sales) AS monthly_sales
FROM merch
GROUP BY order_location, sales_month
ORDER BY order_location, sales_month;

```

OUTPUT :

![image](https://miro.medium.com/v2/resize:fit:462/format:webp/1*VINUCedKJLU8ZUas0wokyg.png)




# 4. WHICH PRODUCT CATEGORY PERFORM THE BEST


**MYSQL QUERIES**

```sql 

select product_category,sum(Total_sales) as saling_amount
 from merch
 group by 1
 order by sum(Total_sales) desc;

```

OUTPUT :

![PRODUCT CATEGORY PERFORM THE BEST](https://miro.medium.com/v2/resize:fit:562/format:webp/1*-RDezWoGpmHsuO5zc9TJ7Q.png)


# RATING AND REVIEW EFFECTING THE SALES

**MYSQL QUERIES**

```sql 


select rating,review,
sum(total_sales) as tsal 
from 
merch 
group by 1,2; 

``` 


OUTPUT : 

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*isVyiVqaHwwlukdQ0GjHZw.png)


# SALES FOR INTERNATIONAL SHIPPING 

**MYSQL QUERIES**

```sql 

SELECT 
    International_Shipping,
    SUM(Total_sales) AS monthly_sales,
    COUNT(*) AS order_count
FROM merch
GROUP BY international_shipping
ORDER BY international_shipping;

``` 

OUTPUT :

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*1LPtSe9iYsv-XWMgGwosow.png)




# AGE DEMOGRAPHICS 

**MYSQL QUERIES**

```sql 

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

```

OUTPUT :

![SALES BY AGE DEMOGRAPHICS](https://miro.medium.com/v2/resize:fit:640/format:webp/1*tJgfdEjznnBSz9xC0TFb1w.png)




# CONCLUSIONS

•The main Problem Occurs during the delivery time it should be done properly in order to ensure a safe product delivery to the Customers this improves the rating and customer satisfaction

•The Number of Sales are actually less for the age in the limit of 35–44 for both men and women , include or introduce new clothes, Accessories so that sales can be increased

•Make sure that international Shipping to be included for all the areas.


































