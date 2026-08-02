# 📊 Data Analytics Portfolio

![SQL](https://img.shields.io/badge/SQL-Basic-blue)
![Excel](https://img.shields.io/badge/Excel-Intermediate-green)
![Power BI](https://img.shields.io/badge/Power%20BI-Learning-yellow)
![Data Analytics](https://img.shields.io/badge/Data%20Analytics-Portfolio-orange)

---
## 🧠 Project Goal


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
- Databricks
- Power BI Desktop
- DAX
- Python for Data analytics
- Git and GitHub

**Skills**
- SQL — CTEs, window functions, ranking
- DAX — time intelligence, ranking, customer cohort logic
- Data validation and reconciliation
- Data quality auditing and remediation
- Dashboard design
- Technical writing and documentation

## 📦 The dataset

The full dataset lives in [`data/`](data/) as five CSV files. It's **fully synthetic** — no real customer or sales data is included — but it's been generated to look and behave like a real retail dataset, with the natural skew you'd expect (Gauteng over-indexed, December peaks, year-on-year growth, mixed payment methods).

| File                    | Rows    | Description                                          |
| ----------------------- | ------- | ---------------------------------------------------- |
| `dim_date.csv`          | 1,096   | Calendar: 2022-01-01 to 2024-12-31                   |
| `dim_product.csv`       | 20      | Products across Electronics, Apparel, Home, Beauty   |
| `dim_store.csv`         | 10      | Stores across 5 South African provinces              |
| `dim_customer.csv`      | 5,000   | Customers with loyalty tiers and demographics        |
| `fact_sales.csv`        | 50,000+ | Transactional sales at line-item grain               |

**Key dataset characteristics:**
