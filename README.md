# Brazilian-E-Commerce

The objective of this project was to perform an in-depth analysis of the Brazilian e-commerce public database provided by Olist. The goal was to gain valuable insights into various facets of the e-commerce landscape and to present these findings through compelling visualizations. I used SQL to explore, manipulate, and analyze the database to discover trends, patterns and relationships within the data. Utilized Tableau to create an informative dashboard with visualizations that illustrate findings and communicate insights effectively.

Tableau Dashboard: https://public.tableau.com/views/Ecommercedashboard_17191035896240/BrazilianE-CommerceSalesDashboard?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link

Database from Kaggle: https://www.kaggle.com/datasets/terencicp/e-commerce-dataset-by-olist-as-an-sqlite-database

Project Introduction
E-commerce is a rapidly growing sector, and understanding its intricacies is crucial for businesses looking to thrive in this competitive landscape. This project captured my interest due to the dynamic nature of the Brazilian e-commerce market and the potential insights that could be derived from its data. The objective was to perform an in-depth analysis of the Brazilian e-commerce public database provided by Olist, aiming to uncover valuable trends, patterns, and relationships, and to present these findings through compelling visualizations.

Dataset Information
The dataset for this project was sourced from Olist, a well-known Brazilian e-commerce platform. I would like to give credit to Olist for providing this comprehensive dataset, which includes a variety of information crucial for analysis. The dataset columns are as follows:

Order ID: Unique identifier for each order.
Customer ID: Unique identifier for each customer.
Order Status: Status of the order (e.g., delivered, canceled).
Order Purchase Timestamp: Date and time when the order was placed.
Order Approved Timestamp: Date and time when the order was approved.
Order Delivered Carrier Date: Date when the order was delivered to the carrier.
Order Delivered Customer Date: Date when the order was delivered to the customer.
Order Estimated Delivery Date: Estimated delivery date of the order.
Product ID: Unique identifier for each product.
Seller ID: Unique identifier for each seller.
Price: Price of the product.
Freight Value: Freight cost for the order.
Payment Type: Method of payment (e.g., credit card, voucher).
Payment Installments: Number of payment installments.
Problems
The main questions I aimed to solve using the data were:

What are the key sales trends over time in the Brazilian e-commerce market?
How do customer purchase behaviors vary across different regions and product categories?
What factors influence order fulfillment and delivery times?
Which product categories perform the best in terms of sales and customer satisfaction?
Data Cleaning
To ensure the dataset was ready for analysis, I undertook the following data cleaning steps:

Handling Missing Values: Identified and handled missing values by either filling them appropriately or removing the affected rows.
Standardizing Data Entries: Corrected inconsistent data entries to ensure uniformity across the dataset.
Filtering Irrelevant Data: Removed rows and columns that were not relevant to the analysis.

Analysis
During the analysis, some rows were added or removed to maintain the relevance of the dataset for solving the identified problems:

Rows Removed: Orders with incomplete data or those that were canceled were excluded from the analysis.
Rows Added: Derived columns, such as delivery time and delay, were added to provide deeper insights.
Dashboard Takeaways
The informative dashboard created using Tableau features several key visualizations:

Sales Trends Over Time:

Visual: Line chart showing monthly sales trends.
Relevance: Highlights sales peaks and troughs, addressing the first problem.
Customer Purchase Behaviors:

Visual: Heatmap of purchase frequency by region and product category.
Relevance: Shows regional and category-specific purchase patterns, addressing the second problem.
Order Fulfillment and Delivery Times:

Visual: Bar chart comparing actual vs. estimated delivery times.
Relevance: Identifies delays and efficiency in the delivery process, addressing the third problem.
Product Category Performance:

Visual: Pie chart of sales distribution by product category.
Relevance: Illustrates which categories are most popular, addressing the fourth problem.
Conclusion
By analyzing the dataset, the following questions were answered:

Key Sales Trends: Identified seasonal peaks and overall growth in sales.
Customer Purchase Behaviors: Found significant regional differences in purchase patterns and preferences.
Order Fulfillment Factors: Delivery delays were primarily influenced by geographic distance and product availability.
Product Category Performance: Electronics and home goods were the top-performing categories.
Business Solutions
Based on the insights derived from this analysis, the following business solutions are proposed:

Seasonal Promotions: Implement targeted promotions during identified sales peaks to maximize revenue.
Regional Marketing Strategies: Develop region-specific marketing campaigns to cater to local preferences.
Improved Logistics: Optimize delivery routes and inventory management to reduce delivery times.
Focus on Top Categories: Allocate more resources to top-performing categories to boost sales further.
