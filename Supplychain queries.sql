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


use supplychain;

select shipping_carriers,transportation_modes,count(transportation_modes) from supplychainfact
group by shipping_carriers,transportation_modes;

SELECT transportation_modes, shipping_carriers, COUNT(shipping_carriers) AS carrier_count
FROM supplychain.supplychainfact
GROUP BY transportation_modes, shipping_carriers
HAVING carrier_count = (
    SELECT MAX(carrier_count)
    FROM (
        SELECT COUNT(shipping_carriers) AS carrier_count
        FROM supplychain.supplychainfact AS inner_fact
        WHERE inner_fact.transportation_modes = supplychain.supplychainfact.transportation_modes
        GROUP BY inner_fact.shipping_carriers
    ) AS subquery
);
select shipping_carriers,avg(shipping_costs),avg(shipping_times) from supplychain.supplychainfact
group by shipping_carriers;
-- Stock
select location, avg(availability),sum(Order_quantities) from supplychain.supplychainfact
group by location ;

select avg(availability), location,count(product_type),product_type from supplychain.supplychainfact
group by location,product_type;
-- Supplier
SELECT supplier_name,avg(defect_rates) from supplychain.supplychainfact
group by supplier_name;

select supplier_name, count(supplier_name) from supplychain.supplychainfact
group by supplier_name;

SELECT supplier_name,avg(lead_time) from supplychain.supplychainfact
group by supplier_name;

SELECT supplier_name,avg(production_volumes) from supplychain.supplychainfact
group by supplier_name;

select supplier_name, sum(Sold_products) from supplychain.supplychainfact
group by supplier_name;

select supplier_name,Inspection_results, count(Inspection_results) from supplychain.supplychainfact
group by supplier_name,Inspection_results;

select supplier_name,product_type, count(Inspection_results) from supplychain.supplychainfact
group by supplier_name,product_type;

-- Manufacturing
SELECT Inspection_results,count(Inspection_results),Avg(manufacturing_lead_time),avg(manufacturing_costs) from supplychain.supplychainfact
group by Inspection_results;

SELECT SKU,Avg(manufacturing_lead_time), AVG(Production_volumes) 
group by SKU;
-- product/sales
Select sum(Revenue_generated),Product_type from supplychain.supplychainfact
group by Product_type;

Select sum(Sold_products),Product_type from supplychain.supplychainfact
group by Product_type;

Select sum(Order_quantities),Product_type from supplychain.supplychainfact
group by Product_type;

Select sum(Sold_products)/sum(Order_quantities),Product_type from supplychain.supplychainfact
group by Product_type;

Select sum(Revenue_generated)/sum(Order_quantities),Product_type from supplychain.supplychainfact
group by Product_type;

Select sum(Sold_products)/sum(Order_quantities),avg(price),Product_type from supplychain.supplychainfact
group by Product_type;

Select sum(Sold_products),avg(price),Product_type from supplychain.supplychainfact
group by Product_type;

Select sum(Sold_products),sum(Revenue_generated),Product_type from supplychain.supplychainfact
group by Product_type;

select SKU from supplychain.supplychainfact
Where Order_quantities > Sold_products;

Select avg(price),sum(Revenue_generated),Product_type from supplychain.supplychainfact
group by Product_type;

select Product_type,avg(Manufacturing_lead_time + Lead_times + Lead_time + Shipping_times) as total_time from supplychain.supplychainfact
group by Product_type;

select supplier_name,product_type,count(product_type) from supplychain.supplychainfact
where supplier_name = "Supplier 3"
group by product_type,supplier_name;

SELECT SKU,Product_type,Supplier_name,Manufacturing_costs,Transportation_modes,Shipping_carriers,Location FROM supplychain.supplychainfact
WHERE SKU IN ("SKU2", "SKU45","SKU85");
