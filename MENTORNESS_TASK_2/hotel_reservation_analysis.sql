CREATE TABLE Hotel_reservation (
   Booking_ID VARCHAR(50) PRIMARY KEY,
   no_of_adults INT,
   no_of_children INT,
   no_of_weekend_nights INT,
   no_of_week_nights INT,
   type_of_meal_plan VARCHAR(50),
   room_type_reserved VARCHAR(50),
   lead_time INT,
   arrival_date DATE,
   market_segment_type VARCHAR(50),
   avg_price_per_room DECIMAL,
   booking_status VARCHAR(50)
);

SELECT * FROM Hotel_reservation;

-- What is the total number of reservations in the dataset?

SELECT COUNT(*) AS total_reservations
FROM Hotel_reservation;

-- Which meal plan is the most popular among guest?

SELECT type_of_meal_plan AS most_popular_meal_plan, COUNT(*) AS total_count
FROM Hotel_reservation
GROUP BY type_of_meal_plan
ORDER BY total_count DESC
LIMIT 1;

-- What is the average price per room for reservation involving children?

SELECT AVG(avg_price_per_room) AS average_price_per_room_with_children
FROM Hotel_reservation
WHERE no_of_children > 0;


-- How many reservation were made for the year 20xx(replace xx with desired year)?

SELECT COUNT(*) AS reservations_2018
FROM Hotel_reservation
WHERE EXTRACT(YEAR FROM arrival_date) = 2018;

-- What is the most commonly booked room type?

SELECT room_type_reserved AS common_booked_type,
COUNT(*) AS common_booked_type_count
FROM Hotel_reservation
GROUP BY room_type_reserved
ORDER BY common_booked_type DESC
LIMIT 1;

-- How many reservations fall on a week end?

SELECT COUNT(*) AS no_of_weekend_reservations
FROM Hotel_reservation
WHERE no_of_weekend_nights > 0;

-- What is the highest and lowest lead time of reservation?

SELECT MAX(lead_time)AS highest_lead_time_of_reservation,
MIN(lead_time)AS lowest_lead_time_of_reservation
FROM hotel_reservation;

-- What is the most common market segment type for reservation?

SELECT market_segment_type AS common_market_segment,
  COUNT(*) AS segment_count
FROM Hotel_reservation
GROUP BY market_segment_type
ORDER BY segment_count DESC
LIMIT 1;

-- How many reservation have a booking status of "confirmed"

SELECT booking_status AS confirmed_booking_status,
   COUNT(*)AS total_no_of_confirmed_booking_status
FROM hotel_reservation
GROUP BY booking_status
HAVING booking_status = 'Not_Canceled';

-- What is the total number of adults and children across all reservation?

SELECT 
    SUM(no_of_adults)AS total_adults,
    SUM(no_of_children)AS total_children
FROM hotel_reservation;

-- What is the average number of weekends night for reservations involving children?

SELECT 
    AVG(no_of_weekend_nights)AS average_weekend_night_for_children
FROM hotel_reservation
WHERE no_of_children > 0;

SELECT * FROM Hotel_reservation;

-- How many reservation was made in each month of the year?

SELECT 
    EXTRACT(MONTH FROM arrival_date) AS month,
    COUNT(*) AS no_reservations_per_month
FROM 
    Hotel_reservation
GROUP BY 
    EXTRACT(MONTH FROM arrival_date)
ORDER BY 
    month;
	
-- What is the average number of night (both weekend and weekday) spent by guest for each room type?
	
SELECT 
    room_type_reserved,
    AVG(no_of_weekend_nights + no_of_week_nights) AS total_avg_nights
FROM 
    Hotel_reservation
GROUP BY 
    room_type_reserved
ORDER BY 
    total_avg_nights DESC;
	
-- For reservations involving children, what is the common room type,and what is the average price 
for that room type? 

SELECT 
    room_type_reserved AS common_room_type,
    COUNT(*) AS reservations_count,
    AVG(avg_price_per_room) AS average_price
FROM 
    Hotel_reservation
WHERE 
    no_of_children > 0
GROUP BY 
    room_type_reserved
ORDER BY 
    reservations_count DESC
LIMIT 1;

-- Find the market segment type that generates the highest average price per room

SELECT
    market_segment_type,
   AVG(avg_price_per_room)AS avg_price_per_room
FROM 
  hotel_reservation
Group by 
  market_segment_type
ORDER BY
  avg_price_per_room DESC
LIMIT 1;













       








 


