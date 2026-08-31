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

<img width="953" height="571" alt="image" src="https://github.com/user-attachments/assets/5cfc6f1a-f776-4d11-8478-f4c6a091aafd" />



## 🎯 The problem

Imbewu Retail is a fictional South African Retail Business with 45 Stores located across Gauteng, Western Cape, KwaZulu-Natal and Eastern Cape. The leadership has noticed a drop in Revenue in the Western Cape and has requested for an investigation to findout the reasons why this is happening and what should be done to fix it. To investigate this issue, I have drawn 3 Hypotheses that will help us determine or answer the following questions:

1. Is this Revenue drop only happening in Western Cape or other Provinces are affected as well?
2. Is there a specific business metric or patten that is causing this drop or its just happening on a random?
3. Is this affecting all stores or a select few? if not all Stores are affected, please explain which ones and why?
4. There was a Promotion ran in April 2025, the CFO would like to know if it worked or not
5. What are the recommendation to you suggest to stop this bleeding?

#### 📌 Hyphothesis Tested aimed at answering the question of what happened

- Hypothesis 1: Total Revenue has not only dropped for Western Cape but has dropped for all Provinces.
- Hypothesis 2: Western Cape had a drop in revenue because of drop in Transaction count. This means customers are not purchasing as much products in 2025 than in 2024.
- Hypothesis 3: Loyalty Tier plays a role in Revenue drop by Province.

Before I could start the analysis, I had to take into consideration that the data used in this analysis does not include data set for 2025 July - December. Therefore when doing comparisons for both years, I ensured to filter the data for the first 6 months (January - June) inorder to get accurate results of what is happening. Using the full data set for YOY comparisons would have given inaccurate results given the data for 2024 is based a full year while 2025 is based on half the year so by default 2024 would seem like the best performing year if the full data is used. Testing the above Hypotheses will help the company concentrate on high-revenue/profit product lines, optimize inventory management of stores and implement targeted, location-specific projects to increase revenue and profit.

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

3. Check for Inconsistent casing: Western Cape and Gauteng provinces contain both upper case and lower cases. This was causing inaccurate results for provincial revenue analysis. So to fix the issue, standardized the cases using SQL. Data quality check SQL Code found in [`Data quality checks.md`]([sql/05_data_quality_checks.sql](https://github.com/mishsonjica-hash/Amanda-Sonjica/blob/main/Data%20quality%20checks.md))

## 📊 Dashboards

### Executive Sales Overview

<img width="647" height="367" alt="WC Dashboard" src="https://github.com/user-attachments/assets/6f3fcb2a-004d-45bb-be9c-95facd588abc" />


<img width="648" height="370" alt="Promo dashboaed" src="https://github.com/user-attachments/assets/f7cadb80-e155-45f6-86e1-eed210e72478" />


<img width="648" height="362" alt="image" src="https://github.com/user-attachments/assets/042af4e3-5bdf-4f4d-a491-a096f6021b79" />





---

## 🔍 Key findings

----

1. Revenue Decline Is Isolated to Western Cape (Hypothesis 1 – Incorrect): The initial hypothesis that revenue dropped across all provinces was disproven. Revenue only declined in Western Cape by 5.6%, while all other provinces saw revenue increases year-over-year. This confirms that problem is within Western Cape and not shared across provinces.

2. Transaction Count Drop Is the Primary Driver of Revenue change (Hypothesis 2 – Correct): The Western Cape revenue decline is directly linked to a 7.49% drop in transaction count. Customers in 2025 are buying less products than in 2024. However, it was observed that this decline is concentrated in just 6 stores (S011, S003, S012, S007, S002, and S010), with Store S010 experiencing the steepest decline at 26.13% in transactions and 25.24% in revenue. 

3. Customer Loyalty Tiers Are Amplifying the Decline (Hypothesis 3 – Correct): All three loyalty tiers (Bronze, Silver, Gold) experienced transaction and revenue declines in Western Cape, making it the epicenter of customer churn. The Silver tier was hit hardest, losing 145 transactions and suffering a 10.46% revenue drop in Western Cape alone. Total transaction losses across all tiers in Western Cape amounted to 241 customers (90 Bronze + 145 Silver + 6 Gold). While Western Cape generates higher revenue and transactions counts, in comparison to other provinces, it had the highest revenue drop between 2024 and 2025

4. Average Transaction Value Shows Mixed Impact: While several Western Cape stores (S002, S007, S011, S012, S009, S005) saw a decline in average transaction spend — suggesting customers are buying cheaper products or spending less per visit — this was not the case for all stores. For example, Store S003 experienced a 10.66% revenue decline despite a 12.25% increase in average transaction value. This shows that average transaction value alone does not fully influence the revenue change; the drop in transaction volume remains the dominant factor.

5. Promo Discount Analysis – "Buy 2 Get 1 Free on Iwisa" Was Effective: The Power Promo campaign in April 2025 delivered positive results: revenue increased by R 7,045.44 and the average basket value rose by R 75.76. The promotion also boosted transaction counts, confirming that customers spent more per visit during the promotional period. This suggests that targeted discount campaigns can be an effective lever to counteract the declining transaction trends in Western Cape.

6. Product Category Effect – Apparel Is the Growth Leader
The Groceries category remains the top revenue contributor (R 495,829.88 in 2024 → R 512,113.53 in 2025), but the Apparel category showed the most significant revenue growth at 14.22% year-over-year. Within Western Cape specifically, the Beverages subcategory generates the highest revenue compared to other categories and subcategories. This highlights an opportunity to leverage high-growth categories like Apparel and strong performers like Beverages to drive recovery strategies.

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



