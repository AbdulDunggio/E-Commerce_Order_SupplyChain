# E-Commerce Order Supply Chain
## Background
In this chapter, the author analyzes customer, product, order, and payment data by one e-commerce. This dataset was obtained from kaggle.com, an online platform that provides resources for learning data science, machine learning, and artificial intelligence (AI).
## Ideation
This dataset consists of five tables including customers, orders, order items, payments, and products. These five tables are interconnected with interconnected unique ids such as customer_id that connects the customers table and the order items table, order_id that connects the orders table, order items and the products table, and product_id that connects the products table and the order items table. As for the ideation of this data analysis, the author is helped by the help of chatgpt.com because it can provide suggestions for ideas in analyzing this data.

## Table of Contents
The analysis that will be carried out includes the following:
- [Delivery performance analysis](#delivery-performance-analysis)
- Seller Performance Analysis
- Product Category Trends
- Payment method analysis
- Customer behavior analysis by region
- Analyze product size against shipping cost
- Order status analysis
- Order value and volume analysis.

This dataset is downloaded in csv format, in order to be processed using sql, this dataset must first be imported into a sql database.
### Import CSV files to MySQL
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/create%20table1.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/create%20table2.PNG>
</p>

The picture above shows the initial stage of the data import process into mysql, which is to create five tables in mysql with a format that matches the data content. If the data contains a string then the format is string, if the data contains an integer then it is set integer, and if the data contains a timestamp format then it is set in the timestamp type. As shown in the following image.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/desctable.PNG>
</p>

To ensure the table already exists, validate it by using the desc command to see the description of each table as shown above and the output is as shown below.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/output_desc_table.PNG>
</p>

The second stage is the process of importing CSV datasets into mysql. In this process the author uses the help of a python program, especially the pandas module to import csv data and the mysql.connector module to connect the dataset into mysql. the tools used are jupyter notebook and the script is shown as shown below. 

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/line1_import_table.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/line2_import_table.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/line3_import_table.PNG>
</p>

The data import process is successful if the output given is as shown in the image above. The analysis process can already be done using MySQL. The tool used in this data processing is visual studio code.

### Delivery Performance Analysis
The first analysis carried out is to analyze the performance of product delivery including analyzing the percentage of products whose order status has been delivered to the total order. This analysis uses a common table expression as shown in the following figure.
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/percentage_on_time_delivery_code.PNG>
</p>
The above command outputs the percentage value of orders received by the customer. As shown in the following figure, the percentage value of orders that arrived is 90.34%.
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/output_on_time_delivery.PNG>
</p>

The next analysis aims to determine the total product delivery delays that occur in each city. The delay of a product is determined from the time of arrival of the product exceeding the estimated time of arrival of the product. The order performed is shown in the following figure.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/city_highest_delay_code.PNG>
</p>

The output given from the command in the image above gives the result as shown below. Based on this figure, it can be concluded that the city that has a total delay in product delivery is owned by the city of Sao Paulo with a total delay of 816 times.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/city_highest_delay_output.PNG>
</p>

1.3
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/avg_delivery_product_category.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/avg_delivery_product_category_output.PNG>
</p>

2.1
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_selling_rate_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_selling_rate_output.PNG>
</p>

2.2
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/price_level_late_deliv_relation_code1.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/price_level_late_deliv_relation_code2.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/price_level_late_deliv_relation_output.PNG>
</p>

2.3
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_avg_shipping_charge_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_avg_shipping_charge_output.PNG>
</p>

3.1
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_selling_product_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_selling_product_output.PNG>
</p>

3.2
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation_code2.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation_output.PNG>
</p>

3.3
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_trend_2016_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_trend_2016_output.PNG>
</p>

4.1
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_payment_type_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_payment_type_output.PNG>
</p>

4.2
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/payment_type_ontime_deliv_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/payment_type_ontime_deliv_output.PNG>
</p>

5.1
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_higher_buy_bycity_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_higher_buy_bycity_output.PNG>
</p>

5.2
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/average_region_purch_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/average_region_purch_output.PNG>
</p>

5.3
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/cancelation_rate_region_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/cancelation_rate_region_output.PNG>
</p>

6.1 
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation_code2.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation_output.PNG>
</p>

6.2
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/productdim_shipping_relation_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/productdim_shipping_relation_code2.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/productdim_shipping_relation_output.PNG>
</p>

6.3
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_product_by_avg_dim_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_product_by_avg_dim_output.PNG>
</p>

7.1
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/total_canceled_product_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/total_canceled_product_output.PNG>
</p>

7.2
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/diff_day_order_status_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/diff_day_order_status_code2.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/diff_day_order_status_output.PNG>
</p>

7.3
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/order_status_period_2016.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/order_status_period_2016_output.PNG>
</p>

8.1
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/avg_amount_value_by_customer_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/avg_amount_value_by_customer_output.PNG>
</p>

8.2
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_selling_rate_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_selling_rate_output.PNG>
</p>

8.3
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/purchase_value_payment_type_relation.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/purchase_value_payment_type_relation_code2.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/purchase_value_payment_type_relation_output.PNG>
</p>
