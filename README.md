# Dart OOP Assignment: Kigali Bus Card

Name: Tuyishimire Jean Claude  
Student ID: 26487  

## Part 1: Why no setter for balance?
Having no setter for balance stops external code from changing _balance directly to invalid numbers (like a negative balance or fake money). Instead, _balance can only change through topUp (which enforces the 500 to 50000 RWF rule) and pay (which checks that there is enough balance to cover the fare).

## Part 2: What does ~/ do?
`~/` is integer division in Dart: it divides two numbers and truncates (drops) the decimal/remainder part, returning an `int`[cite: 5].
- `237 * 17 / 100` (`/` regular division) produces `40.29` (a `double` with decimals)[cite: 5].
- `237 * 17 ~/ 100` (`~/` integer division) produces `40` (an `int` without the `.29` remainder)[cite: 5].

