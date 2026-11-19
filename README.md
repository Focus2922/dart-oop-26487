# Dart OOP Assignment: Kigali Bus Card
**Name:** Tuyishimire Jean Claude
**Student ID:** 26487

## My numbers
- D = 87, L = 7
- Starting balance = 1870 RWF
- Bus fare = 287 RWF
- Student discount = 17%

## Output of main.dart
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

## Part 1: Why no setter for balance?
Having no setter for `_balance` prevents external code from changing the balance directly to invalid values (such as negative amounts or free money)[cite: 4]. Instead, balance changes only happen through controlled methods (`topUp` with the 500 to 50000 RWF rule and `pay` when sufficient balance exists)[cite: 4, 5].

## Part 2: What does ~/ do?
`~/` is integer division in Dart: it divides two numbers and truncates (drops) the decimal/remainder part, returning an integer[cite: 5].
- `237 * 17 / 100` gives `40.29` (floating-point division with decimals)[cite: 5].
- `237 * 17 ~/ 100` gives `40` (integer division without the `.29` remainder)[cite: 5].

## Part 4: Bug table
| Bug | The line | Why it is wrong (your words) | Your fix |
| :--- | :--- | :--- | :--- |
| **1** | `String _brand;` and `int _battery;` | Non-nullable fields in `Phone` are not initialized before the constructor runs[cite: 6, 7]. | Give them starting values: `String _brand = '';` and `int _battery = 0;`[cite: 4, 7]. |
| **2** | `SmartPhone(String brand, int battery, String system) {` | `Phone` has no default 0-argument constructor, so `SmartPhone` must pass `brand` and `battery` to `super`[cite: 5, 7]. | Add `: super(brand, battery)` to the `SmartPhone` constructor[cite: 5, 7]. |
| **3** | `@override` above `void restart()` in `SmartPhone` | `Phone` does not have a `restart()` method, so `@override` has nothing to override[cite: 7]. | Add `void restart()` to `Phone` so `SmartPhone` can override it[cite: 7]. |
| **4** | `p.battery = 100;` | `battery` only has a getter, not a setter, so assigning `100` fails[cite: 7]. | Add `set battery(int value)` that accepts only `0` to `100`[cite: 7]. |
| **5** | `print(p.battery());` | `battery` is a getter, not a method, so calling it with `()` is invalid[cite: 7]. | Change it to `print(p.battery);`[cite: 7]. |
| **Not a bug** | `Phone p = new Phone('Tecno', 50);` | Using `new` to call a constructor is valid Dart syntax even though `new` is optional[cite: 7]. | (none)[cite: 7] |

## Part 5
My prediction:
It will print `1` and then `5`.
- For `Bag a = Bag();`: `_items` starts at `0`, `a.add()` makes it `1`, `a.items = -5;` is ignored because `-5 < 0`, and `print(a.items)` prints `1`[cite: 7, 8].
- For `BigBag b = BigBag();`: `BigBag.add()` calls `super.add()` twice, so two calls to `b.add()` add `4` total, and `b.items = b.items + 1;` adds `1` (`5 >= 0`), making it `5`[cite: 7, 8].

Real output:
1
5

Was I right?
Yes, my prediction matched the real output (`1` and `5`).
