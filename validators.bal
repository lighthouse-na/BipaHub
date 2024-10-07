function nameReservationsAmountValidator(NameReservationApplication application) returns error|() {
    if application.name_reservations.length() < 1 {
        return error("There must be at least one name");
    }
    else if application.name_reservations.length() > 3 {
        return error("Maximum of 3 name reservations allowed");
    }
}

function usernameValidator(User user) returns error|() {
    if user.username.trim() == "" {
        return error("Username cannot be empty or whitespace-only");
    } else if user.username.length() < 3 {
        return error("Username must be at least 3 character long");
    } else if user.username.length() > 255 {
        return error("Username is too long, try something shorter");
    }
}

function emailValidator(User user) returns error|() {
    if user.email.trim() == "" {
        return error("Email cannot be empty or whitespace-only");
    } else if !user.email.includes("@") {
        return error("Email must contain '@'");
    } else if !user.email.includes(".") {
        return error("Email must contain a '.' after '@'");
    } else if user.email.length() > 255 {
        return error("Email cannot exceed 255 characters");
    }
}

function passwordValidator(User user) returns error|() {
    if user.password.length() < 8 {
        return error("Password must be at least 8 character long");
    }
}
