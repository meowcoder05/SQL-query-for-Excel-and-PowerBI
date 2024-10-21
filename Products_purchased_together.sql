with product_sales as 
(select orderNumber, T1.productCode, productLine
from products T1
inner join orderdetails T2
on T1.productCode = T2.productCode)

select distinct T1.ordernumber, T1.productline as product_one, T2.productline as product_two
from product_sales T1
left join product_sales T2
on T1.ordernumber = T2.ordernumber and T1.productline <> T2.productline