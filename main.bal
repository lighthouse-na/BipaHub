import bipa_web_app.models;

import ballerina/http;
import ballerina/time;

listener http:Listener httpListener = new (9090);

// Test data
table<models:User> key(id) users = table [
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

service /permissions on httpListener {

    resource function get all_permissions() returns models:Permission[] {
        models:Permission[] permissions = [];
        return permissions;
    }

    resource function get permission(int id) returns models:Permission? {
        return ();
    }

    resource function post create_permission(models:Permission permission) returns models:Permission {
        return permission;
    }

    resource function update update_permission(int id, models:Permission permission) returns models:Permission? {
        return ();
    }

    resource function delete delete_permission(int id) returns error? {
        return ();
    }

}

service /groups on httpListener {

    resource function get all_groups() returns models:Group[] {
        models:Group[] groups = [];
        return groups;
    }

    resource function get group(int id) returns models:Group? {
        return ();
    }

    resource function post create_group(models:Group group) returns models:Group {
        return group;
    }

    resource function update update_group(int id, models:Group group) returns models:Group? {
        return ();
    }

    resource function delete delete_group(int id) returns error? {
        return ();
    }

}

service /users on httpListener {

    resource function get all_users() returns models:User[] {
        // models:User[] users = [];
        return users.toArray();
    }

    resource function get user(int id) returns models:User? {
        return ();
    }

    resource function post create_user(models:User user) returns models:User {
        return user;
    }

    resource function update update_user(int id, models:User user) returns models:User? {
        return ();
    }

    resource function delete delete_user(int id) returns error? {
        return ();
    }

}

service /permissions/users on httpListener {

    resource function get all_users_permissions() returns models:UserPermissions[] {
        models:UserPermissions[] users_permissions = [];
        return users_permissions;
    }

    resource function get user_permission(int id) returns models:UserPermissions? {
        return ();
    }

    resource function post create_user_permission(models:UserPermissions user_permission) returns models:UserPermissions {
        return user_permission;
    }

    resource function update update_user_permission(int id, models:UserPermissions user_permission) returns models:UserPermissions? {
        return ();
    }

    resource function delete delete_user_permission(int id) returns error? {
        return ();
    }

}

service /groups/users on httpListener {

    resource function get all_users_groups() returns models:UserGroups[] {
        models:UserGroups[] users_groups = [];
        return users_groups;
    }

    resource function get user_group(int id) returns models:UserGroups? {
        return ();
    }

    resource function post create_user_group(models:UserGroups user_group) returns models:UserGroups {
        return user_group;
    }

    resource function update update_user_group(int id, models:UserGroups user_group) returns models:UserGroups? {
        return ();
    }

    resource function delete delete_user_group(int id) returns error? {
        return ();
    }

}

public function main() {

}
