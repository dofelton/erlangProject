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
calculate(Num1, Num2, "+") -> Num1+Num2;
calculate(Num1, Num2, "-") -> Num1-Num2;
calculate(Num1, Num2, "*") -> Num1*Num2;

% Error handling for division by 0
calculate(Num1, Num2, "/") when Num2 =/= 0 -> Num1/Num2;
calculate(_, 0, "/") ->
    io:format("Error: Division by zero is not allowed!~n"),
    undefined;

% clause to handle invalid operators
calculate(_,_,_) ->
    io:format("Invalid operation. ~n"),
    undefined.

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

% calculate and output results
    case calculate(Num1, Num2, Operation) of 
        undefined -> io:format("Calculation failed due to invalid input.~n");
        Result -> io:format("~p ~s ~p = ~p~n", [Num1, Operation, Num2, Result])
    end.