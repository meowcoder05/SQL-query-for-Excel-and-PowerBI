select T1.orderDate, T1.orderNumber, T2.quantityOrdered, T2.priceEach, T3.productName, T3.productLine, T3.buyPrice,
T4.city, T4.country
from orders T1
inner join orderdetails T2
on T1.orderNumber = T2.orderNumber
inner join products T3
on T2.productCode = T3.productCode
inner join customers T4
on T1.customerNumber = T4.customerNumber
where year(orderdate) = 2004