-module(main).
-export([main/0, get_number/0]).

% function to capture a user input number
get_number() ->
    io:format("Enter a number: "),
    case io:fread("", "~d") of
        {ok, [Num]} -> Num; 
        _ ->
            io:format("Invalid input, try again.~n"),
            get_number()
    end.

% function that takes the numbers and operation and calculates result
calculate() ->

end.

% main function to run the program
main() ->
    io:format("Welcome to the calculator!~n"),

% prompt user for a number, read input and assign it to a variable
    Num1 = get_number(),

% prompt user for a mathmatical operation, read input and assign it to a variable
    io:format("What operation would you like to perform? (+, -, x, /)~n"),
    Operation = string:trim(io:get_line("")),

% prompt user for a number, read input and assign it to a variable
    Num2 = get_number(),

% output results to the screen
    io:format("~p, ~p, ~p~n", [Num1, Operation, Num2]).