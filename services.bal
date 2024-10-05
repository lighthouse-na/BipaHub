import ballerina/http;

listener http:Listener httpListener = new (9090);

service /permissions on httpListener {

    resource function get all_permissions() returns Permission[] {
        Permission[] permissions = [];
        return permissions;
    }

    resource function get permission(int id) returns Permission? {
        return ();
    }

    resource function post create_permission(Permission permission) returns Permission {
        return permission;
    }

    resource function update update_permission(int id, Permission permission) returns Permission? {
        return ();
    }

    resource function delete delete_permission(int id) returns error? {
        return ();
    }

}

service /groups on httpListener {

    resource function get all_groups() returns Group[] {
        Group[] groups = [];
        return groups;
    }

    resource function get group(int id) returns Group? {
        return ();
    }

    resource function post create_group(Group group) returns Group {
        return group;
    }

    resource function update update_group(int id, Group group) returns Group? {
        return ();
    }

    resource function delete delete_group(int id) returns error? {
        return ();
    }

}

service /users on httpListener {

    resource function get all_users() returns User[] {
        return users.toArray();
    }

    resource function get get_user/[int id]() returns User|error {
        if users.hasKey(id) {
            User user = users.get(id);
            return user;
        } else {
            return error("User not found");
        }
    }

    resource function post create_user(User user) returns User|error {
        error? usernameErr = usernameValidator(user);
        if usernameErr is error {
            return usernameErr;
        }

        error? passwordErr = passwordValidator(user);
        if passwordErr is error {
            return passwordErr;
        }

        users.add(user);
        return user;
    }

    resource function update update_user(int id, User user) returns User|error|string {
        return error("");
    }

    resource function delete delete_user/[int id]() returns User|error|string {
        if users.hasKey(id) {
            User user = users.remove(id);
            return user;
        } else {
            return error("User not found");
        }
    }

}

service /business/types on httpListener {

    resource function get all() returns BusinessTypes[] {
        return businessTypes.toArray();
    }

    resource function get get_type/[int id]() returns BusinessTypes|error {
        if businessTypes.hasKey(id) {
            BusinessTypes businessType = businessTypes.get(id);
            return businessType;
        } else {
            return error("Type not found");
        }
    }

    resource function post create_type(BusinessTypes businessType) returns BusinessTypes|error {
        businessTypes.add(businessType);
        return businessType;
    }

    resource function update update_type(int id, BusinessTypes businessType) returns BusinessTypes|error|string {
        return error("");
    }

    resource function delete delete_type/[int id]() returns BusinessTypes|error|string {
        if businessTypes.hasKey(id) {
            BusinessTypes businessType = businessTypes.remove(id);
            return businessType;
        } else {
            return error("Type not found");
        }
    }

}

service /reservation/name on httpListener {

    resource function get all() returns NameReservation[] {
        return reservationNames.toArray();
    }

    resource function get get_type/[int id]() returns NameReservation|error {
        if reservationNames.hasKey(id) {
            NameReservation reservationName = reservationNames.get(id);
            return reservationName;
        } else {
            return error("Name not found");
        }
    }

    resource function post create_type(NameReservation reservationName) returns NameReservation|error {
        reservationNames.add(reservationName);
        return reservationName;
    }

    resource function update update_type(int id, NameReservation reservationName) returns NameReservation|error|string {
        return error("");
    }

    resource function delete delete_type/[int id]() returns NameReservation|error|string {
        if reservationNames.hasKey(id) {
            NameReservation reservationName = reservationNames.remove(id);
            return reservationName;
        } else {
            return error("Name not found");
        }
    }

}

service /reservation/application on httpListener {

    resource function get all() returns NameReservationApplication[] {
        return nameReservationApplications.toArray();
    }

    resource function get get_type/[int id]() returns NameReservationApplication|error {
        if nameReservationApplications.hasKey(id) {
            NameReservationApplication nameReservationApplication = nameReservationApplications.get(id);
            return nameReservationApplication;
        } else {
            return error("Name reservation application not found");
        }
    }

    resource function post create_type(NameReservationApplication nameReservationApplication) returns NameReservationApplication|error {
        error? reservationAmountErr = nameReservationsAmountValidator(nameReservationApplication);
        if reservationAmountErr is error {
            return reservationAmountErr;
        }
        nameReservationApplications.add(nameReservationApplication);
        return nameReservationApplication;
    }

    resource function update update_type(int id, NameReservationApplication nameReservationApplication) returns NameReservationApplication|error|string {
        return error("");
    }

    resource function delete delete_type/[int id]() returns NameReservationApplication|error|string {
        if nameReservationApplications.hasKey(id) {
            NameReservationApplication nameReservationApplication = nameReservationApplications.remove(id);
            return nameReservationApplication;
        } else {
            return error("Name reservation application not found");
        }
    }

}
