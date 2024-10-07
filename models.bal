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
    string first_name?;
    string last_name?;
    string email;
    string password;
    string role;
    string identification_number; // can be id or passport number
    int primary_contact;
    int secondary_contact?;
    int telephone_number?;
    string postal_address;
    boolean is_authenticated = false;
    boolean is_active = false;
    boolean is_staff = false;
    Group[] groups?;
    Permission[] userPermissions?;
    string created_at;
    string updated_at?;
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
    string submitted_at;
    User user;
    NameReservation[] name_reservations = []; // max 3
    BusinessTypes[] business_types = [];
    User|() reviewed_by = ();
    string reviewed_at;
    string reviewer_comments;
|};
