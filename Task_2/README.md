# Online Store Management System
This Online Store Management System enables e-commerce platforms to manage customers, products, orders, inventory, and payments efficiently. It allows users to browse and purchase items, while automatically handling stock updates, order tracking, and payment logging.

# Features
### Customer Management (Register, Login, Profile)
Product Management (Add, View, Update Products)
Order Management (Create, Track, Cancel Orders)
Inventory System (Auto Update Stock Levels)
Payment Handling (Record & Track Payments)
Order Status Workflow (Pending → Shipped → Delivered)
Reports & Queries (Top Products, Sales by Date, etc.)

🔄 Workflow
1. Customer Registration
New users sign up and are added to the Customers table with name, email, password, phone, and address. Each user is assigned a unique customer_id.

2. Product Management
Admins add products to the Products table with fields like name, description, category, price, stock quantity, and SKU. Each product has a unique product_id.

3. Placing an Order
When a customer places an order:

A record is added to the Orders table with customer_id, order_date, status = 'Pending'.

Items are added to the Order_Items table, linked to order_id and product_id, including quantity and price at time of order.

The Inventory is updated, decreasing stock levels.

4. Order Fulfillment
Admins or warehouse staff update the Orders table:

status changes to 'Shipped', then 'Delivered'.

If canceled, the stock is restored.

5. Payment Recording
When a payment is made:

An entry is inserted into the Payments table with payment_id, order_id, amount, method, status, and timestamp.

6. Checking Inventory Levels
Products with low stock can be monitored using:

sql
Copy
Edit
SELECT * FROM Products WHERE stock_quantity < 5;
7. View Top Selling Products
sql
Copy
Edit
SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 10;
🗂️ Database Schema
📋 Customers Table
| customer_id | name | email | password | phone | address | created_at |

🛍️ Products Table
| product_id | name | description | category | price | sku | stock_quantity | created_at |

📦 Orders Table
| order_id | customer_id | order_date | status | total_amount |

🧾 Order_Items Table
| item_id | order_id | product_id | quantity | price_at_order_time |

💰 Payments Table
| payment_id | order_id | amount | method | status | payment_date |

📉 Inventory (optional separate table or as part of Products)
| inventory_id | product_id | stock_quantity | last_updated |
