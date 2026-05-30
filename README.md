# Customer Behavior & Retention Analytics — Olist Brazilian E-Commerce

![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python)
![SQL](https://img.shields.io/badge/SQL-BigQuery-blue)
![Pandas](https://img.shields.io/badge/Pandas-2.2.2-black?logo=pandas)
![Matplotlib](https://img.shields.io/badge/Matplotlib-3.8.4-blue)
![Google Colab](https://img.shields.io/badge/Google-Colab-F9AB00?logo=googlecolab&logoColor=white)
![BigQuery](https://img.shields.io/badge/Google-BigQuery-4285F4?logo=googlebigquery&logoColor=white)
![Looker Studio](https://img.shields.io/badge/Looker-Studio-4285F4?logo=googleanalytics&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Repository-black?logo=github)

---

## Project Highlights

- Built an end-to-end customer retention analytics workflow using **BigQuery, Python, and Looker Studio**
- Processed and analyzed **Brazilian e-commerce customer behavior data (2016–2018)**
- Created customer-level metrics and segmentation for retention analysis
- Built an interactive dashboard for acquisition, repeat purchase, cohort retention, and customer segments
- Generated actionable business insights and retention recommendations

---

## Overview

This project analyzes customer purchasing behavior and retention patterns using the Brazilian E-Commerce Public Dataset by Olist.

The analysis focuses on customer acquisition growth, repeat customer behavior, cohort retention performance, and customer segmentation to identify retention opportunities and support long-term business decisions.

Data extraction and aggregation were performed using Google BigQuery (SQL), while Python was used for transformation, analysis, and visualization. An interactive dashboard was created using Looker Studio.

---

## Business Questions

This project aims to answer:

- How did customer acquisition grow over time?
- How many customers returned to purchase again each month?
- How strong was customer retention across cohorts?
- Which customer segments contributed the highest revenue?
- Which customer groups present retention opportunities?

---

## Project Workflow

### 1. Data Quality Check

Validated:

- missing values
- duplicate records
- table consistency

---

### 2. Customer Master Table

Built customer-level metrics:

- customer_unique_id
- customer_state
- first_purchase_date
- last_purchase_date
- total_orders
- total_revenue
- avg_order_value
- avg_review_score

---

### 3. Customer Growth Analysis

Created:

- monthly customer acquisition trend
- monthly returning customer trend

---

### 4. Cohort Retention Analysis

Measured customer retention by cohort month to understand repeat purchase behavior over time.

---

### 5. Customer Segmentation

Segmented customers into:

- Others
- Potential Loyalists
- At Risk
- Loyal Customers
- Champions

based on purchase frequency, revenue, and customer behavior.

---

## Dataset

Source:

Olist Brazilian E-Commerce Public Dataset

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

Raw dataset files are not included due to file size limitations.

---

## Data Schema

![Data Schema](assets/data-schema.png)

---

# Dashboard

## Customer Behavior & Retention Analytics Dashboard

![Dashboard](dashboard/dashboard-overview.png)

## Key Metrics

| Metric | Value |
|---|---:|
| Total Customers | 93K+ |
| Repeat Customer Rate | 3% |
| Total Revenue | R$15M+ |
| Customer Segments | 5 |
| Analysis Period | 2016–2018 |

### Interactive Dashboard

[Open Looker Studio Dashboard](https://datastudio.google.com/s/oh7wi44hxh8)

### PDF Version

[Download Dashboard PDF](dashboard/Customer_Behavior_Retention_Dashboard.pdf)

---

# Notebook

### Google Colab

[Open Notebook in Google Colab](https://colab.research.google.com/drive/1eagtvB6yyUqR2csBWYuq-6WCVYN6N5oL?usp=sharing)

---

# SQL Files

| File | Description |
|---|---|
| 01_data_quality_check.sql | validation |
| 02_customer_master.sql | customer summary |
| 03_customer_acquisition.sql | acquisition trend |
| 04_returning_customer_trend.sql | returning customers |
| 05_customer_cohort_retention.sql | cohort analysis |
| vw_customer_acquisition.sql | dashboard view |
| vw_returning_customer.sql | dashboard view |
| vw_customer_segment.sql | dashboard segmentation |

---

# Python Visualizations

## Monthly Customer Acquisition

![Monthly Acquisition](assets/monthly_customer_acquisition.png)

## Monthly Returning Customers

![Returning Customers](assets/returning_customer_trend.png)

## Cohort Retention Heatmap

![Cohort Retention](assets/cohort_retention_heatmap.png)

## Customer Segment Distribution

![Segment Distribution](assets/customer_segment_distribution.png)

## Revenue by Customer Segment

![Revenue Segment](assets/revenue_by_segment.png)

---

# Key Insights

Customer acquisition increased steadily throughout the analysis period and reached its peak near the end of 2017 before stabilizing in 2018.

Returning customer activity also improved over time, indicating stronger repeat purchase behavior as the marketplace matured.

Cohort retention analysis shows that most repeat purchases occur shortly after first purchase, with retention gradually decreasing over time.

Customer segmentation reveals that **Others** represent the largest share of customers, while **Potential Loyalists** contribute the highest revenue.

The **At Risk** segment represents a valuable retention opportunity, while **Champions**, although smaller in volume, remain highly valuable customers.

---

# Repository Structure

```bash
customer-behavior-retention-analytics-olist/
│
├── assets/
├── dashboard/
├── data/
├── notebook/
├── sql/
└── README.md
```

---

# Author

Kenneth Christian Nathanael

**GitHub**:
https://github.com/kenchristn

**Portfolio**:
https://kenchristn.com
