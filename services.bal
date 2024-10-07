import ballerina/http;
import ballerina/sql;
import ballerinax/mysql.driver as _;

listener http:Listener httpListener = new (9090);

service /permissions on httpListener {

    resource function get .() returns Permission[]|error {
        stream<Permission, sql:Error?> permissions = mydb->query(`CALL GetAllPermission()`);
        return from Permission permission in permissions
            select permission;
    }

    resource function get [int id]() returns Permission|error {
        Permission|sql:Error permission = mydb->queryRow(`CALL GetPermission(${id})`);
        if permission is sql:NoRowsError {
            return error("Permission not found");
        } else {
            return permission;
        }
    }

    resource function post create(@http:Payload Permission permission) returns Permission|error {
        _ = check mydb->call(`CALL CreatePermission(${permission.name},${permission.model})`);
        return permission;
    }

    // resource function update update_permission(int id, Permission permission) returns Permission|error {
    //     return ();
    // }

    resource function delete delete/[int id]() returns error|string {
        _ = check mydb->call(`CALL DeletePermission(${id})`);
        return "deleted";
    }

}

service /groups on httpListener {

    resource function get .() returns Group[]|error {
        stream<Group, sql:Error?> groups = mydb->query(`CALL GetAllGroup()`);
        return from Group group in groups
            select group;
    }

    resource function get [int id]() returns Group|error {
        Group|sql:Error group = mydb->queryRow(`CALL GetGroup(${id})`);
        if group is sql:NoRowsError {
            return error("Group not found");
        } else {
            return group;
        }
    }

    // resource function post create(@http:Payload Group group) returns Group|error {
    //     _ = check mydb->call(`CALL CreatePermission(${group.name},${group.permissions[]})`);
    //     return group;
    // }

    // resource function update update_group(int id, Group group) returns Group? {
    //     return ();
    // }

    resource function delete delete/[int id]() returns error|string {
        _ = check mydb->call(`CALL DeleteGroup(${id})`);
        return "deleted";
    }

}

service /users on httpListener {

    resource function get .() returns User[]|error {
        // stream<User, sql:Error?> userStream = mydb->query(`SELECT * FROM Users`);
        stream<User, sql:Error?> userStream = mydb->query(`CALL GetAllUser()`);
        return from User user in userStream
            select user;
    }

    resource function get [int id]() returns User|error {
        // User|sql:Error user = mydb->queryRow(`SELECT * FROM Users WHERE id = ${id}`);
        User|sql:Error user = mydb->queryRow(`CALL GetUser(${id})`);
        if user is sql:NoRowsError {
            return error("User not found");
        } else {
            return user;
        }
    }

    resource function post create(@http:Payload User user) returns User|error {
        _ = check mydb->call(`CALL CreateUser(
                ${user.username},
                ${user.first_name},
                ${user.last_name},
                ${user.email},
                ${user.password},
                ${user.role},
                ${user.identification_number},
                ${user.primary_contact},
                ${user.secondary_contact},
                ${user.telephone_number},
                ${user.postal_address},
                ${user.is_authenticated},
                ${user.is_active},
                ${user.is_staff}
                )`);
        return user;
    }

    resource function delete delete/[int id]() returns error|string {
        _ = check mydb->call(`CALL DeleteUser(${id})`);
        return "deleted";
    }

}

service /business/types on httpListener {

    resource function get .() returns BusinessTypes[]|error {
        stream<BusinessTypes, sql:Error?> businessTypes = mydb->query(`CALL GetAllPermission()`);
        return from BusinessTypes businessType in businessTypes
            select businessType;
    }

    resource function get [int id]() returns BusinessTypes|error {
        BusinessTypes|sql:Error businessType = mydb->queryRow(`CALL GetBusinessType(${id})`);
        if businessType is sql:NoRowsError {
            return error("Business type not found");
        } else {
            return businessType;
        }
    }

    resource function post create(@http:Payload BusinessTypes businessType) returns BusinessTypes|error {
        _ = check mydb->call(`CALL CreateBusinessType(${businessType.name}`);
        return businessType;
    }

    // resource function update update_type(int id, BusinessTypes businessType) returns BusinessTypes|error|string {
    //     return error("");
    // }

    resource function delete delete/[int id]() returns BusinessTypes|error|string {
        _ = check mydb->call(`CALL DeleteBusinessType(${id})`);
        return "deleted";
    }

}

service /reservation/name on httpListener {

    resource function get [int id]() returns NameReservation|error {
        NameReservation|sql:Error nameReservation = mydb->queryRow(`CALL GetNameReservation(${id})`);
        if nameReservation is sql:NoRowsError {
            return error("Name reservation not found");
        } else {
            return nameReservation;
        }
    }

    resource function post create(@http:Payload NameReservation nameReservation) returns NameReservation|error {
        _ = check mydb->call(`CALL CreateNameReservation(${nameReservation.name},${nameReservation.reason},${nameReservation.status})`);
        return nameReservation;
    }

    // resource function update update(int id, NameReservation reservationName) returns NameReservation|error|string {
    //     return error("");
    // }

    resource function delete delete/[int id]() returns error|string {
        _ = check mydb->call(`CALL DeleteNameReservation(${id})`);
        return "deleted";
    }

}

service /reservation/applications on httpListener {

    resource function get .() returns NameReservationApplication[]|error {
        stream<NameReservationApplication, sql:Error?> nameReservationApplications = mydb->query(`CALL GetAllNameReservationApplications()`);
        return from NameReservationApplication nameReservationApplication in nameReservationApplications
            select nameReservationApplication;
    }

    resource function get [int id]() returns NameReservationApplication|error {
        NameReservationApplication|sql:Error nameReservationApplication = mydb->queryRow(`CALL GetNameReservationApplication(${id})`);
        if nameReservationApplication is sql:NoRowsError {
            return error("Name reservation application not found");
        } else {
            return nameReservationApplication;
        }
    }

    // resource function post create(@http:Payload NameReservationApplication nameReservationApplication) returns NameReservationApplication|error {
    //     _ = check mydb->call(`CALL CreateNameReservationApplication(
    //             ${nameReservationApplication.user},
    //             ${nameReservationApplication.name_reservations[]},
    //             ${nameReservationApplication.business_types[]},
    //             ${nameReservationApplication.reviewed_by},
    //             ${nameReservationApplication.reviewed_at},
    //             ${nameReservationApplication.reviewer_comments},
    //             ${nameReservationApplication.updated_at},
    //         )`);
    //     return nameReservationApplication;
    // }

    // resource function update update_type(int id, NameReservationApplication nameReservationApplication) returns NameReservationApplication|error|string {
    //     return error("");
    // }

    resource function delete delete/[int id]() returns error|string {
        _ = check mydb->call(`CALL DeleteNameReservationApplication(${id})`);
        return "deleted";
    }

}
