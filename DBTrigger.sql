CREATE TRIGGER returnVehicle AFTER UPDATE
ON Rental
WHEN NEW.odo_back IS NOT NUll
BEGIN
UPDATE Vehicle
SET odometer = (SELECT NEW.odo_back FROM Rental)
WHERE Vehicle.VIN = (SELECT NEW.VIN FROM Rental);
END;

CREATE TRIGGER rentVehicle AFTER INSERT
ON Rental 
BEGIN
UPDATE Rental
SET odo_out = (SELECT odometer FROM Vehicle, Rental WHERE Vehicle.VIN = NEW.VIN) 
WHERE odo_out IS NULL;
END;


