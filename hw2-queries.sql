--Question 1
SELECT DISTINCT F.flight_num 
FROM Flights F, Carriers C, Weekdays W 
WHERE C.name ="Alaska Airlines Inc." 
AND C.cid = F.carrier_id
AND F.origin_city="Seattle WA"
AND F.dest_city = "Boston MA" 
AND W.day_of_week="Monday"; 
-- 3 rows

--Question 2
SELECT c.name, f1.origin_city,  f1.fid, f1.dest_city, f1.actual_time, f2.origin_city, f2.fid, f2.dest_city,
f2.actual_time, f1.actual_time + F2.actual_time as total_flight_time

FROM Flights f1
JOIN Flights f2
ON f1.dest_city = f2.origin_city
AND f1.day_of_month = f2.day_of_month
AND f1.month_id = f2.month_id
AND f1.year = f2.year
AND f1.carrier_id = f2.carrier_id
JOIN Weekdays w
ON f1.day_of_week_id = w.did
JOIN Carriers c
ON f1.carrier_id = c.cid
JOIN Months m
ON f1.month_id = m.mid

WHERE F1.origin_city = "Seattle WA"
AND F2.dest_city = "Boston MA"
AND F1.day_of_month = 15
AND M.month = "July"
AND F1.year = 2015
AND total_flight_time < 420;


/*
results:
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|631855|Boston MA|137|365
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|634038|Boston MA|137|365
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|638231|Boston MA|150|378
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|646435|Boston MA|128|356
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|647630|Boston MA|130|358
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|649520|Boston MA|133|361
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|656448|Boston MA|133|361
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|664326|Boston MA|122|350
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|676155|Boston MA|150|378
American Airlines Inc.|Seattle WA|628083|Chicago IL|228|Chicago IL|739569|Boston MA|127|355
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|630048|Boston MA|74|396
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|630729|Boston MA|80|402
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|632311|Boston MA|91|413
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|656689|Boston MA|80|402
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|687812|Boston MA||322
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|687818|Boston MA|74|396
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|687819|Boston MA|65|387
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|687825|Boston MA|60|382
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|687827|Boston MA|83|405
American Airlines Inc.|Seattle WA|628176|New York NY|322|New York NY|687833|Boston MA|70|392
.....
*/
--Question 3
SELECT W.day_of_week,  AVG(F.arrival_delay) 
FROM Weekdays W, Flights F 
WHERE W.did = F.day_of_week_id 
GROUP BY W.day_of_week 
ORDER BY AVG(F.arrival_delay) 
DESC 
LIMIT 1;
-- 1 rows

--Question 4
SELECT DISTINCT C.name 
FROM Carriers C, Flights F, Months M 
WHERE C.cid=F.carrier_id 
AND M.mid=F.month_id 
GROUP BY C.name, F.year, M.month, F.day_of_month 
HAVING COUNT(*) > 1000;
-- 11 rows

--Question 5
 SELECT C.name, (AVG(F.canceled))*100 AS cancel_percent 
FROM Carriers C, Flights F 
WHERE C.cid=F.carrier_id 
AND F.origin_city="Seattle WA" 
GROUP BY C.name 
HAVING cancel_percent > 0.5 
ORDER BY cancel_percent;
-- 6 rows