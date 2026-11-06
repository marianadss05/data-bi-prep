-- ==========================================
-- FESTPASS DB: Schema Creation Script
-- ==========================================

-- SECTION 1: EVENTS AND LINEUP
CREATE TABLE Festival (
    FestivalID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Edition VARCHAR(100),
    Location VARCHAR(255),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE Stage (
    StageID INT PRIMARY KEY,
    FestivalID INT,
    Name VARCHAR(255) NOT NULL,
    Capacity INT,
    FOREIGN KEY (FestivalID) REFERENCES Festival(FestivalID)
);

CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE Performance (
    PerformanceID INT PRIMARY KEY,
    StageID INT,
    ArtistID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    FOREIGN KEY (StageID) REFERENCES Stage(StageID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

-- SECTION 2: TICKETING AND PRICING
CREATE TABLE TicketType (
    TicketTypeID INT PRIMARY KEY,
    FestivalID INT,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    TotalQuantity INT NOT NULL,
    FOREIGN KEY (FestivalID) REFERENCES Festival(FestivalID)
);

-- SECTION 3: CUSTOMERS AND SALES
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    NIF VARCHAR(9),
    BirthDate DATE
);

CREATE TABLE CustomerOrder (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    OrderID INT,
    TicketTypeID INT,
    Barcode VARCHAR(255) UNIQUE NOT NULL,
    Status VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES CustomerOrder(OrderID),
    FOREIGN KEY (TicketTypeID) REFERENCES TicketType(TicketTypeID)
);

-- SECTION 4: CASHLESS OPERATIONS
CREATE TABLE Wristband (
    WristbandID INT PRIMARY KEY,
    TicketID INT,
    ActivationDate DATETIME,
    Balance DECIMAL(10,2),
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
);

CREATE TABLE CashlessTransaction (
    TransactionID INT PRIMARY KEY,
    WristbandID INT,
    VendorName VARCHAR(255),
    TransactionTime DATETIME NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    ItemDescription VARCHAR(255),
    FOREIGN KEY (WristbandID) REFERENCES Wristband(WristbandID)
);