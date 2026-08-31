# 📊 Data Analytics Portfolio

![SQL](https://img.shields.io/badge/SQL-Basic-blue)
![Excel](https://img.shields.io/badge/Excel-Intermediate-green)
![Power BI](https://img.shields.io/badge/Power%20BI-Learning-yellow)
![Data Analytics](https://img.shields.io/badge/Data%20Analytics-Portfolio-orange)

Project Workflow: Data ➡️ Data Cleaning & Preparation using SQL ➡️ EDR Diagram ➡️ Findings ➡️ Power BI Dashboard

---
## 🧠 Project Name: Imbewu Retail — Sales Analytics

---
## 🗺️ Overview

<img width="655" height="371" alt="Summary dashboard" src="https://github.com/user-attachments/assets/1c49b613-c1bd-41fb-90dc-fc475178e332" />




#### 📌 Hyphothesis Tested aimed at answering the question of what happened

- Hypothesis 1: Total Revenue has not only dropped for Western Cape but has dropped for all Provinces.
- Hypothesis 2: Western Cape had a drop in revenue because of drop in Transaction count. This means customers are not purchasing as much products in 2025 than in 2024.
- Hypothesis 3: Loyalty Tier plays a role in Revenue drop by Province.

Before I could start the analysis, I had to take into consideration that the data used in this analysis does not include data set for 2025 July - December. Therefore when doing comparisons for both years I ensured to filter the data for the first 6 months (January - June) inorder to get accurate results of what is happening. Testing the above Hypotheses will help the company concentrate on high-revenue/profit product lines, optimize inventory management of stores and implement targeted, location-specific projects to increase revenue and profit.

----

## 💻 Tools & skills used

**Tools**
- Databricks (SQL)
- Power BI Desktop
- DAX
- Python for Data analytics
- Microsoft Word
- Git and GitHub

**Skills**
- SQL — CTEs, window functions, ranking
- DAX — time intelligence, ranking, customer cohort logic
- Data validation and reconciliation
- Data quality auditing and remediation
- Dashboard design
- Technical writing and documentation

## 📦 The dataset

The full dataset contains six CSV files. The six files contain tables covering 18 months of operations (January 2024 through June 2025) across 
all 45 stores nationwide. The data used is not a real-life data but it's been generated to look and behave like a real industry retail dataset, with the natural skew you'd expect. 

| File                    | Rows    | Description                                          |
| ----------------------- | ------- | ---------------------------------------------------- |
| `customers (1).csv`          | 3,000   |  Loyalty programme members and their tier (Bronze / Silver / Gold)               |
| `imbewu_products (1).csv`       | 48     |  Imbewu's product catalogue across 5 categories: Groceries, Household, Health & Beauty, Electronics, Apparel   |
| `stores.csv`         | 45      | Stores across 4 South African provinces              |
| `transaction_items.csv`      | 48,641   |     Line items inside each transaction    |
| `transactions.csv`        | 9,164 | Every till receipt issued in the period              |
| `promotions.csv`        | 4 | Historical and current marketing campaigns              |

----

## 🗂️ Schema Diagram

![ERD Schema Diagram](https://github.com/mishsonjica-hash/Amanda-Sonjica/blob/main/ERD%20Schema%20Diagram.png)

----

## ⚠️ Data quality issues

----
All the data cleaning and Data preparation was done using SQL. There were 5 checks done overall and they include the following:

  1. Checking for Duplicates in all tables: No duplicates were found in the data.
  2. Checking for Null values: There were a lot of Null values in 3 tables: **Customers**, **Stores** and **Transactions** table.

   <img width="422" height="142" alt="image" src="https://github.com/user-attachments/assets/b5413276-2df4-4362-b898-7aa8be61a411" />

So the decision on what to do with the Null Values was based on whether the information on Null values will affect any findings or insights we're trying to determine and also if the information can be determined using information from other tables.
- The missing Gender and Date of birth rows counted for 10% of the stores data and are original entered data when a customer signs up so there is no way to determine them from the rest of the data.
- The missing Store Manager name row counts for 2.2% of the stores data and it is original entered data and can't be confirmed from rest of the data.
- The missing Customer_id data from the transactions data counted for about 42.68% and although customer_id data can be found from the customers table, we don't have a way of tracing the transaction back to the customer.

**Final decision**: Keep the Null values in the data instead of replacing the data or deleting it from the tables especially the transactions because they contribute to the total revenue.

3. Check for Inconsistent casing: Western Cape and Gauteng provinces contain both upper case and lower cases. This was causing inaccurate results for provincial revenue analysis. So to fix the issue, standardized the cases using SQL.

## 📊 Dashboards

### Executive Sales Overview

<img width="647" height="367" alt="WC Dashboard" src="https://github.com/user-attachments/assets/6f3fcb2a-004d-45bb-be9c-95facd588abc" />


<img width="648" height="370" alt="Promo dashboaed" src="https://github.com/user-attachments/assets/f7cadb80-e155-45f6-86e1-eed210e72478" />


<img width="648" height="362" alt="Product Analysis dashboard" src="https://github.com/user-attachments/assets/8075d482-bdc0-4bc8-bc7b-f32a7057b037" />




---

## 🔍 Key findings

----

Hypothesis 1: Average Transaction Value Decline
The revenue drop is driven by a decrease in average transaction value (spend per transaction) rather than just transaction volume, indicating customers are buying fewer or cheaper items per visit.

Rationale: You're tracking transaction counts and total revenue, but the revenue decline could be explained by customers spending less per transaction. This would be tested by calculating Total_Revenue / Count_of_transactions for 2024 vs 2025.

Hypothesis 2: Loyalty Tier Migration Impact
Customers have been downgrading from higher loyalty tiers (Gold/Silver) to lower tiers (Bronze/None) between 2024-2025, causing revenue loss as higher-tier customers typically spend more.

Rationale: Your data shows loyalty tier revenue changes, but you haven't examined whether the composition of customers in each tier changed. If Gold customers dropped to Silver or Bronze, total Gold revenue would decline even if per-customer spending stayed constant.

Hypothesis 3: Product Mix Shift
The revenue decline is concentrated in specific product categories, with customers shifting from higher-margin or higher-priced products to lower-priced alternatives.

Rationale: You have the imbewu_products table in your query but haven't joined it for analysis yet. Product-level analysis could reveal whether certain product categories are underperforming, which wouldn't be visible in province/loyalty-tier aggregations alone.

These hypotheses complement your existing analysis by examining average transaction value, customer tier migration, and product-level patterns — three dimensions you haven't fully explored yet but have the data to investigate.

----

## 📬 References 

🔗[DAX function reference](https://learn.microsoft.com/dax/)

📘[Nova Retail Group — Sales Analytics by Clarence Mantiya](https://github.com/Clarence-Mantiya/test-project2/blob/main/README.md?plain=1) for Github layout


---

## ⭐ Let's Connect

- 💼 LinkedIn: www.linkedin.com/in/amanda-sonjica-b7a169104
- 📧 Email: mish.sonjica@gmail.com

I’m always open to suggestions, improvements, or collaboration ideas.

---



