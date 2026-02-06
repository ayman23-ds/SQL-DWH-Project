USE datawarehouse;

-- 1- Total Revenue & Units Sold
SELECT
    SUM(sales)   AS total_revenue,
    SUM(quantity) AS total_units_sold
FROM fact_sales;

-- 2- Monthly Revenue with Total Units Sold per Month
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales)    AS monthly_revenue,
    SUM(quantity) AS total_units_sold
FROM fact_sales
WHERE order_date is not null
GROUP BY month
ORDER BY month;

-- 3- Total Revenue per Product
SELECT
    p.product_number,
    SUM(f.sales) AS total_revenue
FROM fact_sales f
JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.product_number
ORDER BY total_revenue DESC;

-- 4- Top 10 Products by revenue
SELECT
    p.product_number,
    SUM(f.sales) AS total_revenue
FROM fact_sales f
JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.product_number
ORDER BY total_revenue DESC
LIMIT 10;

-- 5- Total Profit
SELECT
    SUM(f.sales - (f.quantity * p.product_cost)) AS total_profit
FROM fact_sales f
JOIN dim_product p
    ON f.product_key = p.product_key;

-- 6- Profit Margin by Product
SELECT
    p.product_number,
    CONCAT(ROUND((SUM(f.sales - (f.quantity * p.product_cost)) / SUM(f.sales)*100),2), ' %') AS profit_margin_percentage
FROM fact_sales f
JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.product_number
ORDER BY profit_margin_percentage DESC;

-- 7- Profit Margin by Category
SELECT
    p.product_category,
    concat(Round(SUM(f.sales - (f.quantity * p.product_cost)) / SUM(f.sales) *100,2),' %') AS profit_margin
FROM fact_sales f
JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.product_category;

-- 8- Revenue by Customer
SELECT
    c.customer_id,
    c.customer_firstname,
    c.customer_lastname,
    SUM(f.sales) AS total_revenue
FROM fact_sales f
JOIN dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.customer_firstname,
    c.customer_lastname
ORDER BY total_revenue DESC;

-- 9- Revenue by Gender
SELECT
    case when c.customer_gender is null then "NOT SPECIFIED" ELSE c.customer_gender END AS customer_gender,
    SUM(f.sales) AS total_revenue
FROM fact_sales f
JOIN dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY c.customer_gender;

-- 10- Top 10 Buying Customers
SELECT
    c.customer_id,
    c.customer_firstname,
    c.customer_lastname,
    SUM(f.sales) AS total_revenue
FROM fact_sales f
JOIN dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.customer_firstname,
    c.customer_lastname
ORDER BY total_revenue DESC
LIMIT 10;

-- 11- Average Shipping Time (days)
SELECT
    CONCAT(ROUND(AVG(DATEDIFF(shipping_date, order_date)),0) , ' Days') AS avg_shipping_days
FROM fact_sales;

-- 12- Late Orders per Month
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS late_orders
FROM fact_sales
WHERE shipping_date > due_date
GROUP BY month
ORDER BY month;

-- 13- Year-over-Year Revenue Growth
SELECT
    year,
    revenue,
    LAG(revenue) OVER (ORDER BY year) AS prev_year_revenue,
    concat(Round((revenue - LAG(revenue) OVER (ORDER BY year))
        / LAG(revenue) OVER (ORDER BY year) *100,2),' %') AS yoy_growth
FROM (
    SELECT
        YEAR(order_date) AS year,
        SUM(sales) AS revenue
    FROM fact_sales
    WHERE order_date IS NOT null
    GROUP BY YEAR(order_date)
) t
ORDER BY year;