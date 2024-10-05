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

public type User record {|
    readonly int id;
    string username;
    string firstName?;
    string lastName?;
    string email;
    string password;
    string role;
    string identificationNumber; // can be id or passport number
    int primaryContact;
    int secondaryContact?;
    int telephoneNumber?;
    string postalAddress;
    boolean is_authenticated = false;
    boolean is_active = false;
    boolean is_staff = false;
    Group[] groups?;
    Permission[] userPermissions?;
    time:Utc createdAt?;
    time:Utc updatedAt?;
|};

// Tech, Agriculture, etc
public type BusinessTypes record {|
    readonly int id;
    string name;
|};

public type NameReservation record {|
    readonly int id;
    string name;
    string reason; // reason for name
    string status; // accepted, rejected.
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
