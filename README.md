# E-Commerce Order Supply Chain
## Background
In this chapter, the author analyzes customer, product, order, and payment data by one e-commerce. This dataset was obtained from kaggle.com, an online platform that provides resources for learning data science, machine learning, and artificial intelligence (AI).
## Ideation
This dataset consists of five tables including customers, orders, order items, payments, and products. These five tables are interconnected with interconnected unique ids such as customer_id that connects the customers table and the order items table, order_id that connects the orders table, order items and the products table, and product_id that connects the products table and the order items table. As for the ideation of this data analysis, the author is helped by the help of chatgpt.com because it can provide suggestions for ideas in analyzing this data.

## Table of Contents
The analysis that will be carried out includes the following:
- [Delivery performance analysis](#delivery-performance-analysis)
- [Seller Performance Analysis](#seller-performance-analysis)
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

The next analysis aims to determine the average delivery time of each product category. The delivery time is known from the difference between the date the product is received by the customer and the date the product is approved for delivery. The command to provide the expected results is shown in the following figure.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/avg_delivery_product_category.PNG>
</p>

The higher the average delivery time indicates that the product has a long duration to be delivered since it was purchased through e-commerce. The output provided shows that the office furniture product category has the longest average delivery time recording an average time of 24 days.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/avg_delivery_product_category_output.PNG>
</p>

### Sales Performance Analysis
In this analysis, the author wants to know the sales performance of various parameters. The first parameter is the analysis of the total revenue owned by each seller. Total revenue is calculated from the total price of products included in the order items table. the following figure shows the command to get the expected results.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_selling_rate_code.PNG>
</p>

Unfortunately, this dataset does not provide a table containing the data of sellers involved in transaction activities in this e-commerce, so the output provided is only the unique seller_id code and total revenue.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_selling_rate_output.PNG>
</p>

The second parameter analyzed is to analyze the price level of product delivery delays. The price level in this dataset is not specified so the author performs manual classification on the price level. The classification done is quite simple from sorting the prices from smallest to largest, then grouping them into three groups using percentiles, namely small, medium, and large price levels. The common table expression feature is very helpful for this manual classification process as shown in the following figure.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/price_level_late_deliv_relation_code1.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/price_level_late_deliv_relation_code2.PNG>
</p>

The results show that the difference in the number of product delivery delays to the price level is not very significant. It can be seen in the following figure that the medium price level has a total of 2275 delays following the low and high price levels with a difference that is not too far away.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/price_level_late_deliv_relation_output.PNG>
</p>

The third parameter we want to know is the average additional shipping cost paid by each seller. The following figure shows the command to get the expected results.
<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_avg_shipping_charge_code.PNG>
</p>

The output given in the above command gives the results as shown below. Unavailability of custom data containing seller data displays the average shipping surcharge by each seller_id.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/highest_avg_shipping_charge_output.PNG>
</p>

### Product Trend
The next analysis aims to determine the trend of the product category. This analysis consists of several parameters. The first parameter is the product category that has the highest sales rate. The command is performed accordingly as shown in the following figure.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_selling_product_code.PNG>
</p>

The output of the above command is shown in the following image. The product category that gets the highest sales is the toy category by reaching 48439 products.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_selling_product_output.PNG>
</p>

The next parameter is to determine the relationship between product weight and freight cost. As in the previous analysis at the price level, there is no specific classification of product weight, making the author manually classify it using a common table expression as shown in the following figure.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation_code2.PNG>
</p>

The output of the above command is shown in the following image. It can be concluded that the weight of the product does not significantly affect the shipping cost.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation_output.PNG>
</p>

The next parameter is to know the number of product categories sold in a certain period of time. In this case, the author wants to know the trend of product categories in 2016. If you want to know the trend in other years, the **where** clause in the command in the following figure can be adjusted according to the year you want to know the product category trend.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_trend_2016_code.PNG>
</p>

Based on the command executed in the figure above, it can be seen that the product category that has a high trend is the toy category followed by the perfume category.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_trend_2016_output.PNG>
</p>

### Payment Method

This analysis aims to determine the trends in the use of payment methods. Some of the parameters analyzed are to find out the most frequently used payment methods and the relationship between payment types and product delivery times.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_payment_type_code.PNG>
</p>

The first parameter analyzed is the most frequently used payment method in the transaction process. Using the command as shown in the figure above, the output shown in the figure below can be found that the most frequently used payment method is credit card payment.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_payment_type_output.PNG>
</p>

The next parameter that the author wants to know is the relationship between payment methods and product delivery timeliness. The command below shows the command to combine two different tables, namely payments and orders using join (inner join) with the limit of counting products that arrive on time.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/payment_type_ontime_deliv_code.PNG>
</p>

The output generated in the command above shows that most of the products delivered on time are dominated by the use of credit card payment methods. This significant difference factor is caused by the dominant use of credit card payment methods such as the results of the analysis in the first parameter. However, when comparing the percentage between the second parameter and the first parameter, the payment method using vouchers provides the highest percentage **91%** compared to other payment methods. 

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/payment_type_ontime_deliv_output.PNG>
</p>

### Customer Behaviour Analysis by Region
The next analysis is to determine customer behavior based on the customer region. In this analysis, the author divides it into three parameters, namely finding the region that has the highest number of customers, knowing the average customer expenditure from each region, and finding the city that has the highest cancellation rate.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_higher_buy_bycity_code.PNG>
</p>

The first analysis parameter is to find the city with the highest number of customers. The highest number of customers in this analysis, the author provides a criterion that customers are buyers whose products are purchased to the buyer's hands so that buyers whose products do not arrive or are canceled are excluded from this parameter.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_higher_buy_bycity_output.PNG>
</p>

The results of the first parameter are shown in the figure above, namely the region that has the highest number of customers is Sao Paulo with a total of 14020 customers.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/average_region_purch_code.PNG>
</p>

The next parameter analyzed is to know the average customer expenditure of each region. Using the command as shown above gives the results as shown below.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/average_region_purch_output.PNG>
</p>

The results show that the region that has the highest average expenditure is owned by the Itagiba region, which is 3899 dollars per purchase. The Sao Paulo region, which has the highest number of customers, is not shown in the results above. The amount of average expenditure also affects the number of customers so it is likely that the amount spent by the Sao Paulo region tends to be smaller than the regions seen in the figure above.

The next parameter is to find the region that has the highest purchase cancellation rate. Using the command shown in the figure, it counts the number of purchases with canceled delivery status restrictions using the where clause.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/cancelation_rate_region_code.PNG>
</p>

The result of the command in the figure above shows that the region that has the highest cancellation rate is the Sao Paulo region. Although, it has the status as the highest cancellation rate, the value is very small when compared to the total purchases that have a successful delivery status in the São Paulo region, which is only 0.7%.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/cancelation_rate_region_output.PNG>
</p>

### Analyze product size against shipping cost

The next analysis aims to determine the effect of product size and dimensions on the delivery process. This analysis consists of three parameters, namely knowing the relationship between the weight of the goods and the amount of shipping costs, the effect of the volume of goods on shipping costs as well, and knowing the number of products sold based on the volume of products.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation_code2.PNG>
</p>

As in the product weight classification in the product trend analysis, the command is the same to manually classify the product weight using the percentile method in statistics. The above command uses CTE for item weight classification and relates it to the average shipping cost.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/product_weight_shipping_relation_output.PNG>
</p>

The results of the above order show that the effect of the weight of goods does not have a significant effect on the cost of shipping goods. The insignificance of the data may be due to the manual classification of the weights as it does not take into account the distribution of the data such as the standard deviation or the variance of the weights. If there were clear classification instructions for the weight criteria, the results would most likely be different.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/productdim_shipping_relation_code.PNG>
</p>

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/productdim_shipping_relation_code2.PNG>
</p>

Manual classification was also performed on the second parameter, which was to determine the relationship between product dimensions and average product shipping costs. In product dimensions, the author refers to the volume of each product and all products are assumed to be blocks so that the volume is obtained from multiplying the length, width, and height of the product.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/productdim_shipping_relation_output.PNG>
</p>

An insignificant relationship is also given to the relationship between the volume of goods and the average shipping cost due to this manual classification method.

This parameter uses the product volume classification in the second parameter. In this parameter, the expected analysis result is to know the number of products purchased based on product volume. The distinct clause is used to avoid the same product being counted more than once.

<p align ='center'>
<img src = https://github.com/AbdulDunggio/E-Commerce_Order_SupplyChain/blob/main/img-src/most_product_by_avg_dim_code.PNG>
</p>

The results of the above order show that the products purchased are fairly evenly distributed by product volume. 

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
