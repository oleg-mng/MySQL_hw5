USE lesson5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

DROP VIEW IF EXISTS cars_view1;
CREATE VIEW cars_view1 AS
	SELECT `name` AS `global_brand`, cost AS `cost>25000`
	FROM cars
	WHERE cost > 25000;

SELECT *
FROM cars_view1;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cars_view1 AS
	SELECT `name` AS `global_brand`, cost AS `cost>30000`
	FROM cars
	WHERE cost > 30000;

-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

DROP VIEW IF EXISTS cars_view3;
CREATE VIEW cars_view3 AS
	SELECT `name`, cost
	FROM cars
	WHERE `name` = Skoda AND `name` = Audi;
    
-- 4
    
    DROP TABLE IF EXISTS train;
    CREATE TABLE train
(
	train_id_integer INT,
    station VARCHAR(30),
    station_time TIME
);

INSERT train
VALUES
	(110, "San Francisco", "10:00:00"),
	(110, "Redwood city", '10:54:00'),
	(110, "Palo Alto", '11:02:00'),
	(110, "San Jose", '12:35:00'),
	(120, "San Francisco", '11:00:00'),
	(120, "Palo Alto", '12:49:00'),
	(120, "San Jose", '13:30:00');
    
    -- SET @typ = (station_time) + LEAD(station_time)
    
SELECT *,
	LEAD(station_time) OVER(),
    TIMEDIFF("station_time", "LEAD(station_time)" OVER () AS 'time_to_next_station_interval'
FROM train;

SELECT TIMEDIFF("2017-06-25 13:10:11", "2017-06-15 13:10:10");

SELECT *,
	LEAD(station_time) OVER() AS l,
    station_time AS s,
    TIMEDIFF(s, l)
FROM train;


