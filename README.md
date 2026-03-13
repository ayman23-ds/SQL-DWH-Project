# SQL-DWH-Project

Welcome to the **Data warehouse and Analytics Project** repository
This project demonstrates a comperhansive DWH and analytics solution,from building a DWH to generaing actionable insights. Designed as portofolio project highlights industry best practices in data engineering and analytics


---
## Data Architecture

![image alt](https://github.com/ayman23-ds/SQL-DWH-Project/blob/b61b88bba4a6396399c213bd1701a2529b82a902/docs/data%20flow.png)

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.
---
## Project Overview
This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.
🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:

- **SQL Development**
- **Data Architect**
- **Data Engineering**
- **ETL Pipeline Developer**
- **Data Modeling**
- **Data Analytics**
---


## Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope: Focus** on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.


---

### BI: Analytics & Reporting (Data Analysis)
#### Objective
Develop SQL-based analytics to deliver detailed insights into:

- **Customer Behavior**
- **Product Performance**
- **Sales Trends**
These insights empower stakeholders with key business metrics, enabling strategic decision-making.
---
## 📂 **Repository Structure**

```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── star_schema.jpeg                # image schema used on the project
│   └── data_flow.png                   # image shows the project's architecture
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   └── gold/                           # Scripts for creating analytical models
│
└── README.md                           # Project overview and instructions
```
---

## About Me

I am a **Data Engineer** with a strong interest in building modern data platforms and scalable data pipelines.

I am currently pursuing a **Master’s degree in Machine Learning and Deep Learning at the University of Pavia, Italy**. My academic and technical focus includes:

* Data Engineering & Data Warehousing
* ETL / ELT Pipelines
* Big Data Technologies
* Machine Learning & Deep Learning

I am passionate about designing efficient data architectures that enable advanced analytics and intelligent systems.

## Connect With Me

🔗 [LinkedIn Profile](https://www.linkedin.com/in/ahmed-ayman-b69219354/)
