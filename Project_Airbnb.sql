select *
from airbnb_project

--Grouping price range for easier visualization 

 SELECT *,  case	
     when price<=50 then '10-50'
	 when price<=150 then '51-150'
	 when price<=500 then '151-500'
	 when price<=1000 then '501-1000'
	 when price<=2000 then '1001-2000'
	 when price<=3000 then '2001-3000'
	 when price<=4000 then '3001-4000'
	 when price<=5000 then '4001-5000'
	 when price<=6000 then '5001-6000'
	 when price<=7000 then '6001-7000'
	 when price<=7500 then '7001-7500'
end as 'price_group'	 
 FROM airbnb_project
 order by price desc

 select *
from airbnb_project

--Counting prices for charts

 select count(price) as 'count_of_prices' , price
 from airbnb_project
 group by price
 order by 1 desc

