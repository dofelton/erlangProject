-module(main).
-export([main/0]).

main() ->
    io:format("Welcome to the calculator!"),
    {ok, [Num1]} = io:fread("", "~d")