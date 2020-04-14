.open hw2-queries.db

CREATE TABLE Carriers (cid INT NOT NULL PRIMARY KEY, name VARCHAR NOT NULL);
CREATE TABLE Months (mid INT NOT NULL PRIMARY KEY, month VARCHAR NOT NULL);
CREATE TABLE Weekdays (did INT NOT NULL PRIMARY KEY, day_of_week VARCHAR NOT NULL);
CREATE TABLE Flights (fid INT NOT NULL PRIMARY KEY, 
year SMALLINT NOT NULL, month_id TINYINT NOT NULL, 
day_of_month TINYINT NOT NULL, day_of_week_id TINYINT NOT NULL, 
carrier_id VARCHAR DEFAULT AA, flight_num TINYINT NOT NULL, 
origin_city CHAR NOT NULL, origin_state CHAR NOT NULL, 
dest_city CHAR NOT NULL, 
dest_state CHAR NOT NULL, departure_delay FLOAT NOT NULL, 
taxi_out FLOAT NOT NULL, arrival_delay TINYINT NOT NULL, 
canceled TINYINT NOT NULL, actual_time SMALLINT NOT NULL, 
distance INT NOT NULL, 
FOREIGN KEY (carrier_id) REFERENCES Carriers(cid), 
FOREIGN KEY (month_id) REFERENCES Months(mid), 
FOREIGN KEY (day_of_week_id) REFERENCES Weekdays(did));

.mode csv
.import months.csv Months
.import carriers.csv Carriers
.import weekdays.csv Weekdays
.import flights-small.csv Flights