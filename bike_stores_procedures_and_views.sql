USE BikeStores;

-- ========================================
-- Problem 1: List Company Staff
-- ========================================
-- This stored procedure retrieves the last name, first name, and email of all staff members,
-- and orders the results alphabetically by last name and then by first name.
CREATE PROCEDURE GetCompanyStaffList
AS
BEGIN
    SELECT last_name, first_name, email
    FROM sales.staffs
    ORDER BY last_name, first_name;
END

-- Execute the stored procedure
EXEC GetCompanyStaffList;

-- ========================================
-- Problem 2: List Customers by Zip Code
-- ========================================
-- This stored procedure retrieves customer details for a given zip code.
-- It returns customer ID, first name, last name, and email.
CREATE PROCEDURE GetCustomersByZipCode
    @ZipCode VARCHAR(5)
AS
BEGIN
    SELECT customer_id, first_name, last_name, email
    FROM sales.customers
    WHERE zip_code = @ZipCode;
END

-- Execute the stored procedure for zip code '75115'
EXEC GetCustomersByZipCode @ZipCode = '75115';

-- ========================================
-- Problem 3: List Mountain Bikes by Brand
-- ========================================
-- This stored procedure retrieves mountain bikes for a specific brand.
-- It includes the bike name, model year, and list price, sorted by bike name.
CREATE PROCEDURE GetMountainBikesByBrand
    @Brand VARCHAR(255)
AS
BEGIN
    SELECT p.product_name AS BikeName, p.model_year AS ModelYear, p.list_price AS ListPrice
    FROM production.brands b
    JOIN production.products p ON b.brand_id = p.brand_id
    WHERE b.brand_name = @Brand
    ORDER BY p.product_name;
END

-- Execute the stored procedure for brand 'Haro'
EXEC GetMountainBikesByBrand @Brand = 'Haro';

-- ========================================
-- Problem 4: List Bikes by Price Range
-- ========================================
-- This stored procedure retrieves bikes within a specified price range.
-- It returns the bike name, model year, and list price, ordered by bike name.
CREATE PROCEDURE GetBikesByPriceRange
    @MinPrice DECIMAL(10,2),
    @MaxPrice DECIMAL(10,2)
AS
BEGIN
    SELECT product_name AS BikeName, model_year, list_price
    FROM production.products
    WHERE list_price BETWEEN @MinPrice AND @MaxPrice
    ORDER BY product_name;
END

-- Execute the stored procedure for bikes priced between $6000 and $12000
EXEC GetBikesByPriceRange @MinPrice = 6000, @MaxPrice = 12000;

-- ========================================
-- Problem 5: List Top Five Priced Bikes by Store
-- ========================================
-- This stored procedure retrieves the top five most expensive bikes from a specified store.
-- It includes bike name, model year, and list price, sorted by price in descending order.
CREATE PROCEDURE GetTopFivePricedBikesByStoreName
    @StoreName VARCHAR(255)
AS
BEGIN
    SELECT TOP 5 p.product_name, p.model_year, p.list_price
    FROM production.products p
    JOIN production.stocks s ON s.product_id = p.product_id
    JOIN sales.stores ss ON ss.store_id = s.store_id
    WHERE ss.store_name = @StoreName
    ORDER BY p.list_price DESC;
END

-- Execute the stored procedure for store 'Baldwin Bikes'
EXEC GetTopFivePricedBikesByStoreName @StoreName = 'Baldwin Bikes';

-- ========================================
-- Problem 6: Create View for Company Staff List
-- ========================================
-- This view provides a consolidated list of all staff members, including their last name, first name, and email.
CREATE VIEW CompanyStaffListView AS
SELECT last_name, first_name, email
FROM sales.staffs;

-- Query the view to verify its content
SELECT * FROM CompanyStaffListView;

-- ========================================
-- Problem 7: Create View for Buffalo Customers
-- ========================================
-- This view lists customers living in Buffalo, NY, with their last name, first name, and email address.
CREATE VIEW BuffaloCustomersView AS
SELECT last_name, first_name, email
FROM sales.customers
WHERE city = 'Buffalo';

-- Query the view to verify its content
SELECT * FROM BuffaloCustomersView;

-- ========================================
-- Additional Problem: Low Inventory at Rowlett Bikes
-- ========================================
-- This view lists products with low inventory (less than 2 units) at the 'Rowlett Bikes' store.
CREATE VIEW LowRowlettBikesInventoryView AS
SELECT p.product_name, b.brand_name, s.quantity
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
JOIN production.stocks s ON p.product_id = s.product_id
JOIN sales.stores ss ON s.store_id = ss.store_id
WHERE s.quantity < 2 AND ss.store_name = 'Rowlett Bikes';

-- Query the view to verify its content
SELECT * FROM LowRowlettBikesInventoryView;

-- ========================================
-- Additional Problem: Low-Cost Bikes
-- ========================================
-- This view lists bikes priced below $200, including their product name, brand name, and list price.
CREATE VIEW LowCostBikesView AS
SELECT p.product_name, b.brand_name, p.list_price
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
WHERE p.list_price < 200;

-- Query the view to verify its content
SELECT * FROM LowCostBikesView;

-- ========================================
-- Problem 10: Create View for Unshipped Orders
-- ========================================
-- This view lists orders that have not been shipped, including order ID, customer first name, customer last name, and order date.
-- Unshipped orders are identified by order_status = 1.
CREATE VIEW UnshippedRowlettBikesOrdersView AS
SELECT o.order_id, c.first_name, c.last_name, o.order_date
FROM sales.orders o
JOIN sales.customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 1;

-- Query the view to verify its content
SELECT * FROM UnshippedRowlettBikesOrdersView;
