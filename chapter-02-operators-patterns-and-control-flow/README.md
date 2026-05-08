# Chapter 2 — Operators, Patterns, and Control Flow

### ⚙️ Operators in Dart

Operators in Dart are classified as follows:

- Arithmetic operators
- Equality and relational operators (or simply Comparison operators)
- Type test operators
- Assignment operators
- Logical operators
- Bitwise and shift operators
- Conditional expressions
- Cascade notation
- Other operators

#### 🧮 Arithmetic operators

| Operator | Description | Example |
| :--- | :--- | :--- |
| `+` | Addition | `2 + 4 = 6` |
| `-` | Subtraction | `3 - 1 = 2` |
| `*` | Multiplication | `2 * 2 = 4` |
| `/` | Division | `7 / 2 = 3.5` |
| `%` | Remainder after division (modulo) | `4 % 2 = 0` |
| `~/` | Integer division | `10 ~/ 3 = 3` |
| `++a` | Prefix increment | Increments `a` first, then uses its new value |
| `a++` | Postfix increment | Uses the current value of `a`, then increments it |
| `--a` | Prefix decrement | Decrements `a` first, then uses its new value |
| `a--` | Postfix decrement | Uses the current value of `a`, then decrements it |

#### ⚖️ Comparison operators

| Operator | Description | Example |
| :--- | :--- | :--- |
| `==` | Equal to | `2 == 2` -> `true` |
| `!=` | Not equal to | `2 != 2` -> `false` |
| `>` | Greater than | `3 > 2` -> `true` |
| `<` | Less than | `7 < 2` -> `false` |
| `>=` | Greater than or equal to | `4 >= 2` -> `true` |
| `<=` | Less than or equal to | `10 <= 3` -> `false` |

#### 🧪 Type test operators

| Operator | Description | Example |
| :--- | :--- | :--- |
| `as` | Typecast | `(value as String).length` |
| `is` | Returns `true` if the object has the specified type | `int a = 3;` `a is int` -> `true` |
| `is!` | Returns `true` if the object doesn't have the specified type | `int a = 3;` `a is! int` -> `false` |

```dart
Object value = 'Hello Dart';

print(value is String);  // true
print(value is! int);    // true

if (value is String) {
  print(value.length);   // 10
}

var text = value as String;
print(text.toUpperCase()); // HELLO DART
```

> 💡 Use `is` to check a type safely.

> 💡 Use `as` only when you are sure about the object's type.

----
