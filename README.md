# 📊 Data Analytics Portfolio

![SQL](https://img.shields.io/badge/SQL-Basic-blue)
![Excel](https://img.shields.io/badge/Excel-Intermediate-green)
![Power BI](https://img.shields.io/badge/Power%20BI-Learning-yellow)
![Data Analytics](https://img.shields.io/badge/Data%20Analytics-Portfolio-orange)

---
## 🧠 Project Name: Imbewu Retail — Sales Analytics

---
## 🗺️ Overview
#### 📌 Project Workflow
Data ➡️ Data Cleaning & Preparation using SQL ➡️ EDR Diagram ➡️ Findings ➡️ Power BI Dashboard

----

## 📌 Table of contents

- [Overview](#-Overview)
- [Tools & skills used](#-tools--skills-used)
- [The dataset](#-the-dataset)
- [Schema Diagram](#-schema-diagram)
- [Data quality issues](#-data-quality-issues)
- [Key findings](#-key-findings)
- [Dashboards](#-dashboards)
- [Conclusion](#-conclusion)
- [References](#-references)
- [Let's Connect](#-let's-connect)

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
all 45 stores nationwide. It's **fully synthetic** — no real customer or sales data is included — but it's been generated to look and behave like a real retail dataset, with the natural skew you'd expect. 

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
  2. Checking for Null values: There were a lot of Null values in 3 tables: Customers, Stores and Transactions table.

   <img width="422" height="142" alt="image" src="https://github.com/user-attachments/assets/b5413276-2df4-4362-b898-7aa8be61a411" />

 


So the decision on what to do with the Null Values was based on whether the information on Null values will affect any findings or insights we're trying to determine and also if the information can be determined using information from other tables
- Gender and Date of birth columns are original entered data when a customer signs up so there is no way to determine them from the rest of the data.
- Store Manager
   

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

## 📊 Dashboards

### Executive Sales Overview

---

## 📬 References 

🔗[DAX function reference](https://learn.microsoft.com/dax/)

📘[Nova Retail Group — Sales Analytics by Clarence Mantiya](https://github.com/Clarence-Mantiya/test-project2/blob/main/README.md?plain=1) for Github layout


---

## ⭐ Let's Connect

- 💼 LinkedIn: www.linkedin.com/in/amanda-sonjica-b7a169104
- 📧 Email: mish.sonjica@gmail.com

I’m always open to suggestions, improvements, or collaboration ideas.

---



