--VIEWS as requested by Client.

-- Contract Renewal Status
-- Description: This view provides information on upcoming contract renewal dates within the next 60 days for families.

CREATE VIEW View_ContractRenewalStatus AS
SELECT f.FamilyID, src.FamilyID, MIN(src.EndDate) AS NextRenewalDate
FROM Family f
JOIN Student_Room_Contract src ON f.FamilyID = src.FamilyID
WHERE src.EndDate BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 60 DAY)
GROUP BY f.FamilyID;


-- Contract Renewal Status
-- This view provides information on upcoming contract renewal dates within the next 60 days for families.
CREATE VIEW View_ContractRenewalStatus AS
SELECT f.FamilyID, src.FamilyID, MIN(src.EndDate) AS NextRenewalDate
FROM Family f
JOIN Student_Room_Contract src ON f.FamilyID = src.FamilyID
WHERE src.EndDate BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 60 DAY)
GROUP BY f.FamilyID;

-- Top Rated Families with Average Rating
-- This view identifies top-rated families based on average student reviews, excluding families with no reviews.
CREATE VIEW View_TopRatedFamilies AS
SELECT f.FamilyID, AVG(sr.Rating) AS AverageRating
FROM Family f
LEFT JOIN Student_Review sr ON f.FamilyID = sr.FamilyID
GROUP BY f.FamilyID
HAVING COUNT(sr.Rating) > 0
ORDER BY AverageRating DESC;

-- Students with Common Interests
-- This view lists students who share common interests, promoting potential social interactions among them.

CREATE VIEW View_StudentsWithCommonInterests AS
SELECT s.StudentID, s.FirstName, s.LastName, GROUP_CONCAT(DISTINCT si.Interest) AS CommonInterests
FROM Student s
JOIN Student_Interest si ON s.StudentID = si.StudentID
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT si.Interest) >= 2;
