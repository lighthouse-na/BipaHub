-- Create the necessary tables as before
CREATE DATABASE mydb;

-- Permissions Table
CREATE TABLE Permissions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  UNIQUE (name) -- Index for unique permission names
);

-- Groups Table
CREATE TABLE Groups (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  UNIQUE (name) -- Index for unique group names
);

-- Group_Permissions Table
CREATE TABLE Group_Permissions (
  group_id INT,
  permission_id INT,
  PRIMARY KEY (group_id, permission_id),
  FOREIGN KEY (group_id) REFERENCES Groups(id),
  FOREIGN KEY (permission_id) REFERENCES Permissions(id),
  INDEX idx_group_permissions_group_id (group_id), -- Index for group_id
  INDEX idx_group_permissions_permission_id (permission_id) -- Index for permission_id
);

-- Users Table
CREATE TABLE Users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NULL,
  last_name VARCHAR(255) NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(255) NOT NULL,
  identification_number VARCHAR(255) NOT NULL,
  primary_contact INT NOT NULL,
  secondary_contact INT NULL,
  telephone_number INT NULL,
  postal_address VARCHAR(255) NOT NULL,
  is_authenticated BOOLEAN NOT NULL DEFAULT FALSE,
  is_active BOOLEAN NOT NULL DEFAULT FALSE,
  is_staff BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL,
  UNIQUE (email),
  INDEX idx_user_username (username),
  INDEX idx_user_role (role)
);

-- User_Groups Table
CREATE TABLE User_Groups (
  user_id INT,
  group_id INT,
  PRIMARY KEY (user_id, group_id),
  FOREIGN KEY (user_id) REFERENCES Users(id),
  FOREIGN KEY (group_id) REFERENCES Groups(id),
  INDEX idx_user_groups_user_id (user_id), -- Index for user_id
  INDEX idx_user_groups_group_id (group_id) -- Index for group_id
);

-- User_Permissions Table
CREATE TABLE User_Permissions (
  user_id INT,
  permission_id INT,
  PRIMARY KEY (user_id, permission_id),
  FOREIGN KEY (user_id) REFERENCES Users(id),
  FOREIGN KEY (permission_id) REFERENCES Permissions(id),
  INDEX idx_user_permissions_user_id (user_id), -- Index for user_id
  INDEX idx_user_permissions_permission_id (permission_id) -- Index for permission_id
);

-- BusinessTypes Table
CREATE TABLE BusinessTypes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  UNIQUE (name)
);

-- NameReservations Table
CREATE TABLE NameReservations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  reason VARCHAR(255) NOT NULL,
  status VARCHAR(255) NOT NULL,
  INDEX idx_name_reservations_status (status)
);

-- NameReservationApplications Table
CREATE TABLE NameReservationApplications (
  id INT PRIMARY KEY AUTO_INCREMENT,
  submitted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_id INT NOT NULL,
  reviewed_by INT NULL,
  reviewed_at DATETIME NULL,
  reviewer_comments VARCHAR(255) NULL,
  FOREIGN KEY (user_id) REFERENCES Users(id),
  FOREIGN KEY (reviewed_by) REFERENCES Users(id),
  INDEX idx_name_reservation_application_user_id (user_id)
);

-- NameReservationApplication_NameReservations Table
CREATE TABLE NameReservationApplication_NameReservations (
  application_id INT,
  name_reservation_id INT,
  PRIMARY KEY (application_id, name_reservation_id),
  FOREIGN KEY (application_id) REFERENCES NameReservationApplications(id),
  FOREIGN KEY (name_reservation_id) REFERENCES NameReservations(id),
  INDEX idx_application_name_reservation (application_id, name_reservation_id)
);

-- NameReservationApplication_BusinessTypes Table
CREATE TABLE NameReservationApplication_BusinessTypes (
  application_id INT,
  business_type_id INT,
  PRIMARY KEY (application_id, business_type_id),
  FOREIGN KEY (application_id) REFERENCES NameReservationApplications(id),
  FOREIGN KEY (business_type_id) REFERENCES BusinessTypes(id),
  INDEX idx_application_business_type (application_id, business_type_id)
);
