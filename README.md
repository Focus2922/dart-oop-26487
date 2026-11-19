# Dart OOP Assignment: Kigali Bus Card

Name: Tuyishimire Jean Claude  
Student ID: 26487  

## Part 1: Why no setter for balance?
Having no setter for balance stops external code from changing _balance directly to invalid numbers (like a negative balance or fake money). Instead, _balance can only change through topUp (which enforces the 500 to 50000 RWF rule) and pay (which checks that there is enough balance to cover the fare).

## Part 2: What does ~/ do?
`~/` is integer division in Dart: it divides two numbers and truncates (drops) the decimal/remainder part, returning an `int`[cite: 5].
- `237 * 17 / 100` (`/` regular division) produces `40.29` (a `double` with decimals)[cite: 5].
- `237 * 17 ~/ 100` (`~/` integer division) produces `40` (an `int` without the `.29` remainder)[cite: 5].


## Part 3:

Error: name too short
Owner: Tuyishimire Jean Claude | Balance: 1870 RWF
Owner: Tuyishimire Jean Claude | Balance: 1870 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 287 RWF
Paid 287 RWF
Owner: Tuyishimire Jean Claude | Balance: 3296 RWF
Student discount: 48 RWF
Paid 239 RWF
Owner: Tuyishimire Jean Claude | Balance: 1631 RWF
Student card: 17% off

## Part 4: Bug table

## Part 4: Bug table

| Bug | The line | Why it is wrong (your words) | Your fix |
| :--- | :--- | :--- | :--- |
| **1** | `String _brand;` and `int _battery;` | Non-nullable fields in `Phone` are not initialized before the constructor runs. | Give them initial values: `String _brand = '';` and `int _battery = 0;`. |
| **2** | `SmartPhone(String brand, int battery, String system) {` | `Phone` has no default 0-argument constructor, so `SmartPhone` must pass `brand` and `battery` to `super`. | Add `: super(brand, battery)` to the `SmartPhone` constructor. |
| **3** | `@override` above `void restart()` in `SmartPhone` | `Phone` does not have a `restart()` method, so `@override` has nothing to override. | Add `void restart()` to `Phone` so `SmartPhone` can override it. |
| **4** | `p.battery = 100;` | `battery` only has a getter, not a setter, so assigning `100` fails. | Add `set battery(int value)` that accepts only values from `0` to `100`. |
| **5** | `print(p.battery());` | `battery` is a getter (property), not a method, so calling it with `()` is invalid. | Change it to `print(p.battery);`. |
| **Not a bug** | `Phone p = new Phone('Tecno', 50);` | Even though `new` is optional in modern Dart, using `new` to call the constructor is completely valid Dart syntax. | (none) |


## Part 5
My prediction:
It will print `1` and then `5`.
- For `Bag a = Bag();`: `_items` starts at `0`. `a.add()` makes `_items` equal `1`. `a.items = -5;` is ignored because the setter only accepts `value >= 0`. `print(a.items)` prints `1`.
- For `BigBag b = BigBag();`: `BigBag.add()` calls `super.add()` twice, adding `2` items each time. Calling `b.add()` twice adds `2 + 2 = 4`. Then `b.items = b.items + 1;` adds `1` (since `5 >= 0`), making it `5`. `print(b.items)` prints `5`.

