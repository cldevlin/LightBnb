
SELECT reservations.*, properties.*, (SELECT AVG(rating) 
                                        FROM property_reviews 
                                        WHERE property_id = reservations.property_id 
                                        GROUP BY property_id) as average_rating
FROM reservations
JOIN properties ON properties.id = reservations.property_id
WHERE guest_id = 1 AND end_date < Now()::date
ORDER BY start_date
LIMIT 10;



-- -- -- CORRECT ANSWER -- -- --
-- SELECT properties.*, reservations.*, avg(rating) as average_rating
-- FROM reservations
-- JOIN properties ON reservations.property_id = properties.id
-- JOIN property_reviews ON properties.id = property_reviews.property_id
-- WHERE reservations.guest_id = 1
-- AND reservations.end_date < now()::date
-- GROUP BY properties.id, reservations.id
-- ORDER BY reservations.start_date
-- LIMIT 10;