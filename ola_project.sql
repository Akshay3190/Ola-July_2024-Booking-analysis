create database ola;
use ola;

SELECT COUNT(*) AS total_rows FROM ola.bookings;

-- Retrieve all successful bookings --
select * from ola.bookings;
select * from ola.bookings where  Booking_Status = 'success';

create view Successful_Bookings as
select * from ola.bookings where  Booking_Status = 'success';

select * from Successful_Bookings;

-- Find the average ride distance for each vehicle type --
select * from ola.bookings;

create view ride_distance_for_each_vehicle_type as
select Vehicle_Type, avg(Ride_Distance) as Avg_distance from ola.bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle_type;

-- Get the total number of cancelled rides by customers --
select * from ola.bookings;
select distinct(booking_status) from ola.bookings;

create view cancelled_rides_by_customers as
select count(*) as total_rides_cancelled_by_customers from ola.bookings where booking_status = 'Canceled by Customer';

select * from cancelled_rides_by_customers;

--  List the top 5 customers who booked the highest number of rides --
select * from ola.bookings;

create view top_5_customers_who_booked_the_highest_number_of_rides as
select customer_id,count(booking_id) as total_rides from ola.bookings
group by customer_id
order by total_rides desc limit 5;

select * from top_5_customers_who_booked_the_highest_number_of_rides;

-- Get the number of rides cancelled by drivers due to personal and car-related issues --
select * from ola.bookings;

create view rides_cancelled_by_drivers_due_to_p_and_c_related_issues as
select count(*) as total_rides_canceled_by_drivers from ola.bookings where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from rides_cancelled_by_drivers_due_to_p_and_c_related_issues;

-- Find the maximum and minimum driver ratings for Prime Sedan bookings --
select * from ola.bookings;

create view max_and_min_driver_ratings_for_Prime_Sedan as
select max(driver_ratings) as mx_d_rating, min(driver_ratings) as mn_d_rating from ola.bookings where vehicle_type = 'Prime Sedan';

select * from max_and_min_driver_ratings_for_Prime_Sedan;

-- Retrieve all rides where payment was made using UPI --
select * from ola.bookings;

create view rides_with_UPI_payment as
select * from ola.bookings where Payment_Method = 'UPI';

select * from rides_with_UPI_payment;

-- Find the average customer rating per vehicle type --
select * from ola.bookings;

create view avg_customer_rating_per_vehicle as
select Vehicle_Type, round(avg(Customer_Rating),3) as Avg_Cust_Rating from ola.bookings
group by Vehicle_Type
order by Avg_Cust_Rating desc;

select * from avg_customer_rating_per_vehicle;

-- Calculate the total booking value of rides completed successfully --
select * from ola.bookings;

select distinct(Booking_Status) from ola.bookings;

create view total_successful_ride_value as
select Booking_Status, sum(Booking_Value) as total_value from ola.bookings
where Booking_Status = 'Success'
group by Booking_Status;

select * from total_successful_ride_value;

-- List all incomplete rides along with the reason --
select * from ola.bookings;

create view Incomplete_rides_reason as
select Booking_ID,Incomplete_Rides_Reason from ola.bookings
where Incomplete_Rides = 'Yes';

select * from Incomplete_rides_reason;

-- Count all incomplete rides along with the reason --

create view Total_Incomplte_Rides_Details as
select Incomplete_Rides,Incomplete_Rides_Reason,count(Incomplete_Rides_Reason) as Total_Incomplete_Rides from ola.bookings
where Incomplete_Rides = 'Yes'
group by Incomplete_Rides_Reason
order by Total_Incomplete_Rides desc;

select * from Total_Incomplte_Rides_Details;


