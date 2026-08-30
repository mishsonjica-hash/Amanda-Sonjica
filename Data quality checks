# Data Quality Notes


##Checking for Duplicates in all tables
 
```sql
--CUSTOMERS TABLE
Select *,
row_number () OVER (PARTITION BY customer_id, first_name, last_name, gender, birth_year, loyalty_tier, home_suburb, signup_date ORDER BY customer_id) as row_num
From customers_1
```

With Duplicates_table as
(Select *,
row_number () OVER (PARTITION BY customer_id, first_name, last_name, gender, birth_year, loyalty_tier, home_suburb, signup_date ORDER BY customer_id) as row_num
From customers_1)
Select *
From Duplicates_table
where row_num > 1        -----So no duplicates in Customer table

---Imbewu_products table

With Duplicates_table as
(Select *,
row_number () OVER (PARTITION BY product_id, product_name, category, sub_category, brand, unit_cost, unit_price ORDER BY product_id) as row_num
From imbewu_products)
Select *
From Duplicates_table
where row_num > 1 ----no duplicates in Imbewu_products table

--Transactions table

With Duplicates_table as
(Select *,
row_number () OVER (PARTITION BY transaction_id, store_id, customer_id, transaction_date, payment_method ORDER BY transaction_id) as row_num
From transactions)
Select *
From Duplicates_table
where row_num > 1        -----So no duplicates in Transactions table

-----Transaction Items table

With Duplicates_table as
(Select *,
row_number () OVER (PARTITION BY item_id, transaction_id, product_id, quantity, unit_price_at_sale, discount_applied ORDER BY item_id) as row_num
From transaction_items)
Select *
From Duplicates_table
where row_num > 1        -----So no duplicates in Transactions_items table

--------------------------------------------------------
---Checking Null Values or dealing with Null values
--------------------------------------------------------

Select *
From customers_1 ---Leaving the Null values for column gender in customer table because I don't have another data where I can confirm if customer is male or female or the year they were born.

Select *
From imbewu_products

Select *
From stores ---Leaving the Null values for column store_manager in stores table because I don't have another data where I can confirm name of store manager.

Select *
From transaction_items -----No Null values in transaction items table

Select *
From transactions
where customer_id is null

---------------------------------------------------------------
----Inconsistent casing in customer names in Stores table
---------------------------------------------------------------

SELECT
    'Casing issues' AS check_name,
    COUNT(*)        AS issue_count
FROM stores
WHERE province = UPPER(province)
   OR province = LOWER(province) --- Some province names are both in lower case and in upper case e.g Gauteng and Western Cape. I will change all province names to upper case using code below:

SELECT 
    store_id,
    store_name AS Store_Name,
    CASE 
        WHEN LOWER(province) = 'western cape' THEN 'Western Cape'
        WHEN LOWER(province) = 'gauteng' THEN 'Gauteng'
        ELSE province
    END AS province
FROM stores

   
  
----------Finished Data cleaning.
