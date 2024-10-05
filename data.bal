import ballerina/time;

// Test data
table<User> key(id) users = table [
    {id: 1, username: "john", email: "john@example.com", password: "password123", role: "admin", identificationNumber: "123456789", primaryContact: 123456789, telephoneNumber: 123456789, postalAddress: "123 Main St", createdAt: time:utcNow(), updatedAt: time:utcNow()},
    {id: 2, username: "jane", email: "jane@example.com", password: "password123", role: "user", identificationNumber: "987654321", primaryContact: 987654321, telephoneNumber: 987654321, postalAddress: "456 Elm St", createdAt: time:utcNow(), updatedAt: time:utcNow()},
    {id: 3, username: "bob", email: "bob@example.com", password: "password123", role: "admin", identificationNumber: "111111111", primaryContact: 111111111, telephoneNumber: 111111111, postalAddress: "789 Oak St", createdAt: time:utcNow(), updatedAt: time:utcNow()},
    {id: 4, username: "alice", email: "alice@example.com", password: "password123", role: "user", identificationNumber: "222222222", primaryContact: 222222222, telephoneNumber: 222222222, postalAddress: "321 Pine St", createdAt: time:utcNow(), updatedAt: time:utcNow()},
    {id: 5, username: "charlie", email: "charlie@example.com", password: "password123", role: "admin", identificationNumber: "333333333", primaryContact: 333333333, telephoneNumber: 333333333, postalAddress: "901 Maple St", createdAt: time:utcNow(), updatedAt: time:utcNow()},
    {id: 6, username: "dave", email: "dave@example.com", password: "password123", role: "user", identificationNumber: "444444444", primaryContact: 444444444, telephoneNumber: 444444444, postalAddress: "234 Cedar St", createdAt: time:utcNow(), updatedAt: time:utcNow()},
    {id: 7, username: "ellen", email: "ellen@example.com", password: "password123", role: "admin", identificationNumber: "555555555", primaryContact: 555555555, telephoneNumber: 555555555, postalAddress: "567 Spruce St", createdAt: time:utcNow(), updatedAt: time:utcNow()},
    {id: 8, username: "frank", email: "frank@example.com", password: "password123", role: "user", identificationNumber: "666666666", primaryContact: 666666666, telephoneNumber: 666666666, postalAddress: "890 Walnut St", createdAt: time:utcNow(), updatedAt: time:utcNow()},
    {id: 9, username: "george", email: "george@example.com", password: "password123", role: "admin", identificationNumber: "777777777", primaryContact: 777777777, telephoneNumber: 777777777, postalAddress: "345 Hickory St", createdAt: time:utcNow(), updatedAt: time:utcNow()},
    {id: 10, username: "helen", email: "helen@example.com", password: "password123", role: "user", identificationNumber: "888888888", primaryContact: 888888888, telephoneNumber: 888888888, postalAddress: "678 Cherry St", createdAt: time:utcNow(), updatedAt: time:utcNow()}
];

table<BusinessTypes> key(id) businessTypes = table [];
table<NameReservation> key(id) reservationNames = table [];
table<NameReservationApplication> key(id) nameReservationApplications = table [];
