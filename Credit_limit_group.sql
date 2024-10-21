with cte_main as
(select T1.customerNumber, T1.customerName, T1.creditLimit, T3.orderNumber, 
T4.productCode, T4.priceEach, T4.quantityOrdered, 
T4.priceEach * T4.quantityOrdered as sale_value
from customers T1
inner join payments T2
on T1.customerNumber = T2.customerNumber
inner join orders T3
on T2.customerNumber = T3.customerNumber
inner join orderdetails T4 
on T3.orderNumber = T4.orderNumber)

select customernumber, ordernumber, creditlimit, sum(sale_value) as sum_sale_value 
from cte_main
group by customernumber, ordernumber, creditlimit;


with cte_main as
(SELECT T1.orderNumber, T1.quantityOrdered, T1.priceEach, T2.customerNumber,T3.customerName, T3.creditLimit, T1.quantityOrdered * T1.priceEach as sale_value
FROM classicmodels.orderdetails T1
inner join orders T2
on T1.orderNumber = T2.orderNumber
inner join customers T3
on T2.customerNumber = T3.customerNumber
)
select customername, customernumber, ordernumber, sum(sale_value) as sum_sale_value,
case when creditlimit < 75000 then 'a: Less than $75k' 
when creditlimit between 75000 and 100000 then 'b: $75k - $100k'
when creditlimit between 100000 and 150000 then 'c: $100k - $150k'
when creditlimit > 150000 then 'd: >$150k'
else 'Other'
end as creditlimit_group
from cte_main
group by customername, customernumber, ordernumber, creditlimit_group