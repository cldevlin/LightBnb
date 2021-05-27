
SELECT reservations.*, properties.*, (SELECT AVG(rating) 
                                        FROM property_reviews 
                                        WHERE property_id = reservations.property_id 
                                        GROUP BY property_id) as average_rating
FROM reservations
JOIN properties ON properties.id = reservations.property_id
WHERE guest_id = 1 AND end_date < Now()::date
ORDER BY start_date
LIMIT 10;

