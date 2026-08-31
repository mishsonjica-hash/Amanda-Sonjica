---Code for all Tested Hyphothesis: Details and Findings can be found  in the ---

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---hypothesis 1: Total Revenue has not only droped for Western Cape but has droped for all Provinces
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
WITH Store_Fixed AS (
    SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
),
Max_Revenue as (
  SELECT 
    YEAR(t.transaction_date) AS Year,
    s.province AS province,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN customers_1 c ON t.customer_id = c.customer_id
  JOIN stores s ON t.store_id = s.store_id
  where s.province IN ('Western Cape', 'Gauteng', 'KwaZulu-Natal', 'Eastern Cape') AND Month(t.transaction_date) BETWEEN '1' AND '6'
  GROUP BY YEAR(t.transaction_date), s.province
)
Select
y1.province AS province,
y1.Total_Revenue AS Revenue_2024,
y2.Total_Revenue AS Revenue_2025,
ROUND(((y2.Total_Revenue - y1.Total_Revenue) / y1.Total_Revenue) * 100, 2) AS Change_Revenue_Percentage
FROM Max_Revenue y1
CROSS JOIN Max_Revenue y2
WHERE y1.Year = 2024 AND y2.Year = 2025 AND y1.province = y2.province
ORDER BY Revenue_2024 DESC

----Hyphothesis incorrect: Revenue drop only occured in Western Cape by 5.6% while the rest of the other provinces, the revenue increased.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---hypothesis 2: Western Cape had a drop in revenue because of drop in Transaction count. This means customers are not purchasing as much products in 2025 than in 2024
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Testing for Revenue + Transaction Count by Province
WITH Store_Fixed AS (
    SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
),
Max_Revenue as (
  SELECT 
    YEAR(t.transaction_date) AS Year,
    s.province AS province,
    Count(ti.item_id) AS Count_of_transactions, SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN customers_1 c ON t.customer_id = c.customer_id
  JOIN stores s ON t.store_id = s.store_id
  where s.province IN ('Western Cape', 'Gauteng', 'KwaZulu-Natal', 'Eastern Cape') AND Month(t.transaction_date) BETWEEN '1' AND '6'
  GROUP BY YEAR(t.transaction_date), s.province
)
Select
y1.province AS province,
y1.Count_of_transactions AS Count_2024,
y1.Total_Revenue AS Revenue_2024,
y2.Count_of_transactions AS Count_2025,
y2.Total_Revenue AS Revenue_2025,
ROUND(y2.Total_Revenue - y1.Total_Revenue) AS Revenue_Change,
ROUND(((y2.Total_Revenue - y1.Total_Revenue) / y1.Total_Revenue) * 100, 2) AS Change_Revenue_Percentage,
ROUND(((y2.Count_of_transactions - y1.Count_of_transactions) / y1.Count_of_transactions) * 100, 2) AS Change_count_Percentage
FROM Max_Revenue y1
CROSS JOIN Max_Revenue y2
WHERE y1.Year = 2024 AND y2.Year = 2025 AND y1.province = y2.province
ORDER BY Revenue_2024 DESC 

---Hypothesis correct: The revenue drop of Western Cape was influenced by the drop Transcation count from 2024 and 2026. This means customers are not purchasing products as much as they did in 2024.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---Hypothesis 3: Loyalty Tier plays a role in Revenue drop by Province
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Track how the loyalty tiers have played a role in the decrease of revenue between 2024 and 2025

---**Gold**
WITH Store_Fixed AS (
    SELECT 
        store_id,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
)
SELECT
    c.loyalty_tier,
    s.province AS Province,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue, Count(c.loyalty_tier) AS Tier_Count
FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN customers_1 c ON t.customer_id = c.customer_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  WHERE YEAR(t.transaction_date) = 2024 AND c.loyalty_tier = "Gold" AND Month(t.transaction_date) BETWEEN '1' AND '6'
  GROUP BY s.province, c.loyalty_tier
  ORDER BY c.loyalty_tier, Total_Revenue DESC

---**Silver**
WITH Store_Fixed AS (
    SELECT 
        store_id,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
)
SELECT
    c.loyalty_tier,
    s.province AS Province,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue, Count(c.loyalty_tier) AS Tier_Count
FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN customers_1 c ON t.customer_id = c.customer_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  WHERE YEAR(t.transaction_date) = 2024 AND c.loyalty_tier = "Silver" AND Month(t.transaction_date) BETWEEN '1' AND '6'
  GROUP BY s.province, c.loyalty_tier
  ORDER BY c.loyalty_tier, Total_Revenue DESC

---**Bronze**

WITH Store_Fixed AS (
    SELECT 
        store_id,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
)
SELECT
    c.loyalty_tier,
    s.province AS Province,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue, Count(c.loyalty_tier) AS Tier_Count
FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN customers_1 c ON t.customer_id = c.customer_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  WHERE YEAR(t.transaction_date) = 2024 AND c.loyalty_tier = "Bronze" AND Month(t.transaction_date) BETWEEN '1' AND '6'
  GROUP BY s.province, c.loyalty_tier
  ORDER BY c.loyalty_tier, Total_Revenue DESC

---Combined: All Loyalty Tiers by Province (2024 vs 2025 with % Change)
WITH Store_Fixed AS (
    SELECT 
        store_id,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
),
tier_revenue_by_year AS (
    SELECT
        YEAR(t.transaction_date) AS Year,
        c.loyalty_tier,
        s.province,
        SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue,
        COUNT(c.loyalty_tier) AS Tier_Count
    FROM transactions t
    JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
    JOIN customers_1 c ON t.customer_id = c.customer_id
    JOIN Store_Fixed s ON t.store_id = s.store_id
    WHERE YEAR(t.transaction_date) IN (2024, 2025) AND Month(t.transaction_date) BETWEEN '1' AND '6'
    GROUP BY YEAR(t.transaction_date), s.province, c.loyalty_tier
)
SELECT 
    y1.loyalty_tier,
    y1.province,
    y1.Total_Revenue AS Revenue_2024,
    y1.Tier_Count AS Tier_Count_2024,
    y2.Total_Revenue AS Revenue_2025,
    y2.Tier_Count AS Tier_Count_2025,
    ROUND(y2.Total_Revenue - y1.Total_Revenue) AS Revenue_Change,
    ROUND(((y2.Total_Revenue - y1.Total_Revenue) / y1.Total_Revenue) * 100, 2) AS Change_Percentage,
    ROUND(y2.Tier_Count - y1.Tier_Count) AS Customer_transaction_count_Loss
FROM tier_revenue_by_year y1
JOIN tier_revenue_by_year y2 ON y1.loyalty_tier = y2.loyalty_tier AND y1.province = y2.province
WHERE y1.Year = 2024 AND y2.Year = 2025 AND y1.province = y2.province 
ORDER BY y1.loyalty_tier, Revenue_2024 DESC 

----Key Findings:
1. Silver tier lost the most customers transactions and Revenue overall (145 transactions and 10.46% recenue drop in Western Cape alone) followed by Bronze tier.

2. Western Cape is the epicenter of customer transaction churn — ALL three tiers in Western Cape show decline in Revenue and customer Transaction count while other provinces have had an increase.

3. Silver tier had the worst revenue decline (10.46% in Western Cape), despite having customers in that tier compared to Gold and Bronze

4. Total Western Cape customer transaction losses: 241 customers across all tiers (90 Bronze + 145 Silver + 6 Gold)

    ----Hyyphothesis Correct: Customer Tier has influenced revenue change. The customers in Silver tier in Western Cape have lost the most revenue and transation count in 2025.
       

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---Hypothesis 4: Average Transaction Value also influenced the decline in Revenue in Western Cape because customer are spending less amount of money per transaction
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Select *
From transaction_items

Select *
From transactions

Select *
From stores

---Compare average transaction value (spend per transaction) between 2024 and 2025 for Western Cape
WITH Store_Fixed AS (
    SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
),
transaction_metrics AS (
  SELECT 
    YEAR(t.transaction_date) AS Year,
    s.store_id AS Store_ID,
    s.store_name AS Store_Name,
    s.province AS Province,
    COUNT(DISTINCT t.transaction_id) AS Transaction_Count,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  WHERE s.province = 'Western Cape' AND Month(t.transaction_date) BETWEEN '1' AND '6'
  GROUP BY YEAR(t.transaction_date), s.store_id, s.store_name, s.province)
SELECT
  y1.Year AS Year_2024,
  y1.Store_ID,
  y1.Total_Revenue AS Revenue_2024,
  ROUND(y1.Total_Revenue / y1.Transaction_Count, 2) AS Avg_Transaction_Value_2024,
  y2.Year AS Year_2025,
  y2.Total_Revenue AS Revenue_2025,
  ROUND(y2.Total_Revenue / y2.Transaction_Count, 2) AS Avg_Transaction_Value_2025,
    ROUND((((y2.Total_Revenue / y2.Transaction_Count) - (y1.Total_Revenue / y1.Transaction_Count)) / (y1.Total_Revenue / y1.Transaction_Count)) * 100, 2) AS Avg_Transaction_Value_Change_Pct,
  ROUND(y2.Total_Revenue - y1.Total_Revenue) AS Revenue_Change,
  ROUND(((y2.Total_Revenue - y1.Total_Revenue) / y1.Total_Revenue) * 100, 2) AS Revenue_Change_Pct,
  ROUND((y2.Total_Revenue / y2.Transaction_Count) - (y1.Total_Revenue / y1.Transaction_Count), 2) AS Avg_Transaction_Value_Change
FROM transaction_metrics y1
CROSS JOIN transaction_metrics y2
WHERE y1.Year = 2024 AND y2.Year = 2025 AND y1.Store_ID = y2.Store_ID
ORDER BY Revenue_Change_Pct ASC 

Key Findings: The average transaction spend declined from 2024 to 2025 for Select few stores: S002, S007, S011, S012, S009 AND S005 in Western Cape with exception of Store S003 that experienced 10.66% Revenue decline despite getting an increase of 12.25% of Transaction value. This means that some customers are spending less or buying cheaper products per transaction in 2025 compared to 2024. 

Hyphothesis not entirely true for all Stores in Western Cape. Most stores experienced drop in Revenue because customer are spending less amount per transaction in 2025 but stores were not positively affeceted by avaerage transaction amount. Overall I can conclude that average transaction amount does not affect revenue change.

Additional Test Done to determine what influences Revenue change

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---Repeat customer rate - Customers with more than 1 transaction count - No effect of repeat customers
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----Customers with more than 1 repeat transaction in Western Cape to see how it affects the revenue and transaction value.

---**2024
WITH Store_Fixed AS (
  SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
),
Customer_transaction AS (
  SELECT 
    c.customer_id,
    s.province,
    Count(DISTINCT t.transaction_id) AS transaction_count
  FROM transactions t
  JOIN customers_1 c ON t.customer_id = c.customer_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  WHERE YEAR(t.transaction_date) = 2024 AND s.province = 'Western Cape'
    GROUP BY c.customer_id, s.province, c.loyalty_tier
)
SELECT
    CASE
        WHEN transaction_count = 1     THEN 'One-time'
        WHEN transaction_count BETWEEN 2 AND 4  THEN 'Occasional (2-4)'
        WHEN transaction_count BETWEEN 5 AND 10 THEN 'Regular (5-10)'
        ELSE 'Loyal (10+)'
  END AS Customer_Type,
    COUNT(*)  AS customers,
    province, 
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_base
FROM Customer_transaction
GROUP BY Customer_Type, province
ORDER BY
    CASE Customer_Type
        WHEN 'One-time'        THEN 1
        WHEN 'Occasional (2-4)' THEN 2
        WHEN 'Regular (5-10)'   THEN 3
        ELSE 4
    END----2024

---**2025
 WITH Store_Fixed AS (
  SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
),
Customer_transaction AS (
  SELECT 
    c.customer_id,
    s.province,
    Count(DISTINCT t.transaction_id) AS transaction_count
  FROM transactions t
  JOIN customers_1 c ON t.customer_id = c.customer_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  WHERE YEAR(t.transaction_date) = 2025 AND s.province = 'Western Cape'
    GROUP BY c.customer_id, s.province, c.loyalty_tier
)
SELECT
    CASE
        WHEN transaction_count = 1     THEN 'One-time'
        WHEN transaction_count BETWEEN 2 AND 4  THEN 'Occasional (2-4)'
        WHEN transaction_count BETWEEN 5 AND 10 THEN 'Regular (5-10)'
        ELSE 'Loyal (10+)'
  END AS Customer_Type,
    COUNT(*)  AS customers,
    province, 
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_base
FROM Customer_transaction
GROUP BY Customer_Type, province
ORDER BY
    CASE Customer_Type
        WHEN 'One-time'        THEN 1
        WHEN 'Occasional (2-4)' THEN 2
        WHEN 'Regular (5-10)'   THEN 3
        ELSE 4
    END ----2025

---**2024 Loyalty breakdown of customers that repeat purchases**
WITH Store_Fixed AS (
  SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
),
Customer_transaction AS (
  SELECT 
    c.customer_id,
    s.province,
    c.loyalty_tier AS loyalty_tier,
    Count(DISTINCT t.transaction_id) AS transaction_count
  FROM transactions t
  JOIN customers_1 c ON t.customer_id = c.customer_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  WHERE YEAR(t.transaction_date) = 2024 AND s.province = 'Western Cape'
    GROUP BY c.customer_id, s.province, c.loyalty_tier
)
SELECT
    CASE
        WHEN transaction_count = 1     THEN 'One-time'
        WHEN transaction_count BETWEEN 2 AND 4  THEN 'Occasional (2-4)'
        WHEN transaction_count BETWEEN 5 AND 10 THEN 'Regular (5-10)'
        ELSE 'Loyal (10+)'
  END AS Customer_Type,
    COUNT(*)  AS customers,
    province, loyalty_tier,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_base
FROM Customer_transaction
GROUP BY Customer_Type, province, loyalty_tier
ORDER BY
    CASE Customer_Type
        WHEN 'One-time'        THEN 1
        WHEN 'Occasional (2-4)' THEN 2
        WHEN 'Regular (5-10)'   THEN 3
        ELSE 4
    END  -----Customer type in 2024

---**2025 Loyalty breakdown of customers that repeat purchases**
WITH Store_Fixed AS (
  SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
),
Customer_transaction AS (
  SELECT 
    c.customer_id,
    s.province,
    c.loyalty_tier AS loyalty_tier,
    Count(DISTINCT t.transaction_id) AS transaction_count
  FROM transactions t
  JOIN customers_1 c ON t.customer_id = c.customer_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  WHERE YEAR(t.transaction_date) = 2025 AND s.province = 'Western Cape'
    GROUP BY c.customer_id, s.province, c.loyalty_tier
)
SELECT
    CASE
        WHEN transaction_count = 1     THEN 'One-time'
        WHEN transaction_count BETWEEN 2 AND 4  THEN 'Occasional (2-4)'
        WHEN transaction_count BETWEEN 5 AND 10 THEN 'Regular (5-10)'
        ELSE 'Loyal (10+)'
  END AS Customer_Type,
    COUNT(*)  AS customers,
    province, loyalty_tier,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_base
FROM Customer_transaction
GROUP BY Customer_Type, province, loyalty_tier
ORDER BY
    CASE Customer_Type
        WHEN 'One-time'        THEN 1
        WHEN 'Occasional (2-4)' THEN 2
        WHEN 'Regular (5-10)'   THEN 3
        ELSE 4
    END ---In 2025

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Effects of products to revenue. 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

WITH category_revenue AS (
SELECT
    YEAR(t.transaction_date) AS Year, 
    p.category AS category,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN stores s ON t.store_id = s.store_id
  JOIN imbewu_products p ON ti.product_id = p.product_id
  Where Month(t.transaction_date) BETWEEN '1' AND '6'
  GROUP BY YEAR(t.transaction_date), p.category
)
Select
y1.category,
y1.Total_Revenue AS Revenue_2024,
y2.Total_Revenue AS Revenue_2025,
ROUND(y2.Total_Revenue - y1.Total_Revenue) AS Revenue_Change,
ROUND(((y2.Total_Revenue - y1.Total_Revenue) / y1.Total_Revenue) * 100, 2) AS Change_Revenue_Percentage
FROM category_revenue y1
CROSS JOIN category_revenue y2
WHERE y1.Year = 2024 AND y2.Year = 2025 AND y1.category = y2.category
ORDER BY Revenue_2024 DESC -----Revenue comparison by product category

----Groceries category contributes most revenue for both years at 2024 = R 495,829.88 and 2025 = R 512,113.53. However Apparel had the most revenue increase between 2024 and 2025

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---In depth detail of Category performances in 2025 - Grocery category in Western Cape is acumulating the most revenue cpmpared to other categories in al Provinces.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

WITH Store_Fixed AS (
  SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
)
SELECT
    YEAR(t.transaction_date) AS Year, 
    p.category AS category,
    s.province AS province,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  JOIN imbewu_products p ON ti.product_id = p.product_id
  where YEAR(t.transaction_date) = 2025
  GROUP BY YEAR(t.transaction_date), p.category, s.province
ORDER BY Total_Revenue DESC

---Looking only at Western Cape - Beverages subcategory is generating the most revenue compared to other categories and sub categories.
WITH Store_Fixed AS (
  SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
)
SELECT
    YEAR(t.transaction_date) AS Year, 
    p.category AS category,
    p.sub_category AS sub_category,
    s.province AS province,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  JOIN imbewu_products p ON ti.product_id = p.product_id
  where YEAR(t.transaction_date) = 2025 AND s.province = 'Western Cape'
  GROUP BY YEAR(t.transaction_date), p.category, s.province, p.sub_category
ORDER BY Total_Revenue DESC

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---Did the ap Power Promo (Buy 2 Get 1 Free on Iwisa) in April work, Answer YES, it increased revenue compared to other 2025 months by R 7,045.44 and average basket value by R 75.76.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

WITH Store_Fixed AS (
  SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
)
SELECT
    YEAR(t.transaction_date) AS Year,
    Month(t.transaction_date) AS Month,
    p.category AS category,
    p.sub_category AS sub_category,
    s.province AS province,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Total_Revenue,
    SUM(ti.quantity)                                    AS Units_Sold,
    COUNT(DISTINCT t.transaction_id)                   AS transactions,
    ROUND(SUM(ti.unit_price_at_sale * ti.quantity) / COUNT(DISTINCT t.transaction_id) , 2) AS avg_basket_value
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  JOIN imbewu_products p ON ti.product_id = p.product_id
  where YEAR(t.transaction_date) = 2025 AND s.province = 'Western Cape' AND p.sub_category = 'Maize Meal'
  Group by
    YEAR(t.transaction_date),
    Month(t.transaction_date),
    p.category,
    p.sub_category,
    s.province
ORDER BY Total_Revenue DESC

---Monthly revenue trend by category (2025 only - detailed view)
WITH monthly_category_revenue AS (
  SELECT
    MONTH(t.transaction_date) AS Month,
    p.category,
    SUM(ti.unit_price_at_sale * ti.quantity) AS Monthly_Revenue,
    COUNT(DISTINCT t.transaction_id) AS Transactions,
    SUM(ti.quantity) AS Units_Sold
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN imbewu_products p ON ti.product_id = p.product_id
  WHERE YEAR(t.transaction_date) = 2025
  GROUP BY MONTH(t.transaction_date), p.category
)
SELECT
  Month,
  category,
  ROUND(Monthly_Revenue, 2) AS Monthly_Revenue,
  Transactions,
  Units_Sold,
  ROUND(Monthly_Revenue / Transactions, 2) AS Avg_Transaction_Value,
  ROUND(Monthly_Revenue / Units_Sold, 2) AS Avg_Price_Per_Unit
FROM monthly_category_revenue
ORDER BY category, Month

-------Calculate Total Profit per year----

---Total Profit by Year (2024 vs 2025)
WITH profit_calculation AS (
  SELECT
    YEAR(t.transaction_date) AS Year,
    ti.item_id,
    ti.quantity,
    ti.unit_price_at_sale,
    p.unit_cost,
    (ti.unit_price_at_sale * ti.quantity) AS Revenue,
    (p.unit_cost * ti.quantity) AS Cost,
    ((ti.unit_price_at_sale * ti.quantity) - (p.unit_cost * ti.quantity)) AS Profit
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN imbewu_products p ON ti.product_id = p.product_id
  WHERE YEAR(t.transaction_date) IN (2024, 2025)
)
SELECT
  Year,
  ROUND(SUM(Revenue), 2) AS Total_Revenue,
  ROUND(SUM(Cost), 2) AS Total_Cost,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND((SUM(Profit) / SUM(Revenue)) * 100, 2) AS Profit_Margin_Pct
FROM profit_calculation
GROUP BY Year
ORDER BY Year

---Profit by Category and Year
WITH profit_calculation AS (
  SELECT
    YEAR(t.transaction_date) AS Year,
    p.category,
    ti.quantity,
    ti.unit_price_at_sale,
    p.unit_cost,
    (ti.unit_price_at_sale * ti.quantity) AS Revenue,
    (p.unit_cost * ti.quantity) AS Cost,
    ((ti.unit_price_at_sale * ti.quantity) - (p.unit_cost * ti.quantity)) AS Profit
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN imbewu_products p ON ti.product_id = p.product_id
  WHERE YEAR(t.transaction_date) IN (2024, 2025)
)
SELECT
  category,
  ROUND(SUM(CASE WHEN Year = 2024 THEN Revenue END), 2) AS Revenue_2024,
  ROUND(SUM(CASE WHEN Year = 2024 THEN Cost END), 2) AS Cost_2024,
  ROUND(SUM(CASE WHEN Year = 2024 THEN Profit END), 2) AS Profit_2024,
  ROUND((SUM(CASE WHEN Year = 2024 THEN Profit END) / SUM(CASE WHEN Year = 2024 THEN Revenue END)) * 100, 2) AS Margin_2024,
  ROUND(SUM(CASE WHEN Year = 2025 THEN Revenue END), 2) AS Revenue_2025,
  ROUND(SUM(CASE WHEN Year = 2025 THEN Cost END), 2) AS Cost_2025,
  ROUND(SUM(CASE WHEN Year = 2025 THEN Profit END), 2) AS Profit_2025,
  ROUND((SUM(CASE WHEN Year = 2025 THEN Profit END) / SUM(CASE WHEN Year = 2025 THEN Revenue END)) * 100, 2) AS Margin_2025,
  ROUND(SUM(CASE WHEN Year = 2025 THEN Profit END) - SUM(CASE WHEN Year = 2024 THEN Profit END), 2) AS Profit_Change
FROM profit_calculation
GROUP BY category
ORDER BY Profit_2024 DESC

---Profit by Province and Year (Western Cape focus)
WITH Store_Fixed AS (
    SELECT 
        store_id,
        store_name AS Store_Name,
        CASE 
            WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
            WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
            ELSE province
        END AS province
    FROM stores
),
profit_calculation AS (
  SELECT
    YEAR(t.transaction_date) AS Year,
    s.province,
    ti.quantity,
    ti.unit_price_at_sale,
    p.unit_cost,
    (ti.unit_price_at_sale * ti.quantity) AS Revenue,
    (p.unit_cost * ti.quantity) AS Cost,
    ((ti.unit_price_at_sale * ti.quantity) - (p.unit_cost * ti.quantity)) AS Profit
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN imbewu_products p ON ti.product_id = p.product_id
  JOIN Store_Fixed s ON t.store_id = s.store_id
  WHERE YEAR(t.transaction_date) IN (2024, 2025)
)
SELECT
  province,
  ROUND(SUM(CASE WHEN Year = 2024 THEN Profit END), 2) AS Profit_2024,
  ROUND(SUM(CASE WHEN Year = 2025 THEN Profit END), 2) AS Profit_2025,
  ROUND(SUM(CASE WHEN Year = 2025 THEN Profit END) - SUM(CASE WHEN Year = 2024 THEN Profit END), 2) AS Profit_Change,
  ROUND(((SUM(CASE WHEN Year = 2025 THEN Profit END) - SUM(CASE WHEN Year = 2024 THEN Profit END)) / SUM(CASE WHEN Year = 2024 THEN Profit END)) * 100, 2) AS Profit_Change_Pct,
  ROUND((SUM(CASE WHEN Year = 2024 THEN Profit END) / SUM(CASE WHEN Year = 2024 THEN Revenue END)) * 100, 2) AS Margin_2024,
  ROUND((SUM(CASE WHEN Year = 2025 THEN Profit END) / SUM(CASE WHEN Year = 2025 THEN Revenue END)) * 100, 2) AS Margin_2025
FROM profit_calculation
GROUP BY province
ORDER BY Profit_2024 DESC

---Monthly Profit Trend for 2025
WITH profit_calculation AS (
  SELECT
    MONTH(t.transaction_date) AS Month,
    p.category,
    ti.quantity,
    ti.unit_price_at_sale,
    p.unit_cost,
    (ti.unit_price_at_sale * ti.quantity) AS Revenue,
    (p.unit_cost * ti.quantity) AS Cost,
    ((ti.unit_price_at_sale * ti.quantity) - (p.unit_cost * ti.quantity)) AS Profit
  FROM transactions t
  JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
  JOIN imbewu_products p ON ti.product_id = p.product_id
  WHERE YEAR(t.transaction_date) = 2025
)
SELECT
  Month,
  category,
  ROUND(SUM(Revenue), 2) AS Monthly_Revenue,
  ROUND(SUM(Cost), 2) AS Monthly_Cost,
  ROUND(SUM(Profit), 2) AS Monthly_Profit,
  ROUND((SUM(Profit) / SUM(Revenue)) * 100, 2) AS Profit_Margin_Pct
FROM profit_calculation
GROUP BY Month, category
ORDER BY category, Month

