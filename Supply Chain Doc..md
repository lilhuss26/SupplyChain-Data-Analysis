# Supply Chain Cycle

- **Suppliers**: Raw materials are sourced from suppliers.
- **Manufacturing**: The raw materials are transformed into finished goods.
- **Warehousing**: Once produced, products are stored in warehouses until they're needed by customers.
- **Distribution**: Goods are then transported from warehouses to distribution costumers.
--------------------------------------------------------------------------
# Used Tools 

- Excel
	- Explore data
- Python (Pandas, matplotlib, seaborn)                                            
	- Clean and preprocess the data
	- Explore data insights
- SQL
	- Model the data
	- Answer analysis questions
- Tableau
	- Build visualization dashboard to visualize the answers
---
# Steps
## Step 1
- Good understanding for data
- Data Quality checked 
	- No Nulls
	- Data types are correct
	- No Outliers 
	- Data is complete
- Created a database with flat table
- Data is now ready for analysis
## Step 2 
- All possible questions about the data was generated
	- Manufacturing
	- Suppliers
	- Warehousing
	- Transportation
	- Sales
## Step 3
- Further data exploration with python to start answer the questions
- Multiple queries to answer more complicated questions
## Step 4 
- Visualize the answers to all answered questions
---
# Columns

- **Product type**: Category of product being sold
- **SKU**: Unique identifier for each product
- **Price**: The cost of the product to the customer.
- **Availability**: is the % of products available at a given time.
- **Number of products sold**: How many pieces was sold
- **Revenue generated**: How much was earn.
- **Customer demographics**: Customers genders.
- **Stock levels**: The amount of inventory available at any given time
- **Lead times**: The time it takes from ordering a product until it is available.
- **Order quantities**: The number of orders.
- **Shipping times**: The duration it takes to transport the product from the warehouse to the customer.
- **Shipping carriers**: The companies responsible for transporting the products.
- **Shipping costs**: The expense associated with transporting the product to the customer.
- **Production volumes**: The quantity of products manufactured over a given period.
- **Location**: The warehouse placement.
- **Manufacturing lead time**: The time it takes to produce the product.
- **Inspection results**: Data from quality inspections of the products before they are shipped.
- **Defect rates**: The percentage of products found to be defective for manifested products.
- **Transportation mode**: The method of transport used
- **Routes**:The paths or routes taken by transport carriers.


Lead time ----> Time supplier takes to fulfill an order
Lead times -----> The time it takes from ordering a product until it is available
Manufacturing lead time -----> The time it takes to manufacture the product.

---
# Analysis Questions

## Stock
- Which locations have the highest availability 
- Relation between lead times and availability
- Which locations have the latest lead times
- If availability is high, and order quantities is big that means the stock is satisfying
- Stock level with product type (Which product type requires the most stock)(Is this matching the production volumes)
## Supplier
- Supplier and defect rate
- Supplier and lead time
- Supplier and production volumes
- Supplier and sold products
- Most supplier
- Supplier and inspection results
- Supplier and product type 
## Manufacturing
- Manufacturing lead time and cost
- Cost and production volume 
- Cost and product type 
- Defect rate and cost
- Defect rate and product type
- Inspection result and cost, lead time
- Lead time and defect rate
## Transportation
- Which transportation mode is the most frequently used
- How do transportation modes impact shipping costs or shipping times
- Which transportation mode provides the fastest delivery on average
- Which transportation mode provides the shortest and longest shipping times
- How do different carriers affect shipping times and costs
- Are specific carriers specialized for certain routes or transportation modes
## Product and Sales
- Revenue relation with product type
- Selling pieces relation with product type
- Orders relation with product type
- Products sold per order 
- Revenues per order relation with product type
- Price relation with number of units sold 
- Units relation with revenues 
- Orders with most return rate
- Total time required for product