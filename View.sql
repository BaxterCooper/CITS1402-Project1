CREATE VIEW CustomerSummary AS
SELECT customerID,
date_out AS rental_date_out, 
date_back AS rental_date_back, 
(julianday(date_back) - julianday(date_out)) * dailyCost + (odo_back - odo_out) * kmCost AS rental_cost
FROM Rental, Car, Vehicle
WHERE Rental.VIN = Vehicle.VIN 
AND Vehicle.carModel = Car.carModel 
AND Vehicle.carMake = Car.carMake 
AND Vehicle.carYear = Car.carYear 
AND date_back IS NOT NULL;
