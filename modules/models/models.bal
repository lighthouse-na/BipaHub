import ballerina/time;

public type Permission record {|
    readonly int id;
    string name;
    string model;
|};

public type Group record {|
    readonly int id;
    string name;
    Permission[] permissions;
|};

public type UserPermissions record {|
    User user;
    Permission permission;
|};

public type UserGroups record {|
    User user;
    Group[] groups;
|};

public type User record {|
    readonly int id;
    string username;
    string email;
    string password;
    string role;
    string identificationNumber; // can be id or passport number
    int primaryContact;
    int secondaryContact?;
    int telephoneNumber?;
    string postalAddress;
    time:Utc createdAt;
    time:Utc updatedAt;
|};

// Tech, Agriculture, etc
public type BusinessTypes record {|
    readonly int id;
    string name;
|};

public type NameReservation record {|
    readonly int id;
    string name;
    string reason;
    string status; // accepted, rejected.
    // User|() reviewed_by = ();
    // time:Utc reviewedAt;
|};

public type NameReservationApplication record {|
    readonly int id;
    time:Utc submittedAt;
    time:Utc updatedAt;
    User user;
    NameReservation[] nameReservation = []; // max 3
    BusinessTypes[] purpose = [];
    User|() reviewed_by = ();
    string[] comparative_names;
    time:Utc reviewedAt;
|};
