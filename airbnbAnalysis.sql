--select whole table
Select *
From airbnbProject..[airbnb-listings]
order by price

--airbnb numbers t1
select count(*) as numListings, avg(price) as avgPrice
From airbnbProject..[airbnb-listings]

--popular city locations t2
SELECT region_parent_name AS Location, region_name, COUNT(*) AS numListings, avg(price) as Price, AVG(longitude) as longitude, avg(latitude) as latitude
From airbnbProject..[airbnb-listings]
--WHERE region_parent_name LIKE '%Auckland%'
GROUP BY region_parent_name, region_name
ORDER BY numListings DESC

--avg price per location t3
SELECT region_parent_name AS City, COUNT(*) AS numListings, AVG(review_scores_rating) AS averageRating, AVG(price) AS averagePrice
From airbnbProject..[airbnb-listings]
WHERE review_scores_rating IS NOT NULL
GROUP BY region_parent_name
ORDER BY numListings DESC

--percentzage fo listings: total listing/numlisting = percentage table 4
select region_parent_name AS Location, cast(AVG(review_scores_rating) as decimal(10,2)) AS averageRating, count(*) AS numListing, count(*) * 100.0 / (select count(*) from airbnbProject..[airbnb-listings]) AS PercentageofTotalListing,  avg(price) AS avgPrice
from airbnbProject..[airbnb-listings]
WHERE price IS NOT NULL
group by region_parent_name
order by avgPrice DESC

--TOTOAL LISTING + average price in New Zealand table 5
Select AVG(price) AS averangePrice, COUNT(*) AS numListings
FROM airbnbProject..[airbnb-listings]

--Number of reviews per location t6
SELECT region_parent_name AS City, sum(number_of_reviews) AS numreviews, avg(longitude) as longitude, avg(latitude) as latitude
From airbnbProject..[airbnb-listings]
WHERE review_scores_rating IS NOT NULL
GROUP BY region_parent_name
order by numreviews DESC

--avg price per location t7
SELECT region_parent_name AS Location, avg(price) AS avgPrice
From airbnbProject..[airbnb-listings]
GROUP BY region_parent_name
order by avgPrice DESC


--year of last review table 8
select YEAR(last_review) as 'year' , count(*) as countOfHost, region_parent_name
from airbnbProject..[airbnb-listings]
where YEAR(last_review) IS NOT NULL
group by YEAR(last_review), region_parent_name
order by countOfHost DESC

--Room listing :  room types by location t9
SELECT room_type,  COUNT(*) AS propertyListings, region_parent_name AS City
From airbnbProject..[airbnb-listings]
--WHERE region_parent_name LIKE '%Auckland%'
GROUP BY room_type, region_parent_name
ORDER BY propertyListings DESC

--busy host by location t10 + t11
SELECT host_id, host_name,  COUNT(*) AS hostListings, region_parent_name AS Location
From airbnbProject..[airbnb-listings]
where host_name IS NOT NULL
group by host_id, host_name, region_parent_name
order by hostListings DESC

--Num of aibnbs by location t12
select region_parent_name AS Location, region_name, cast(AVG(review_scores_rating) as decimal(10,2)) AS averageRating, concat(count(*) * 100.0 / (select count(*) from airbnbProject..[airbnb-listings]),'%') AS PercentageofTotalListing,  avg(price) AS avgPrice
from airbnbProject..[airbnb-listings]
group by region_parent_name , region_name
order by PercentageofTotalListing DESC

--variations of price by location t13
SELECT region_parent_name AS Location, region_name as City, count(*) as numListings, avg(price) as Price, avg(longitude) as Longitude, avg(latitude) as Latitude
From airbnbProject..[airbnb-listings]
GROUP BY region_parent_name, region_name
order by numListings DESC

--Avg price per property by location: t14
SELECT property_type,  COUNT(*) AS propertyListings, AVG(price) AS averagePrice, region_parent_name as Location, room_type
From airbnbProject..[airbnb-listings]
--WHERE region_parent_name LIKE '%Auckland%'
GROUP BY property_type, region_parent_name, room_type
ORDER BY propertyListings DESC

--all prices by location
SELECT id, region_parent_name AS Location, region_name, price,cast(AVG(review_scores_rating) as decimal(10,2)) AS averageRating
From airbnbProject..[airbnb-listings]
--WHERE region_parent_name LIKE '%Auckland%'
GROUP BY id, region_parent_name, region_name, price


--total number of reviews
select sum(number_of_reviews) from airbnbProject..[airbnb-listings]


--being superhhost or regular host
SELECT region_parent_name AS City, number_of_reviews, host_is_superhost, review_scores_rating
From airbnbProject..[airbnb-listings]
ORDER BY number_of_reviews DESC

--number of reviews per lcoation
SELECT region_parent_name AS City, sum(number_of_reviews) AS numreviews, avg(longitude) as longitude, avg(latitude) as latitude
From airbnbProject..[airbnb-listings]
WHERE review_scores_rating IS NOT NULL
GROUP BY region_parent_name
order by numreviews DESC

--room price vs revie score
SELECT property_type,  AVG(review_scores_rating) AS averageReview, CONCAT('$', AVG(price)) AS averagePrice
From airbnbProject..[airbnb-listings]
GROUP BY property_type
ORDER BY averageReview DESC