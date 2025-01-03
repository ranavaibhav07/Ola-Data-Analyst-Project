create database Ola;
Use Ola;
select * from bookings;

-- 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where Booking_Status ="SUCCESS";
select * from Successful_Bookings;

-- 2: Find the average ride distance for each vehicle type
create view average_ride_distance_for_each_vehicle as
select avg(ride_distance) as avg_distance , vehicle_type
from bookings group by vehicle_type;
select * from average_ride_distance_for_each_vehicle;

-- 3: Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(Booking_status),  Booking_status from bookings 
where Booking_status = "Canceled by Customer";
select * from cancelled_rides_by_customers;

-- 4: List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select count(Booking_ID) as total_bookings, customer_id from bookings
group by customer_id order by total_bookings desc limit 5;
select * from top_5_customers;

-- 5: Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers_pc_issue as
select count(*) from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";
select * from rides_cancelled_by_drivers_pc_issue;

-- 6: Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view min_max_primesedan_rating As
select max(Driver_Ratings), min(Driver_Ratings)
from bookings
where vehicle_type = "prime sedan";
select * from min_max_primesedan_rating;

-- 7: Retrieve all rides where payment was made using UPI
create view upi_payment as
select * from bookings where
Payment_Method ="upi";
select * from upi_payment;

-- 8: Find the average customer rating per vehicle type:
create view avg_customer_rating_per_vehicle as
select avg(Customer_Rating) , vehicle_type
from bookings
group by vehicle_type;
select * from avg_customer_rating_per_vehicle;

-- 9: . Calculate the total booking value of rides completed successfully:
create view total_booking_value_of_rides_completed_successfully as 
 select sum(booking_value) as revenue 
 from bookings
 where incomplete_rides = "no";
 select * from total_booking_value_of_rides_completed_successfully;
 
 -- 10: List all incomplete rides along with the reason:
 create view incomplete_rides_with_reason as
 select incomplete_rides, Incomplete_Rides_Reason
 from bookings
 where incomplete_rides ="yes";
 select * from incomplete_rides_with_reason;