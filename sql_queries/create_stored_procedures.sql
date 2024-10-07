-- Get all users
DELIMITER //
CREATE PROCEDURE GetAllUser()
BEGIN
    SELECT * FROM Users;
END //
DELIMITER ;

-- Get user according to id
DELIMITER //
CREATE PROCEDURE GetUser(IN userId INT)
BEGIN
    SELECT * FROM Users WHERE id = userId;
END //
DELIMITER ;

-- Create user
DELIMITER //
CREATE PROCEDURE CreateUser(
    IN username VARCHAR(255),
    IN firstName VARCHAR(255),
    IN lastName VARCHAR(255),
    IN email VARCHAR(255),
    IN password VARCHAR(255),
    IN role VARCHAR(255),
    IN identificationNumber VARCHAR(255),
    IN primaryContact INT,
    IN secondaryContact INT,
    IN telephoneNumber INT,
    IN postalAddress VARCHAR(255),
    IN isAuthenticated BOOLEAN,
    IN isActive BOOLEAN,
    IN isStaff BOOLEAN
)
BEGIN
    INSERT INTO Users (username, first_name, last_name, email, password, role, 
        identification_number, primary_contact, secondary_contact, telephone_number, 
        postal_address, is_authenticated, is_active, is_staff, created_at, updated_at)
    VALUES (username, firstName, lastName, email, password, role, identificationNumber, 
        primaryContact, secondaryContact, telephoneNumber, postalAddress, isAuthenticated, 
        isActive, isStaff, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
END //
DELIMITER ;

-- Update user
DELIMITER //
CREATE PROCEDURE UpdateUser(
    IN userId INT,
    IN username VARCHAR(255),
    IN firstName VARCHAR(255),
    IN lastName VARCHAR(255),
    IN email VARCHAR(255),
    IN role VARCHAR(255),
    IN identificationNumber VARCHAR(255),
    IN primaryContact INT,
    IN secondaryContact INT,
    IN telephoneNumber INT,
    IN postalAddress VARCHAR(255),
    IN isAuthenticated BOOLEAN,
    IN isActive BOOLEAN,
    IN isStaff BOOLEAN
)
BEGIN
    UPDATE Users
    SET username = username,
        first_name = firstName,
        last_name = lastName,
        email = email,
        role = role,
        identification_number = identificationNumber,
        primary_contact = primaryContact,
        secondary_contact = secondaryContact,
        telephone_number = telephoneNumber,
        postal_address = postalAddress,
        is_authenticated = isAuthenticated,
        is_active = isActive,
        is_staff = isStaff,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = userId;
END //
DELIMITER ;


-- Delete user
DELIMITER //
CREATE PROCEDURE DeleteUser(IN userId INT)
BEGIN
    DELETE FROM Users WHERE id = userId;
END //
DELIMITER ;



-- Get all permissions
DELIMITER //
CREATE PROCEDURE GetAllPermission()
BEGIN
    SELECT * FROM Permissions;
END //
DELIMITER ;

-- Get permission according to id
DELIMITER //
CREATE PROCEDURE GetPermission(IN permissionId INT)
BEGIN
    SELECT * FROM Permissions WHERE id = permissionId;
END //
DELIMITER ;

-- Create persmission
DELIMITER //
CREATE PROCEDURE CreatePermission(IN name VARCHAR(255), IN model VARCHAR(255))
BEGIN
    INSERT INTO Permissions (name, model) VALUES (name, model);
END //
DELIMITER ;


-- Update permission with id
DELIMITER //
CREATE PROCEDURE UpdatePermission(IN permissionId INT, IN name VARCHAR(255), IN model VARCHAR(255))
BEGIN
    UPDATE Permissions
    SET name = name, model = model
    WHERE id = permissionId;
END //
DELIMITER ;

-- Delete permission with id
DELIMITER //
CREATE PROCEDURE DeletePermission(IN permissionId INT)
BEGIN
    DELETE FROM Permissions WHERE id = permissionId;
END //
DELIMITER ;

-- Get permission group by id
DELIMITER //
CREATE PROCEDURE GetAllGroup()
BEGIN
    SELECT * FROM Groups;
END //
DELIMITER ;

-- Get permission group by id
DELIMITER //
CREATE PROCEDURE GetGroup(IN groupId INT)
BEGIN
    SELECT * FROM Groups WHERE id = groupId;
END //
DELIMITER ;

-- Create permission group
DELIMITER //
CREATE PROCEDURE CreateGroup(IN name VARCHAR(255))
BEGIN
    INSERT INTO Groups (name) VALUES (name);
END //
DELIMITER ;

-- Update permission group
DELIMITER //
CREATE PROCEDURE UpdateGroup(IN groupId INT, IN name VARCHAR(255))
BEGIN
    UPDATE Groups
    SET name = name
    WHERE id = groupId;
END //
DELIMITER ;

-- Delete permission group
DELIMITER //
CREATE PROCEDURE DeleteGroup(IN groupId INT)
BEGIN
    DELETE FROM Groups WHERE id = groupId;
END //
DELIMITER ;

-- Assign permission group with group id and permission id
DELIMITER //
CREATE PROCEDURE AssignPermissionToGroup(IN groupId INT, IN permissionId INT)
BEGIN
    INSERT INTO Group_Permissions (group_id, permission_id)
    VALUES (groupId, permissionId);
END //
DELIMITER ;

-- Remove permission from group
DELIMITER //
CREATE PROCEDURE RemovePermissionFromGroup(IN groupId INT, IN permissionId INT)
BEGIN
    DELETE FROM Group_Permissions WHERE group_id = groupId AND permission_id = permissionId;
END //
DELIMITER ;

-- Assign user to group
DELIMITER //
CREATE PROCEDURE AssignUserToGroup(IN userId INT, IN groupId INT)
BEGIN
    INSERT INTO User_Groups (user_id, group_id)
    VALUES (userId, groupId);
END //
DELIMITER ;

-- Remove user from group
DELIMITER //
CREATE PROCEDURE RemoveUserFromGroup(IN userId INT, IN groupId INT)
BEGIN
    DELETE FROM User_Groups WHERE user_id = userId AND group_id = groupId;
END //
DELIMITER ;

-- Assign permission to user
DELIMITER //
CREATE PROCEDURE AssignPermissionToUser(IN userId INT, IN permissionId INT)
BEGIN
    INSERT INTO User_Permissions (user_id, permission_id)
    VALUES (userId, permissionId);
END //
DELIMITER ;

-- Remove permission from user
DELIMITER //
CREATE PROCEDURE RemovePermissionFromUser(IN userId INT, IN permissionId INT)
BEGIN
    DELETE FROM User_Permissions WHERE user_id = userId AND permission_id = permissionId;
END //
DELIMITER ;

-- Get all business types
DELIMITER //
CREATE PROCEDURE GetAllBusinessType()
BEGIN
    SELECT * FROM BusinessTypes;
END //
DELIMITER ;

-- Get business type with id
DELIMITER //
CREATE PROCEDURE GetBusinessType(IN businessTypeId INT)
BEGIN
    SELECT * FROM BusinessTypes WHERE id = businessTypeId;
END //
DELIMITER ;

-- Create business type
DELIMITER //
CREATE PROCEDURE CreateBusinessType(IN name VARCHAR(255))
BEGIN
    INSERT INTO BusinessTypes (name) VALUES (name);
END //
DELIMITER ;

-- Update business type with id
DELIMITER //
CREATE PROCEDURE UpdateBusinessType(IN businessTypeId INT, IN name VARCHAR(255))
BEGIN
    UPDATE BusinessTypes
    SET name = name
    WHERE id = businessTypeId;
END //
DELIMITER ;

-- Delete business type with id
DELIMITER //
CREATE PROCEDURE DeleteBusinessType(IN businessTypeId INT)
BEGIN
    DELETE FROM BusinessTypes WHERE id = businessTypeId;
END //
DELIMITER ;

-- Get name reservation
DELIMITER //
CREATE PROCEDURE GetNameReservation(IN nameReservationId INT)
BEGIN
    SELECT * FROM NameReservations WHERE id = nameReservationId;
END //
DELIMITER ;

-- Create name reservation
DELIMITER //
CREATE PROCEDURE CreateNameReservation(IN name VARCHAR(255), IN reason VARCHAR(255), IN status VARCHAR(255))
BEGIN
    INSERT INTO NameReservations (name, reason, status)
    VALUES (name, reason, status);
END //
DELIMITER ;

-- Update name reservation with id
DELIMITER //
CREATE PROCEDURE UpdateNameReservation(IN nameReservationId INT, IN name VARCHAR(255), IN reason VARCHAR(255), IN status VARCHAR(255))
BEGIN
    UPDATE NameReservations
    SET name = name, reason = reason, status = status
    WHERE id = nameReservationId;
END //
DELIMITER ;

-- Delete name reservation with id
DELIMITER //
CREATE PROCEDURE DeleteNameReservation(IN nameReservationId INT)
BEGIN
    DELETE FROM NameReservations WHERE id = nameReservationId;
END //
DELIMITER ;

-- Get all name reservation applications
DELIMITER //
CREATE PROCEDURE GetAllNameReservationApplications()
BEGIN
    SELECT * FROM NameReservationApplications;
END //
DELIMITER ;

-- Get name reservation application with id
DELIMITER //
CREATE PROCEDURE GetNameReservationApplication(IN applicationId INT)
BEGIN
    SELECT * FROM NameReservationApplications WHERE id = applicationId;
END //
DELIMITER ;

-- Create name reservation application
DELIMITER //
CREATE PROCEDURE CreateNameReservationApplication( 
    IN p_user_id INT,
    IN p_name_reservations JSON,
    IN p_business_types JSON,
)
BEGIN
    INSERT INTO NameReservationApplications (user_id)
    VALUES (p_user_id);
END //
DELIMITER ;

-- Update name reservation application with id and reviewed at
DELIMITER //
CREATE PROCEDURE ReviewNameReservationApplication(IN applicationId INT, IN reviewedAt DATETIME)
BEGIN
    UPDATE NameReservationApplications
    SET reviewed_at = reviewedAt
    WHERE id = applicationId;
END //
DELIMITER ;

-- Delete name reservation with id
DELIMITER //
CREATE PROCEDURE DeleteNameReservationApplication(IN applicationId INT)
BEGIN
    DELETE FROM NameReservationApplications WHERE id = applicationId;
END //
DELIMITER ;

-- Assign name reservation to application with application and name reservation id
DELIMITER //
CREATE PROCEDURE AssignNameReservationToApplication(IN applicationId INT, IN nameReservationId INT)
BEGIN
    INSERT INTO NameReservationApplication_NameReservations (application_id, name_reservation_id)
    VALUES (applicationId, nameReservationId);
END //
DELIMITER ;

-- Remove name reservation from application with application and name reservation id
DELIMITER //
CREATE PROCEDURE RemoveNameReservationFromApplication(IN applicationId INT, IN nameReservationId INT)
BEGIN
    DELETE FROM NameReservationApplication_NameReservations
    WHERE application_id = applicationId AND name_reservation_id = nameReservationId;
END //
DELIMITER ;

-- Assign business type to application
DELIMITER //
CREATE PROCEDURE AssignBusinessTypeToApplication(IN applicationId INT, IN businessTypeId INT)
BEGIN
    INSERT INTO NameReservationApplication_BusinessTypes (application_id, business_type_id)
    VALUES (applicationId, businessTypeId);
END //
DELIMITER ;

-- Remove business type from application
DELIMITER //
CREATE PROCEDURE RemoveBusinessTypeFromApplication(IN applicationId INT, IN businessTypeId INT)
BEGIN
    DELETE FROM NameReservationApplication_BusinessTypes
    WHERE application_id = applicationId AND business_type_id = businessTypeId;
END //
DELIMITER ;

-- Add comparative name to application
DELIMITER //
CREATE PROCEDURE AddComparativeNameToApplication(IN applicationId INT, IN comparativeName VARCHAR(255))
BEGIN
    INSERT INTO NameReservationApplication_ComparativeNames (application_id, comparative_name)
    VALUES (applicationId, comparativeName);
END //
DELIMITER ;

-- Remove comparative name from application
DELIMITER //
CREATE PROCEDURE RemoveComparativeNameFromApplication(IN applicationId INT, IN comparativeName VARCHAR(255))
BEGIN
    DELETE FROM NameReservationApplication_ComparativeNames
    WHERE application_id = applicationId AND comparative_name = comparativeName;
END //
DELIMITER ;
