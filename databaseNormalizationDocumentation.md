# Database Normalization Documentation

## Introduction

This document provides an overview of the database normalization process for the Homestay Co. database.

## 1NF

### FamilyMembers_LiveTogether

All non-prime attributes depend on both FamilyID and FirstName, except LastName. While LastName might not always correlate with FamilyID alone due to cultural variations, it does not violate 2NF.

### Family_Owns_House

All non-prime attributes depend on both FamilyID and UnitNumber. Therefore, it adheres to 2NF.

### House_Has_RoomsForRent

All non-prime attributes depend on FamilyID, UnitNumber, and RoomNumber. Thus, it satisfies 2NF.

## 2NF

In the pursuit of 2NF, we are identifying and addressing partial functional dependencies within relations. This primarily involves examining composite primary keys.

### FamilyMembers_LiveTogether

(FamilyID, FirstName, LastName, DoB, Gender, PhoneNumber):
All non-prime attributes depend on both FamilyID and FirstName, except LastName. While LastName might not always correlate with FamilyID alone due to cultural variations, it does not violate 2NF.

### Family_Owns_House

(FamilyID, UnitNumber, AppartmentNumber, Street, City, Province, PostalCode, Type, NumberOfRooms, NumberOfBathrooms, SmokeAllowed, PetAllowed):
All non-prime attributes depend on both FamilyID and UnitNumber. Therefore, it adheres to 2NF.

### House_Has_RoomsForRent

(FamilyID, UnitNumber, RoomNumber, Size, BedSize, FloorNumber, HasPrivateBathroom, Price):
All non-prime attributes depend on FamilyID, UnitNumber, and RoomNumber. Thus, it satisfies 2NF.

## 3NF

For 3NF, we inspect functional dependencies in relations:

### Family

(FamilyID, Bio, PrimaryContact_FirstName, PrimaryContact_Occupation, PrimaryContact_Email):
Although Email might determine other attributes, it is acceptable because it is also a candidate key.

### Student

(StudentID, FirstName, LastName, DoB, Gender, Email, PhoneNumber, ExpectedGradDate, School_Name):
Possible FDs involving Email, phone, or {FirstName, LastName} are permissible as they are superkeys.

### Student_Review & Family_Review

(ReviewID, Date, Rating, commentForHouse, commentForFamily):
(ReviewID, Date, Rating, commentForStudent):
The comment text might weakly identify a review, but given the prevalence of generic comments, it's unlikely to be a robust functional dependency.

### FamilyMember_LiveTogether

(FamilyID, FirstName, LastName, DoB, Gender, PhoneNumber):
Phone number's potential to determine other attributes is acknowledged, but not enforcing it as a primary key allows for cases where family members lack phone numbers.

### Family_Owns_House

(FamilyID, UnitNumber, AppartmentNumber, Street, City, Province, PostalCode, Type, NumberOfRooms, NumberOfBathrooms, SmokeAllowed, PetAllowed):
Not all cities determine provinces (e.g., Vancouver in different provinces), ensuring 3NF compliance.

### House_Has_RoomsForRent

(FamilyID, UnitNumber, RoomNumber, Size, BedSize, FloorNumber, IsAvailable, AvailibilityDate, HasPrivateBathroom, Price):
While availability date might not directly determine "isAvailable," given the conditions you've outlined, it conforms to 3NF.

## BCNF

In the pursuit of BCNF, we aim to eliminate functional dependencies where the left side is not a superkey. No such situations arise in this database, thereby meeting BCNF requirements.
