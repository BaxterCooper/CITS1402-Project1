CREATE TABLE Vehicle (
    carMake TEXT,
    carModel TEXT,
    carYear INTEGER,
    VIN TEXT PRIMARY KEY,
    odometer INTEGER,
    CHECK ((VIN GLOB '?????')
        AND (VIN GLOB '[A-H,J-N,P,R-Z]*' OR VIN GLOB '[0-9]*')
        AND (VIN GLOB '*[A-H,J-N,P,R-Z]' OR VIN GLOB '*[0-9]')
        AND (VIN GLOB '?[A-H,J-N,P,R-Z]*' OR VIN GLOB '?[0-9]*')
        AND (VIN GLOB '*[A-H,J-N,P,R-Z]?' OR VIN GLOB '*[0-9]?')
        AND (VIN GLOB '??X??' OR VIN GLOB '??[0-9]??')
    )         
);

CREATE TABLE Car (
    carMake TEXT,
    carModel TEXT,
    carYear INTEGER,
    dailyCost INTEGER,
    kmCost REAL 
);

CREATE TABLE Rental (
    customerId INTEGER,
    VIN TEXT,
    odo_out INTEGER,
    odo_back INTEGER,
    date_out TEXT,
    date_back TEXT, 
    FOREIGN KEY(VIN) REFERENCES Vehicle(VIN)
    FOREIGN KEY(customerId) REFERENCES Customer(id)
        ON UPDATE CASCADE
);

CREATE TABLE Customer (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT 
);



