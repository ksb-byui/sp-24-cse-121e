-module(auth).
-export([register_user/2, login_user/2]).

% Simulated database to store user information
-record(user, {username, password}).

% Function to register a new user
register_user(Username, Password) ->
    case find_user(Username) of
        {ok, _User} ->
            {error, "User already exists"};
        not_found ->
            NewUser = #user{username = Username, password = Password},
            store_user(NewUser),
            {ok, "User registered successfully"}
    end.

% Function to log in a user
login_user(Username, Password) ->
    case find_user(Username) of
        {ok, User} ->
            case User#user.password == Password of
                true ->
                    {ok, "Login successful"};
                false ->
                    {error, "Invalid password"}
            end;
        not_found ->
            {error, "User not found"}
    end.

% Simulated database operations (replace with actual DB operations)
store_user(User) ->
    io:format("Storing user: ~p~n", [User]).

find_user(Username) ->
    case Username of
        "alice" ->
            {ok, #user{username = "alice", password = "password"}};
        "bob" ->
            {ok, #user{username = "bob", password = "password"}};
        _ ->
            not_found
    end.
