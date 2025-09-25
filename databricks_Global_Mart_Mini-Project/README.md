# Mini project

## **Introduction**

In the realm of Business Intelligence (BI) education, practical exercises serve as a cornerstone for cultivating proficiency and a deep understanding of analytical processes. The ability to transform raw data into actionable insights is a critical skill, and the construction of interactive dashboards stands out as a particularly valuable method for achieving this. Dashboards provide a centralized view of **key performance indicators** (**KPIs**) and **trends**, enabling businesses to monitor their **performance**, identify areas for improvement, and make data-driven decisions. 

![image.png](attachment:94fed7c3-b317-44f4-bd81-8e9f1a5f02e3:image.png)

Databricks, as a unified platform for data analytics, offers a comprehensive environment for end-to-end BI workflows, encompassing data processing, advanced analytics, and interactive dashboard creation 

### **Building a Sales Dashboard in Databricks**

> GlobalMart, a thriving retail company, recognizes the increasing importance of data-driven decision-making. To gain a clearer understanding of its sales performance and identify opportunities for growth, the company requires an interactive dashboard. This dashboard will serve as a central tool for stakeholders to monitor key sales metrics, identify emerging trends, and pinpoint areas that require attention.
> 

<aside>
🎯

**Objective: The primary goal of this exercise is to construct a dashboard that provides actionable insights into GlobalMart's sales data. Specifically, focusing on total sales, sales distribution across different geographical regions, identification of top-performing products, and the evolution of sales trends over time.** This visual representation of sales data will empower GlobalMart's teams to make informed strategic adjustments and drive business success.

</aside>

![image.png](attachment:ec2c39ce-727b-4570-b91c-e9ceb4ce560d:image.png)

### **Dataset**

<aside>
📌

**The data is available [here](https://drive.google.com/file/d/1qGDWRrHRgl126NcH69HKdTXbNf8Gnuih/view?usp=drive_link).**

This dataset features sample sales data, encompassing order information, shipping details, and fundamental customer attributes, ideal for retail analytics. It highlights essential fields such as order numbers, quantities, prices, and statuses, enabling segmentation, clustering, and other data-driven techniques. Anyone can delve into customer behavior, perform sales forecasting, and apply advanced analytics to uncover hidden trends and patterns.

</aside>

| **Column** | **Data Type** | **Example** | **Description** |
| --- | --- | --- | --- |
| **ORDERNUMBER** | Integer | 10107 | Unique identifier for the order |
| **QUANTITYORDERED** | Integer | 30 | Number of units ordered in this line item |
| **PRICEEACH** | Double | 95.70 | Unit price for the product in this line item |
| **ORDERLINENUMBER** | Integer | 2 | The line item number within the order |
| **SALES** | Double | 2871.00 | Total sales amount for this line (quantity × price) |
| **ORDERDATE** | String (Date) | 2/24/2003 0:00 | Date the order was placed/shipped (format: M/D/YYYY HH:MM) |
| **STATUS** | String | Shipped | Current order status (all are “Shipped” in this sample) |
| **QTR_ID** | Integer | 1 | Quarter of the year when the order was shipped (1 = Q1, etc.) |
| **MONTH_ID** | Integer | 2 | Month of the year (1 = January, 2 = February, etc.) |
| **YEAR_ID** | Integer | 2003 | Year of the shipped order |

## **Tasks:**

- **Task 1: Setting up the Databricks Environment (Approx. 15 minutes)**
    - Access the Databricks workspace.
    - Log in using your provided credentials.
    - Create a new notebook by navigating to the "Workspace" section, selecting the appropriate folder, and clicking on "Create" followed by "Notebook."
    - Choose either Python or SQL as the primary language for your notebook, depending on your personal preference.
    - Make the "Sample Sales Data" in CSV format accessible within Databricks by creating a new table.
    - Upload the downloaded CSV file through the UI by navigating to the "Data" section, selecting the desired database, and clicking on "Create Table" followed by "Upload File."
    
- **Task 2: Exploring and Cleaning the Data (Approx. 45 minutes)**
    - Once the sales data is loaded, explore its contents and ensure its quality.
    - Examine the first few rows of the table using SQL queries.
    - Check for missing values in the dataset using SQL queries.
    - Decide on an appropriate strategy based on the extent of missing values and time constraints, such as filtering or basic imputation.
    - Examine the data types of each column, ensuring 'Order Date' is a date type and numerical columns like Sales and Quantity are numeric.
    - Perform casting operations if necessary using SQL.
    - Identify and handle duplicate records using SQL queries with `GROUP BY` and `COUNT(*)` or DataFrame methods like `dropDuplicates()`.
    - Calculate basic descriptive statistics for relevant numerical columns using SQL functions such as `COUNT()`, `AVG()`, `MIN()`, and `MAX()` or DataFrame methods like `describe()` to understand the data's distribution.
    
- **Task 3: Identifying Key Sales Metrics (Approx. 30 minutes)**
    - Based on the GlobalMart scenario, identify metrics to analyze total sales, regional performance, top-selling products, and sales trends over time.
    - Relevant sales metrics include:
        - Total Sales Revenue: Sum of the `Sales` column.
        - Number of Orders: Count of distinct `ORDERNUMBER` values.
        - Average Order Value: Total Sales Revenue divided by the Number of Orders.
        - Sales Trend Over Time: Extract time components (using `ORDERDATE`, `MONTH_ID`, `QTR_ID`, and `YEAR_ID`) and aggregate `SALES` by month or quarter.
        - Top N Orders by Sales: Group by `ORDERNUMBER`, sum `SALES` per order, and sort in descending order to identify the highest-value orders.
        
- **Task 4: Creating Visualizations in Databricks Dashboards (Approx. 1 hour 30 minutes)**
    - Navigate to the "Dashboards" section in your Databricks workspace and create a new dashboard.
    - Add a new visualization widget for each identified metric.
    - Use appropriate chart types for different metrics:
        
        **KPI Widgets:**
        
        - **Total Sales Revenue:** Display the sum of `SALES`.
        - **Number of Orders:** Display the count of distinct `ORDERNUMBER` values.
        - **Average Order Value:** Calculate and display as a KPI.
        
        **Sales Trend Over Time:**
        
        - Create a line chart plotting month/quarter (derived from `ORDERDATE` or using `MONTH_ID`/`QTR_ID` and `YEAR_ID`) on the x-axis and the sum of `SALES` on the y-axis.
        
        **Top N Orders by Sales:**
        
        - Build a bar chart with `ORDERNUMBER` on the x-axis and total sales (sum of `SALES`) on the y-axis, sorted in descending order.
    - Connect each visualization to the sales data table from Task 1.
    - Select appropriate columns and apply necessary aggregations (SUM, COUNT, AVG).
    
- **Task 5: Arranging and Filtering the Dashboard (Approx. 30 minutes)**
    - Arrange visualizations on the dashboard canvas logically and user-friendly.
    - Place the most important metrics prominently at the top.
    - Group related visualizations.
    - Add basic filters to enhance interactivity.

- **Task 6: Saving and Reviewing the Dashboard (Approx. 10 minutes)**
    - Save the completed sales dashboard within the Databricks workspace.
    - Review your work against the initial goals and scenario for GlobalMart.
    - Ensure the dashboard provides required insights into total sales, regional performance, top-selling products, and sales trends.
    - Check if visualizations are clear, understandable, and appropriately labeled.
    - Verify that filters allow for meaningful data exploration.
