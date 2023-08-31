-- Insert sample data into the Family table
INSERT INTO Family (FamilyID, Bio, PrimaryContact_FirstName, PrimaryContact_Email, PrimaryContact_PhoneNumber, PrimaryContact_Ocupation)
VALUES
    (1, 'A friendly family in Vancouver.', 'John', 'john@example.com', 1234567890, 'Engineer'),
    (2, 'Welcoming family in Toronto.', 'Mary', 'mary@example.com', 9876543210, 'Teacher'),
    (3, 'Cozy family in Montreal.', 'David', 'david@example.com', 5556667777, 'Artist');

-- Insert sample data into the FamilyMembers_LiveTogether table
INSERT INTO FamilyMembers_LiveTogether (FamilyID, FirstName, LastName, BirthDate, Gender, PhoneNumber, isPrimaryContact)
VALUES
    (1, 'John', 'Doe', '1980-05-15', 'M', 1234567891, 'Y'),
    (1, 'Alice', 'Doe', '2005-10-10', 'F', NULL, 'N'),
    (2, 'Mary', 'Smith', '1975-07-20', 'F', 9876543211, 'Y'),
    (2, 'David', 'Smith', '2008-02-25', 'M', NULL, 'N'),
    (3, 'David', 'Brown', '1972-11-12', 'M', 5556667778, 'Y');
    
-- Insert sample data into the FamilyMember_Language table
INSERT INTO FamilyMember_Language (FamilyID, FirstName, Languages)
VALUES
    (1, 'John', 'English'),
    (1, 'John', 'Spanish'),
    (1, 'Alice', 'English'),
    (2, 'Mary', 'English'),
    (3, 'David', 'English');

-- Insert sample data into the FamilyMember_Interest table
INSERT INTO FamilyMember_Interest (FamilyID, FirstName, Interest)
VALUES
    (1, 'John', 'Cooking'),
    (1, 'John', 'Traveling'),
    (1, 'Alice', 'Reading'),
    (2, 'Mary', 'Music'),
    (3, 'David', 'Art');

-- Insert sample data into the FamilyMember_Hobby table
INSERT INTO FamilyMember_Hobby (FamilyID, FirstName, Hobby)
VALUES
    (1, 'John', 'Gardening'),
    (1, 'John', 'Photography'),
    (1, 'Alice', 'Writing'),
    (2, 'Mary', 'Painting'),
    (3, 'David', 'Sculpting');


-- Insert sample data into the House tables
INSERT INTO Family_Owns_House (FamilyID, UnitNumber, Street, City, Province, PostalCode, NumberOfRooms, NumberOfBathrooms, SmokingAllowed, PetAllowed, Size)
VALUES
    (1, 101, '123 Main St', 'Vancouver', 'BC', 'V6A 1A1', 3, 2, 'Y', 'N', 2000),
    (2, 201, '456 Elm St', 'Toronto', 'ON', 'M5A 2B2', 4, 2, 'N', 'Y', 2500),
    (3, 301, '789 Pine St', 'Montreal', 'QC', 'H3A 1B2', 2, 1, 'N', 'N', 1800);

INSERT INTO House_Has_RoomsForRent (FamilyID, UnitNumber, RoomNumber, Size, BedSize, FloorNumber, IsAvailable, AvailibilityDate, HasPrivateBathroom, Price)
VALUES
    (1, 101, 1, 250, 'Queen', 1, 'Y', '2023-09-01', 'Y', 800),
    (1, 101, 2, 200, 'Twin', 2, 'N', NULL, 'Y', 600),
    (2, 201, 1, 300, 'King', 1, 'Y', '2023-09-01', 'Y', 900),
    (3, 301, 1, 180, 'Single', 1, 'Y', '2023-09-01', 'N', 500);

-- Insert sample data into the School table
INSERT INTO School (SchoolName, UnitNumber, Street, City, Province, PostalCode)
VALUES
    ('ABC University', NULL, '789 Oak St', 'Vancouver', 'BC', 'V6B 3C4'),
    ('XYZ College', NULL, '456 Maple St', 'Toronto', 'ON', 'M4C 2D5'),
    ('City University', NULL, '123 Rose St', 'Montreal', 'QC', 'H3B 1C7');

-- Insert sample data into the Student tables
INSERT INTO Student (StudentID, FirstName, LastName, BirthDate, Gender, Email, PhoneNumber, ExpectedGraduationDate, SchoolName)
VALUES
    (101, 'Emma', 'Johnson', '2000-01-10', 'F', 'emma@example.com', 1112223333, '2023-06-30', 'ABC University'),
    (102, 'Daniel', 'Lee', '2001-07-05', 'M', 'daniel@example.com', 4445556666, '2023-06-30', 'ABC University'),
    (103, 'Sophia', 'Miller', '2002-03-20', 'F', 'sophia@example.com', 7778889999, '2023-06-30', 'XYZ College');

INSERT INTO Student_Interest (StudentID, Interest)
VALUES
    (101, 'Traveling'),
    (101, 'Reading'),
    (102, 'Sports'),
    (102, 'Music'),
    (103, 'Cooking'),
    (103, 'Art');

INSERT INTO Student_Language (StudentID, Languages)
VALUES
    (101, 'English'),
    (101, 'Spanish'),
    (102, 'Korean'),
    (102, 'English'),
    (103, 'French'),
    (103, 'English');
INSERT INTO Student_Hobby (StudentID, Hobby)
VALUES
    (101, 'Photography'),
    (101, 'Writing'),
    (102, 'Swimming'),
    (102, 'Playing Guitar'),
    (103, 'Drawing'),
    (103, 'Singing');


-- Insert sample data into the Contracts tables
INSERT INTO Student_Room_Contract (TrackingNumber, StudentID, FamilyID, UnitNumber, RoomNumber, StartDate, EndDate, Price, SignedDocURL)
VALUES
    (1001, 101, 1, 101, 1, '2023-08-15', '2023-12-15', 800, 'https://example.com/contract_1001.pdf'),
    (1002, 102, 2, 201, 1, '2023-09-01', '2023-12-31', 900, 'https://example.com/contract_1002.pdf'),
    (1003, 103, 3, 301, 1, '2023-08-25', '2023-11-30', 500, 'https://example.com/contract_1003.pdf');

-- Insert sample data into the Reviews tables
INSERT INTO Student_Review (ReviewID, StudentID, TrackingNumber, ReviewDate, Rating, CommentOnHome, CommentOnFamily)
VALUES
    (2001, 101, 1001, '2023-09-10', 5, 'The room was spacious and comfortable.', 'The family was very friendly and welcoming.'),
    (2002, 102, 1002, '2023-10-05', 4, 'The house location was convenient for my studies.', 'The family provided a warm and cozy atmosphere.'),
    (2003, 103, 1003, '2023-09-15', 5, 'I enjoyed my stay in the cozy room.', "The family's hospitality made me feel at home.");

INSERT INTO Family_Review (ReviewID, FamilyID, TrackingNumber, ReviewDate, Rating, CommentOnStudent)
VALUES
    (3001, 1, 1001, '2023-09-12', 5, 'Emma was a polite and respectful student.'),
    (3002, 2, 1002, '2023-10-07', 4, 'Daniel was an enthusiastic and helpful student.'),
    (3003, 3, 1003, '2023-09-18', 5, 'Sophia was a delightful and easygoing student.');
