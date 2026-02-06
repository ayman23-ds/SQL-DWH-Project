use datawarehouse;

create table dim_customer (
customer_sk INT NOT NULL AUTO_INCREMENT,
customer_id int unique,
customer_key varchar(50)  unique,
customer_firstname varchar(50),
customer_lastname varchar(50),
customer_marital_status varchar(20),
customer_create_date date ,
customer_DOB date,
customer_country varchar(30),
customer_gender varchar(20),
primary key (customer_sk)
);

create table dim_product (
product_sk INT NOT NULL AUTO_INCREMENT,
product_id int,
product_category_id varchar(50),
product_key varchar(50),
product_number varchar(80),
product_cost int,
product_line varchar(20),
product_categoty varchar(50),
product_subcategory varchar(50),
product_maintenance varchar(20),
product_start_date datetime,
product_is_current int,
primary key (product_sk),
INDEX idx_dim_product_key (product_key)
);


create table fact_sales (
	sales_sk INT NOT NULL AUTO_INCREMENT,
	order_number varchar(30),
    product_key varchar(30),
    customer_id int ,
    order_date date,
    shipping_date date,
    due_date date,
    sales int,
    quantity int ,
    price int ,
    primary key (sales_sk),
	FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);


