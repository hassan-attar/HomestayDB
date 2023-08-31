-- CREATE TABLE SCRIPT FOR HOMESTAY CO. DATABASE
-- Family (5 Tables)
CREATE TABLE Family (
	FamilyID INT,
    Bio VARCHAR(1500),
    PrimaryContact_FirstName CHAR(20) NOT NULL,
    PrimaryContact_Email CHAR(200) NOT NULL,
    PrimaryContact_PhoneNumber BIGINT NOT NULL,
    PrimaryContact_Ocupation CHAR(30),
    
    PRIMARY KEY (FamilyID),
    CHECK(PrimaryContact_PhoneNumber > 999999999 AND PrimaryContact_PhoneNumber <= 9999999999)
);

CREATE TABLE FamilyMembers_LiveTogether (
	FamilyID INT,
    FirstName CHAR(25),
	LastName CHAR(25),
    BirthDate DATE NOT NULL,
    Gender CHAR(1) NOT NULL,
    PhoneNumber BIGINT,
    isPrimaryContact CHAR(1) NOT NULL,
    
    PRIMARY KEY (FamilyID, FirstName),
    FOREIGN KEY (FamilyID) REFERENCES Family(FamilyID) ON DELETE CASCADE,
    CHECK(PhoneNumber >= 1000000000 AND PhoneNumber <= 9999999999)
);

CREATE TABLE FamilyMember_Language (
	FamilyID INT,
    FirstName CHAR(25),
    Languages CHAR(25),
    
    PRIMARY KEY (FamilyID, FirstName, Languages),
    FOREIGN KEY (FamilyID, FirstName) REFERENCES FamilyMembers_LiveTogether(FamilyID, FirstName) ON DELETE CASCADE
);

CREATE TABLE FamilyMember_Interest (
	FamilyID INT,
    FirstName CHAR(25),
    Interest CHAR(25),
    
    PRIMARY KEY (FamilyID, FirstName, Interest),
    FOREIGN KEY (FamilyID, FirstName) REFERENCES FamilyMembers_LiveTogether(FamilyID, FirstName) ON DELETE CASCADE
);

CREATE TABLE FamilyMember_Hobby (
	FamilyID INT,
    FirstName CHAR(25),
    Hobby CHAR(25),
    
    PRIMARY KEY (FamilyID, FirstName, Hobby),
    FOREIGN KEY (FamilyID, FirstName) REFERENCES FamilyMembers_LiveTogether(FamilyID, FirstName) ON DELETE CASCADE
);

-- House (2 Tables)
CREATE TABLE Family_Owns_House (
	FamilyID INT UNIQUE,
    UnitNumber INT,
    AppartmentNumber INT,
    Street CHAR (50) NOT NULL,
    City CHAR(30) NOT NULL,
    Province CHAR(2) NOT NULL,
    PostalCode CHAR(6) NOT NULL,
    HouseType CHAR(10),
    NumberOfRooms TINYINT NOT NULL,
    NumberOfBathrooms TINYINT NOT NULL,
    SmokingAllowed CHAR(1) NOT NULL,
    PetAllowed CHAR(1) NOT NULL,
    Size INT,
    
    PRIMARY KEY (FamilyID, UnitNumber),
    FOREIGN KEY (FamilyID) REFERENCES Family(FamilyID)
);

CREATE TABLE House_Img (
	FamilyID INT,
    UnitNumber INT,
    ImgURL VARCHAR (500),
    
    PRIMARY KEY (FamilyID, UnitNumber, ImgURL)
);

-- Room (2 Tables)
CREATE TABLE House_Has_RoomsForRent (
	FamilyID INT,
    UnitNumber INT,
    RoomNumber TINYINT,
    Size INT,
    BedSize CHAR(10),
    FloorNumber TINYINT,
    IsAvailable CHAR(1),
    AvailibilityDate DATE,
    HasPrivateBathroom CHAR(1),
    Price INT NOT NULL,
    
    PRIMARY KEY (FamilyID, UnitNumber, RoomNumber),
    FOREIGN KEY (FamilyID, UnitNumber) REFERENCES Family_Owns_House(FamilyID, UnitNumber) ON DELETE CASCADE,
    CHECK(Price > 0)
);

CREATE TABLE Room_Img (
	FamilyID INT,
    UnitNumber INT,
    RoomNumber TINYINT,
    ImgURL VARCHAR(500),
    
    PRIMARY KEY (FamilyID, UnitNumber, RoomNumber, ImgURL),
    FOREIGN KEY (FamilyID, UnitNumber, RoomNumber) REFERENCES House_Has_RoomsForRent(FamilyID, UnitNumber, RoomNumber) ON DELETE CASCADE
);

-- School (1 Table)
CREATE TABLE School (
	SchoolName CHAR(50),
    UnitNumber INT,
    Street CHAR (50),
    City CHAR(30),
    Province CHAR(2),
    PostalCode CHAR(6),
    
    PRIMARY KEY (SchoolName)
);

-- Student (4 Tables)
CREATE TABLE Student (
	StudentID INT,
    FirstName CHAR(25) NOT NULL,
    LastName CHAR(25) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender CHAR(1) NOT NULL,
    Email CHAR(200) NOT NULL,
    PhoneNumber BIGINT NOT NULL,
    ExpectedGraduationDate DATE,
    SchoolName CHAR (50) NOT NULL,
    
    PRIMARY KEY (StudentID),
    FOREIGN KEY (SchoolName) REFERENCES School(SchoolName) ON DELETE SET NULL,
    CHECK(PhoneNumber >= 1000000000 AND PhoneNumber <= 9999999999)
);

CREATE TABLE Student_Interest (
	StudentID INT,
    Interest CHAR(25),
    
    PRIMARY KEY (StudentID, Interest),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE Student_Language (
	StudentID INT,
    Languages CHAR(25),
    
    PRIMARY KEY (StudentID, Languages),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE Student_Hobby (
	StudentID INT,
    Hobby CHAR(25),
    
    PRIMARY KEY (StudentID, Hobby),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- Contracts (1 Table)
CREATE TABLE Student_Room_Contract(
	TrackingNumber INT,
    StudentID INT,
    FamilyID INT,
    UnitNumber INT,
    RoomNumber TINYINT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Price INT NOT NULL,
    SignedDocURL VARCHAR(500) NOT NULL,
    
    PRIMARY KEY (TrackingNumber),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (FamilyID, UnitNumber, RoomNumber) REFERENCES House_Has_RoomsForRent(FamilyID, UnitNumber, RoomNumber),
    CHECK(EndDate > StartDate),
    CHECK(Price > 0)
);

-- Reviews (2 Tables)
CREATE TABLE Student_Review (
	ReviewID INT,
    StudentID INT,
    TrackingNumber INT,
    ReviewDate DATE,
    Rating TINYINT,
    CommentOnHome VARCHAR(1500),
    CommentOnFamily VARCHAR(1500),
    
    PRIMARY KEY (ReviewID, StudentID, TrackingNumber),
    FOREIGN KEY (TrackingNumber) REFERENCES Student_Room_Contract(TrackingNumber),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE Family_Review (
	ReviewID INT,
    FamilyID INT,
    TrackingNumber INT,
    ReviewDate DATE,
    Rating TINYINT,
    CommentOnStudent VARCHAR(1500),
    
    PRIMARY KEY (ReviewID, FamilyID, TrackingNumber),
    FOREIGN KEY (FamilyID) REFERENCES Family(FamilyID),
    FOREIGN KEY (TrackingNumber) REFERENCES Student_Room_Contract(TrackingNumber)
);


