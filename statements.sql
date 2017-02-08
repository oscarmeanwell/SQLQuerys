SELECT booking_date, nights
FROM booking
WHERE guest_id = 1183;


SELECT booking.arrival_time, 
       guest.first_name, 
       guest.last_name 
FROM   booking 
       JOIN guest 
         ON guest.id = booking.guest_id 
WHERE  booking.booking_date = "2016-11-05"; 

SELECT DISTINCT( booking.booking_id ), 
               room.room_type, 
               booking.occupants, 
               rate.amount 
FROM   booking 
       JOIN room 
         ON room.room_type = booking.room_type_requested 
       JOIN rate 
         ON rate.room_type = room.room_type 
WHERE  booking_id IN ( 5152, 5165, 5154, 5295 ); 


SELECT guest.first_name, 
       guest.last_name, 
       guest.address 
FROM   booking 
       JOIN guest 
         ON guest.id = booking.guest_id 
       JOIN room 
         ON room.room_type = booking.room_type_requested 
WHERE  room.id = 101 
       AND booking.booking_date = "2016-12-03"; 

SELECT Count(booking.booking_id), 
       Count(booking.nights), 
       booking.guest_id 
FROM   booking 
WHERE  guest_id IN ( 1185, 1270 ) 
GROUP  BY booking.guest_id; 


SELECT Sum(rate.amount) AS Amount 
FROM   booking 
       JOIN rate 
         ON rate.room_type = booking.room_type_requested 
            AND rate.occupancy = booking.occupants 
       JOIN guest 
         ON guest.id = booking.guest_id 
WHERE  guest.first_name = "ruth" 
       AND guest.last_name = "cadbury" 


SELECT Sum(( rate.amount ) + ( extra.amount )) AS Cost 
FROM   booking 
       JOIN extra 
         ON extra.booking_id = booking.booking_id 
       JOIN rate 
         ON rate.room_type = booking.room_type_requested 
WHERE  booking.booking_id = 5128 


SELECT guest.last_name, 
       guest.first_name, 
       guest.address, 
       Sum(booking.nights) 
FROM   booking 
       JOIN guest 
         ON guest.id = booking.guest_id 
WHERE  guest.address LIKE "%edinburgh%" 
GROUP  BY guest.last_name, 
          guest.first_name, 
          guest.address 


SELECT Sum(booking.occupants) AS Number, 
       booking.booking_date 
FROM   booking 
WHERE  booking.booking_date BETWEEN "2016-11-25" AND "2016-12-01" 
GROUP  BY booking.booking_date 

SELECT Sum(occupants) 
FROM   booking 
WHERE  booking_date = "2016-11-20" 
       AND nights > 1 
        OR booking_date = "2016-11-21" 


SELECT DISTINCT(guest.last_name), guest.first_name, booking_date, booking.booking_id
FROM guest
JOIN booking ON booking.guest_id=guest.id
WHERE last_name IN (SELECT last_name from guest group by last_name having count(*)>1)
AND booking.booking_date IN (select booking_date from booking group by booking_date having count(*) >1)
ORDER BY booking_date


select booking_id from booking where booking_date in(
select booking_date from booking group by booking_date having count(*) >1);

SELECT DISTINCT(guest.last_name), guest.first_name, booking_date, booking.booking_id, guest.id
FROM guest
JOIN booking ON booking.guest_id=guest.id
WHERE last_name IN (SELECT last_name from guest where booking.guest_id!=guest.id)
AND booking.booking_date IN (select booking_date from booking group by booking_date having count(*) >1)
ORDER BY last_name


SELECT guest.last_name, 
       booking.booking_date, 
       room.id 
FROM   booking 
       JOIN guest 
         ON guest.id = booking.guest_id 
       JOIN room 
         ON room_type = booking.room_type_requested 
WHERE  room.id = 207 
       AND booking.booking_date BETWEEN "2016-11-21" AND "2016-11-27" 
ORDER  BY booking.booking_date 


