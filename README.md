
# **E-Commerce Analysis (SQL)**  

## **Overview**  
Analyze sales and customer data to improve product offerings and target customers effectively.  

## **Objective**  
- Identify best-selling products and categories.  
- Examine sales trends and customer preferences.  
- Segment customers based on purchase behavior.  

## **Skills and Tools Used**  
- **Skills**: Subqueries, CTEs, and aggregations.  
- **Tools**: MySQL.  

## **Key Insights**  
- Products driving the most revenue.  
- Seasonal demand trends.  
- Regional sales performance.  

## **Dataset Details**  
- **Source**: Sample e-commerce data.  
- **Contents**:  
  - Product information.  
  - Sales transactions.  
  - Customer demographics.  

## **Sample Queries**  
```sql
-- Top-selling products
SELECT Product_Name, SUM(Sales) AS Total_Sales
FROM Sales_Data
GROUP BY Product_Name
ORDER BY Total_Sales DESC;

-- Seasonal sales trends
SELECT MONTH(Order_Date) AS Month, SUM(Sales) AS Monthly_Sales
FROM Sales_Data
GROUP BY Month
ORDER BY Month;


## **Contact**  
📧 **Mohsin Raza**: mohsinansari1799@gmail.com
