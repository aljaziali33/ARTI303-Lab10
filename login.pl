
% Task 2: Login System

% Dataset
user(aljazi, 1234).
user(sara, 5678).
user(noor, 9012).

% Start login
login :-
    login_attempt(3).

% Check login attempts
login_attempt(Attempts) :-
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    check_login(Username, Password, Attempts).

% Successful login
check_login(Username, Password, _) :-
    user(Username, Password),
    !,
    writeln('Login Successful').

% Failed login with attempts remaining
check_login(_, _, Attempts) :-
    Attempts > 1,
    !,
    writeln('Login Unsuccessful'),
    Remaining is Attempts - 1,
    login_attempt(Remaining).

% Maximum attempts exceeded
check_login(_, _, 1) :-
    writeln('Login Unsuccessful'),
    writeln('Sorry, you exceeded the maximum number of attempts, try again later.').
