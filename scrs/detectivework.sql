-- Finding relevant crime scene report
SELECT * FROM crime_scene_report
WHERE date = 20180115 AND type = 'murder' AND city = 'SQL City';

-- Find witnesses
-- First witness
SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

--- Second witness
SELECT * FROM person
WHERE name LIKE '%Annabel%' AND address_street_name = 'Franklin Ave';

-- Find relevant interviews
SELECT * FROM interview
WHERE person_id = 14887 or person_id = 16371;

-- List of people matching first witness's testamonies
WITH first AS (SELECT * FROM get_fit_now_member
WHERE id LIKE '48z%' AND membership_status = 'gold')

SELECT membership_id, person_id, name, check_in_date, check_in_time, membership_start_date, membership_status  FROM get_fit_now_check_in AS second
JOIN first ON first.id = second.membership_id
WHERE check_in_date = 20180109;


-- Verifying 16371 claim (to see if she was really there)
WITH f AS (SELECT * FROM get_fit_now_check_in AS checkin LEFT JOIN get_fit_now_member AS mem ON checkin.membership_id = mem.id)

SELECT * FROM f
WHERE f.check_in_date = 20180109 and person_id = 16371;


-- Checking license plates
SELECT * 
FROM drivers_license AS a
LEFT JOIN person AS b
ON a.id = b.license_id
WHERE plate_number LIKE '%H42w%';

-- Checking alibi
SELECT * FROM facebook_event_checkin
WHERE person_id = 67318;

-- Checking answer -> got it !
INSERT INTO solution VALUES (1, 'Jeremy Bowers');

SELECT value FROM solution;

-- Checking murderer's interview
SELECT * FROM interview
WHERE person_id = 67318;

-- Pinpoint the mastermind
SELECT * 
FROM drivers_license AS a
LEFT JOIN person AS b ON a.id = b.license_id
LEFT JOIN (SELECT 
    person_id,
    COUNT(event_id) AS frequency
FROM facebook_event_checkin
WHERE event_id = 1143
  AND date BETWEEN 20171201 AND 20171231
GROUP BY person_id) AS c ON b.id = c.person_id
WHERE gender = 'female' AND car_make = 'Tesla' AND car_model = 'Model S' AND height >= 65 AND height <= 67 AND hair_color = 'red' AND frequency = 3;

-- Checking mastermind outcome --> Correct!
INSERT INTO solution VALUES (1, 'Miranda Priestly');

SELECT value FROM solution;