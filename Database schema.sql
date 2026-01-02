CREATE DATABASE SupplyChain
    DEFAULT CHARACTER SET = 'utf8mb4';

USE SupplyChain;
CREATE TABLE supplychainfact (
    SKU VARCHAR(5) PRIMARY KEY,
    Product_type VARCHAR(10),
    Price DECIMAL(10, 2),
    Supplier_name VARCHAR(10),
    Lead_time TINYINT ,
    Manufacturing_lead_time TINYINT,
    Manufacturing_costs DECIMAL(10, 2),
    Production_volumes SMALLINT,
    Stock_levels SMALLINT,
    Availability SMALLINT,
    Lead_times TINYINT,
    Defect_rates DECIMAL(7, 5),
    Inspection_results VARCHAR(7),
    Transportation_modes VARCHAR(5),
    Routes VARCHAR(7),
    Shipping_times TINYINT,
    Shipping_carriers VARCHAR(10),
    Shipping_costs DECIMAL(7,2),
    Location VARCHAR(10),
    Order_quantities SMALLINT,
    Sold_products SMALLINT,
    Revenue_generated DECIMAL(10,2),
    Customer_gender VARCHAR(10),
    Costs DECIMAL(10,2)
    );
    
LOAD DATA INFILE 'supplychain.csv'
INTO TABLE Fact
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(   SKU  ,
    Product_type ,
    Price ,
    Supplier_name ,
    Lead_time  ,
    Manufacturing_lead_time ,
    Manufacturing_costs  ,
    Production_volumes ,
    Stock_levels ,
    Availability ,
    Lead_times ,
    Defect_rates ,
    Inspection_results ,
    Transportation_modes ,
    Routes ,
    Shipping_times ,
    Shipping_carriers ,
    Shipping_costs ,
    Location ,
    Order_quantities ,
    Sold_products ,
    Revenue_generated ,
    Customer_gender,
    Costs);
