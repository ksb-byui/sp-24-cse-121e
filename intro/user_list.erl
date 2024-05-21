-module(user_list).
-export([start/0, add_user/2, proc/1, print_user/1]).

% Start the user list process
start() ->
    spawn(user_list, proc, [["test"]]).

% Function to add a user (sends a message to the process)
add_user(Pid, UserName) ->
    Pid ! {add, UserName}.

% The loop function that maintains the state (list of user names)
proc(UserList) ->
    receive
        {send, Func} ->
            io:format("recieved"),
            Func(UserList),
            proc(UserList)
    end.

print_user(UserName) ->
    io:format(UserName).


% it works YAY!!