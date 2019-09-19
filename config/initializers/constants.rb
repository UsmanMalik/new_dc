
# if user did something wrong
ERRORS = {
    SESSIONS_INVALID_CREDENTIALS: 'Invalid Username or Password',
    INCOMPLETE_DATA: 'Please provide complete information',
    INVALID_ACCESS_TOKEN: 'Invalid Access token',
    UNAUTHORIZED_ACTION: 'You are not authorized'
}


# info why something is not happening
INFO = {
    SESSIONS_NOT_ACTIVATED: 'Your account is not activated yet, please try again later or contact administrator',
    SESSIONS_LOGIN_FIRST: 'Please login to continue.',
    SESSIONS_LOGGED_OUT: 'You are successfully logged out',

    RESOURCE_NOT_FOUND: 'You made an invalid request',
    OK: 'Success!',
    UNKNOWN_ERR: 'Unknown error while processing request'
}


# json paramters

J_PARA = {
    err: 'error',
    info: 'info',
    redirect: 'redirect_path'
}

# flash paramters

F_PARA = {
    err: 'error',
    info: 'info'
}

# Subscription limits

SUBSCRIPTION = {


    free_trail_users: 2,
    free_trail_tasks: 5,
    monthly_users: 10,
    monthly_tasks: 15,
    semiannualy_users: 150,
    semiannualy_tasks: 200,
    annualy_users: 20,
    annualy_tasks: 25
}