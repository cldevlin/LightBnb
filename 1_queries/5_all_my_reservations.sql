
SELECT reservations.*, properties.*, (SELECT AVG(rating) 
                                        FROM property_reviews 
                                        WHERE property_id = reservations.property_id 
                                        GROUP BY property_id) as average_rating
FROM reservations
JOIN properties ON properties.id = reservations.property_id
WHERE guest_id = 1 AND end_date < Now()::date
ORDER BY start_date
LIMIT 10;

-- this works
-- SELECT properties.id as id, title, cost_per_night, guest_id, start_date, end_date, (SELECT AVG(rating) 
--                                         FROM property_reviews 
--                                         WHERE property_id = reservations.property_id 
--                                         GROUP BY property_id) as average_rating
-- FROM reservations
-- JOIN properties ON properties.id = reservations.property_id
-- WHERE guest_id = 1 AND end_date < Now()::date
-- ORDER BY start_date
-- LIMIT 10;

-- SELECT cost_per_night FROM properties WHERE id = reservations.property_id

-- -- -- -- THIS ALSO WORKS --- --- ----
-- SELECT AVG(rating) 
-- FROM property_reviews 
-- WHERE property_id = 931 
-- GROUP BY property_id;


-- -- -- -- this works! --- --- gets all reservations for one user id
-- SELECT guest_id, start_date, end_date
-- FROM reservations
-- WHERE guest_id = 1 AND end_date < Now()::date
-- ORDER BY start_date
-- LIMIT 10;



-- SELECT cost_per_night, start_date, end_date, (SELECT AVG(rating) 
--                                                  FROM property_reviews 
--                                                  WHERE property_id = 1
--                                                  GROUP BY property_id;) as average_rating
-- FROM reservations
-- JOIN properties ON properties.id = reservations.property_id
-- WHERE reservations.guest_id = 1 AND end_date < Now()::date
-- GROUP BY reservations.id
-- ORDER BY start_date;
-- LIMIT 10;


-- SELECT reservations.id, title, cost_per_night, start_date, AVG(rating) as average_rating
-- FROM reservations
-- JOIN properties ON reservations.property_id = properties.id
-- JOIN property_reviews ON property_reviews.property_id = properties.id
-- WHERE reservations.guest_id = 1
-- GROUP BY reservations.id;


-- SELECT reservations.id, title, cost_per_night, AVG(rating) as average_rating
-- FROM properties
-- JOIN property_reviews ON property_reviews.property_id = properties.id
-- JOIN reservations ON reservations.property_id = properties.id
-- GROUP BY property_reviews, reservations.id, properties.title
-- -- HAVING AVG(rating) >= 4
-- ORDER BY cost_per_night
-- LIMIT 10;