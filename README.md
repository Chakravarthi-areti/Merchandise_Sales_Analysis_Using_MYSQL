

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




























