create or replace view sales_data_for_powerbi as

select T1.orderNumber, T1.orderDate, T3.customerName, T3.country as customers_country, T6.country as offices_country,
T4.productName, T4.buyPrice, T2.priceEach, T2.quantityOrdered,
T2.quantityOrdered * T4.buyPrice as costs_of_sale,
T2.quantityOrdered * T2.priceEach as sales_value
from orders T1
inner join orderdetails T2
on T1.orderNumber = T2.orderNumber
inner join customers T3
on T3.customerNumber = T1.customerNumber
inner join products T4
on T4.productCode = T2.productCode
inner join employees T5
on T5.employeeNumber = T3.salesRepEmployeeNumber
inner join offices T6
on T6.officecode = T5.officecode
