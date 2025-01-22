show databases;

use my_portfolio

CREATE TABLE Customers (
    customer_id varchar(255),
    customer_zip_code_prefix int,
    customer_city varchar(255),
    customer_state varchar(255)
);

CREATE TABLE order_items(
    order_id varchar(255),
    product_id VARCHAR(255),
    seller_id VARCHAR(255),
    price INT,
    shipping_charges int
)

CREATE TABLE orders(
    order_id VARCHAR(255),
    customer_id varchar(255),
    order_status varchar(255),
    order_purchase_timestamp timestamp,
    order_approved_at timestamp,
    order_delivered_timestamp timestamp,
    order_estimated_delivery_date timestamp
)

CREATE TABLE payments(
    order_id varchar(255),
    payment_sequential int,
    payment_type varchar(255),
    payment_installments INT,
    payment_value decimal
)

CREATE TABLE products(
    product_id varchar(255),
    product_category_name varchar(255),
    product_weight_g int,
    product_length_cm int,
    product_height_cm int,
    product_width_cm int
)
