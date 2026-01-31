drop table phone;
select * from phone;


select count(*) from phone;

alter table phone 
rename column `name` to `phone_name`;

#### average price of phone
select phone_name,round(avg(price)) from phone
group by phone_name;

### what is the average maximum and minimum price of phone ###
SELECT
  AVG(price) AS avg_price,
  MIN(price) AS min_price,
  MAX(price) AS max_price
FROM phone;

### How much does price increase per extra GB of RAM ###?
SELECT ram,
       AVG(price) AS avg_price
FROM phone
GROUP BY ram
ORDER BY ram;

### Which brands reduce prices the most###
select brand, avg(old_price-price) as price_drop
from phone 
group by brand 
order by price_drop desc;

### Do high discounts actually mean cheaper phones?
select brand , round(avg(discount_percent)) as avg_discount,round(avg(price))as avg_price from phone 
group by brand
order by avg_price  ,avg_discount asc;

###Which RAM–ROM combination dominates the market?
select rom, ram,count(*) as phone_count
from phone
group by rom,ram
order by phone_count desc;

#which phone has the best deal Best deal phones ##
SELECT brand, price,
       ROUND((ram * 1.5 + rom * 0.5) / price, 4) AS value_score
FROM phone
ORDER BY value_score DESC;


### Most Expensive Phones ###
SELECT phone_name, brand, price
FROM phone
ORDER BY price DESC
LIMIT 5;

### Cheapest  Phones ###
SELECT phone_name, brand, price
FROM phone
ORDER BY price ASC
LIMIT 5;


### Which brand gives better value overall ####

SELECT brand,
       ROUND(AVG((ram * 1.5 + rom * 0.5) / price), 4) AS avg_value_score
FROM phone
GROUP BY brand
ORDER BY avg_value_score DESC;