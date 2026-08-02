# 📊 Data Analytics Portfolio

![SQL](https://img.shields.io/badge/SQL-Basic-blue)
![Excel](https://img.shields.io/badge/Excel-Intermediate-green)
![Power BI](https://img.shields.io/badge/Power%20BI-Learning-yellow)
![Data Analytics](https://img.shields.io/badge/Data%20Analytics-Portfolio-orange)

---
## 🧠 Project Name: Imbewu Retail — Sales Analytics


---
## 🗺️ Overview

----

## 📌 Table of contents

- [The problem](#-the-problem)
- [What I built](#-what-i-built)
- [Tools & skills used](#-tools--skills-used)
- [The dataset](#-the-dataset)
- [Data quality issues](#-data-quality-issues)
- [How to run this project](#-how-to-run-this-project)
- [Project structure](#-project-structure)
- [Data model](#-data-model)
- [Dashboards](#-dashboards)
- [Key findings](#-key-findings)
- [What I learned](#-what-i-learned)
- [References](#-references)
- [About me](#-about-me)

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
| `customers (1).csv`          | 3,000   |  loyalty programme members and their tier (Bronze / Silver / Gold)               |
| `products (1).csv`       | 48     |  Imbewu's product catalogue across 5 categories: Groceries, Household, Health & Beauty, Electronics, Apparel   |
| `stores.csv`         | 45      | Stores across 4 South African provinces              |
| `transaction_items.csv`      | 48,641   |     Line items inside each transaction    |
| `transactions.csv`        | 9,164 | Every till receipt issued in the period              |
| `promotions.csv`        | 4 | Historical and current marketing campaigns              |

**Key dataset characteristics:**
