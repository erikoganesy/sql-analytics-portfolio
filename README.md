# sql-analytics-portfolio

This repository contains my **SQL analytics practice project**.  
It is created to improve my skills in **SQL, data analysis, and database design**, using realistic datasets and analytical tasks.

The project shows how raw data can be organized into schemas and analyzed using SQL queries.

---

## 🎯 Project Purpose

- Practice **SQL queries for data analysis**
- Learn **database schema design**
- Work with **realistic business datasets**
- Improve analytical thinking for **junior data analyst / data scientist roles**

---

## 📁 Repository Structure

```text
sql-analytics-portfolio/
│
├── data/
│   ├── public_schema/
│   │   ├── customers.csv
│   │   ├── employees.csv
│   │   ├── orders.csv
│   │   ├── products.csv
│   │   └── sales.csv
│   │
│   └── analytics_schema/
│       ├── customers.csv
│       ├── customer_locations.csv
│       ├── cities.csv
│       ├── regions.csv
│       ├── countries.csv
│       ├── orders.csv
│       ├── order_items.csv
│       ├── products.csv
│       ├── city_boundaries.csv
│       ├── region_boundaries.csv
│       └── country_boundaries.csv
│
├── queries/
│   ├── analytics_schema.sql
│   ├── analytics_schema_design.sql
│   └── sql_session5.sql
│
└── README.md

## 🧩 Schemas Overview

### Public Schema

Contains raw data, similar to data from operational systems:

- Customers
- Employees
- Orders
- Products
- Sales

This schema is used as a starting point for analysis.

---

### Analytics Schema

Created for analysis and reporting:

- Customer and order data prepared for analytics
- Geographic hierarchy (countries → regions → cities)
- Order items for detailed sales analysis

This schema makes analytical queries easier to write and understand.

---

## 📊 What I Practice in This Project

Using SQL, I analyze:

- Total and average revenue
- Sales by product and category
- Customer distribution by location
- Order counts and sales trends
- Simple performance classification
- Correct handling of missing values

---

## 🛠 Tools & Technologies

- SQL (PostgreSQL-style)
- CSV files
- pgAdmin
- VS Code
- Git & GitHub

---

## 👥 Who This Project Is For

- Junior Data Analyst roles
- Entry-level Data Scientist roles
- SQL interview preparation
- Anyone learning SQL analytics

---

## ▶ How to Use

1. Create a PostgreSQL database
2. Load CSV files into the correct schemas
3. Run SQL scripts from the `queries` folder
4. Explore and modify queries to practice

---

## 👤 Author

**Erik Hovhannisyan**  
Machine Learning Sc
