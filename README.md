# Database Views and Stored Procedures Project

## Project Overview

This project involves creating various SQL views and stored procedures to manage and retrieve data efficiently from the BikeStores database. The focus is on utilizing database views and stored procedures to simplify complex queries, enhance security, and improve data management.

## Problems and Solutions

### Problem 1: List Company Staff

**Problem Statement:**  
Create a stored procedure to retrieve a list of all staff members from company stores, including their last name, first name, and email address. The results should be sorted alphabetically by last name and first name.

**Solution:**  
A stored procedure named `GetCompanyStaffList` was created to list all staff members. The output includes columns for last name, first name, and email address, ordered alphabetically by last name and then by first name.

---

### Problem 2: List Customers by Zip Code

**Problem Statement:**  
Create a stored procedure to list customers from a specified zip code, showing their details.

**Solution:**  
A stored procedure named `GetCustomersByZipCode` was developed to retrieve customer details based on a provided zip code. It includes customer ID, first name, last name, and email address.

---

### Problem 3: List Mountain Bikes by Brand

**Problem Statement:**  
Create a stored procedure to list mountain bikes for a specific brand. The output should include the bike name, model year, and list price, sorted alphabetically by bike name.

**Solution:**  
The `GetMountainBikesByBrand` stored procedure was created to fetch details of mountain bikes for a specified brand, sorted alphabetically by bike name. The output includes bike name, model year, and list price.

---

### Problem 4: List Bikes by Price Range

**Problem Statement:**  
Create a stored procedure to list bikes within a specified price range. The output should show the bike name, model year, and list price, sorted by price in descending order.

**Solution:**  
A stored procedure named `GetBikesByPriceRange` was created to list bikes within a given price range. The results are ordered by list price in descending order, showing the bike name, model year, and list price.

---

### Problem 5: List Top Five Priced Bikes by Store

**Problem Statement:**  
Create a stored procedure to list the top five highest-priced bikes at a specified store. The output should include the bike name, model year, and list price, sorted by price in descending order.

**Solution:**  
The `GetTopFivePricedBikesByStoreName` stored procedure was created to retrieve the top five highest-priced bikes from a specific store. The results include bike name, model year, and list price, sorted by price in descending order.

---

### Problem 6: Create View for Company Staff List

**Problem Statement:**  
Establish a view called `CompanyStaffListView` that lists the last name, first name, and email address of all staff from company stores.

**Solution:**  
The view `CompanyStaffListView` was created to provide a consolidated view of all staff members, including their last name, first name, and email address.

---

### Problem 7: Create View for Buffalo Customers

**Problem Statement:**  
Create a view named `BuffaloCustomersView` to list the last name, first name, and email address of customers living in Buffalo, NY.

**Solution:**  
The `BuffaloCustomersView` was established to show customer details specifically for those residing in Buffalo, NY. The view includes last name, first name, and email address.

---

### Problem 10: Create View for Unshipped Orders

**Problem Statement:**  
Establish a view named `UnshippedRowlettBikesOrdersView` that lists orders that have not been shipped. The view should include order ID, customer first name, customer last name, and order date. Unshipped orders are identified by `order_status = 1`.

**Solution:**  
The `UnshippedRowlettBikesOrdersView` view was created to display orders that have not been shipped, including the order ID, customer first name, customer last name, and order date.

---

This project showcases the use of SQL views and stored procedures to streamline database queries and improve data management in the BikeStores database.
