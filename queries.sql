--Queries requested by Client.

-- Query 1: Find Family Information for a Given Student
SELECT f.*
FROM Family f
JOIN Student_Room_Contract src ON f.FamilyID = src.FamilyID
WHERE src.StudentID = <student_id>;

-- Query 2: List Available Rooms with Family Preferences
SELECT hr.*
FROM House_Has_RoomsForRent hr
JOIN Family f ON hr.FamilyID = f.FamilyID
WHERE hr.IsAvailable = 'Y' AND f.SmokeAllowed = 'N' AND f.PetAllowed = 'Y';

-- Query 3: Calculate Average Rating for a Family
SELECT f.FamilyID, AVG(sr.Rating) AS AverageRating
FROM Family f
LEFT JOIN Student_Review sr ON f.FamilyID = sr.FamilyID
GROUP BY f.FamilyID;

-- Query 4: Find Families with Common Interests
SELECT f.FamilyID, GROUP_CONCAT(fi.Interest) AS CommonInterests
FROM Family f
JOIN FamilyMember_Interest fi ON f.FamilyID = fi.FamilyID
GROUP BY f.FamilyID
HAVING COUNT(fi.Interest) >= 2;

-- Query 5: Retrieve Student's Current Room and Family Details
SELECT s.*, hrr.*, f.*
FROM Student s
JOIN Student_Room_Contract src ON s.StudentID = src.StudentID
JOIN House_Has_RoomsForRent hrr ON src.FamilyID = hrr.FamilyID AND src.UnitNumber = hrr.UnitNumber
JOIN Family f ON src.FamilyID = f.FamilyID;

-- Query 6: Find Families with Multiple Rooms for Rent
SELECT f.FamilyID, COUNT(hrr.RoomNumber) AS NumberOfRoomsForRent
FROM Family f
JOIN House_Has_RoomsForRent hrr ON f.FamilyID = hrr.FamilyID
GROUP BY f.FamilyID
HAVING COUNT(hrr.RoomNumber) > 1;

-- Query 7: Calculate Monthly Earnings for Each Family
SELECT f.FamilyID, SUM(src.Price) AS MonthlyEarnings
FROM Family f
JOIN Student_Room_Contract src ON f.FamilyID = src.FamilyID
GROUP BY f.FamilyID;

-- Query 8: List Students Interested in a Particular Hobby
SELECT s.*
FROM Student s
JOIN Student_Hobby sh ON s.StudentID = sh.StudentID
WHERE sh.Hobby = 'Travel';

-- Query 9: Count Families in Each Province
SELECT f.Province, COUNT(*) AS FamilyCount
FROM Family f
GROUP BY f.Province
ORDER BY FamilyCount DESC;

-- Query 10: Find Families with Contract End Dates in the Next Month
SELECT f.FamilyID, src.FamilyID, src.EndDate
FROM Family f
JOIN Student_Room_Contract src ON f.FamilyID = src.FamilyID
WHERE src.EndDate BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 1 MONTH);

-- Query 11: Find Families with High-Rated Rooms
SELECT f.FamilyID, AVG(sr.Rating) AS AverageRating
FROM Family f
JOIN House_Has_RoomsForRent hr ON f.FamilyID = hr.FamilyID
LEFT JOIN Student_Room_Contract src ON hr.FamilyID = src.FamilyID AND hr.UnitNumber = src.UnitNumber
LEFT JOIN Student_Review sr ON src.TrackingNumber = sr.TrackingNumber
GROUP BY f.FamilyID
HAVING AVG(sr.Rating) >= 4.5;

-- Query 12: List Students Who Haven't Reviewed Their Homestay
SELECT s.*
FROM Student s
LEFT JOIN Student_Room_Contract src ON s.StudentID = src.StudentID
LEFT JOIN Student_Review sr ON src.TrackingNumber = sr.TrackingNumber
WHERE sr.ReviewID IS NULL;

-- Query 13: Calculate Total Earnings and Average Price per Room for Each Family
SELECT f.FamilyID, SUM(src.Price) AS TotalEarnings, AVG(src.Price) AS AveragePricePerRoom
FROM Family f
JOIN Student_Room_Contract src ON f.FamilyID = src.FamilyID
GROUP BY f.FamilyID;

-- Query 14:  Find Students Who Extended Contracts Multiple Times
SELECT s.StudentID, s.FirstName, s.LastName, COUNT(src.TrackingNumber) AS NumberOfExtensions
FROM Student s
JOIN Student_Room_Contract src ON s.StudentID = src.StudentID
WHERE src.EndDate > src.ExpectedEndDate
GROUP BY s.StudentID
HAVING COUNT(src.TrackingNumber) > 1;
