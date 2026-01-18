# sql-analytics-portfolio
SQL Analytics Portfolio
This repository contains my SQL analytics practice project.
It is created to improve my skills in SQL, data analysis, and database design, using realistic datasets and analytical tasks.
The project shows how raw data can be organized into schemas and analyzed using SQL queries.
🎯 Project Purpose
Practice SQL queries for data analysis
Learn database schema design
Work with realistic business datasets
Improve analytical thinking for junior data analyst / data scientist roles
📁 Repository Structure
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
🧩 Schemas Overview
Public Schema
Contains raw data, similar to what might come from operational systems:
Customers
Employees
Orders
Products
Sales
This schema is used as a starting point for analysis.
Analytics Schema
Created for analysis and reporting:
Customer and order data prepared for analytics
Geographic hierarchy (countries, regions, cities)
Order items for detailed sales analysis
This schema helps make analytical queries easier and clearer.
📊 What I Practice in This Project
Using SQL, I analyze things like:
Total and average revenue
Sales by product or category
Customer distribution by location
Order counts and sales trends
Basic performance labeling (e.g. strong vs weak categories)
Handling missing values correctly in aggregations
🛠 Tools & Technologies
SQL (PostgreSQL-style)
CSV files
pgAdmin
VS Code
Git & GitHub
👥 Who This Project Is For
Junior Data Analyst positions
Entry-level Data Scientist roles
SQL interview practice
Anyone learning analytics with SQL
▶ How to Use
Create a PostgreSQL database
Load the CSV files into the correct schemas
Run the SQL scripts from the queries folder
Explore and modify the queries to practice
👤 Author
Erik Hovhannisyan
Machine Learning Scientist | Learning SQL Analytics
GitHub: https://github.com/erikoganesy
📄 Notes
This project is created for learning and portfolio purposes.