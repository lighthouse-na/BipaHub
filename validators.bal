
function nameReservationsAmountValidator(NameReservationApplication application) returns error|() {
    if application.nameReservation.length() < 1 {
        return error("There must be at least one name");
    }
    else if application.nameReservation.length() > 3 {
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

function passwordValidator(User user) returns error|() {
    if user.password.length() < 8 {
        return error("Password must be at least 8 character long");
    }
}
