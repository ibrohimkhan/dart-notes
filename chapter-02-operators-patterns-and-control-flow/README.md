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
| `/` | Division, returns a double result | `7 / 2 = 3.5` |
| `%` | Remainder after division (modulo) | `4 % 2 = 0` |
| `~/` | Integer division | `10 ~/ 3 = 3` |
| `++a` | Prefix increment | Increments `a` first, then uses its new value |
| `a++` | Postfix increment | Uses the current value of `a`, then increments it |
| `--a` | Prefix decrement | Decrements `a` first, then uses its new value |
| `a--` | Postfix decrement | Uses the current value of `a`, then decrements it |

#### ⚖️ Comparison operators

| Operator | Description | Example |
| :--- | :--- | :--- |
| `==` | Equal to | `2 == 2` → `true` |
| `!=` | Not equal to | `2 != 2` → `false` |
| `>` | Greater than | `3 > 2` → `true` |
| `<` | Less than | `7 < 2` → `false` |
| `>=` | Greater than or equal to | `4 >= 2` → `true` |
| `<=` | Less than or equal to | `10 <= 3` → `false` |

#### 🧪 Type test operators

| Operator | Description | Example |
| :--- | :--- | :--- |
| `as` | Casts an object to a specific type | `(value as String).length` |
| `is` | Returns `true` if the object has the specified type | `int a = 3;` `a is int` → `true` |
| `is!` | Returns `true` if the object doesn't have the specified type | `int a = 3;` `a is! int` → `false` |

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


#### 📝 Assignment operators

| Operator | Description | Example |
| :--- | :--- | :--- |
| `=` | Assignment operator | `var a = 6;` |
| `+=` | Adds and assigns | `var a = 6;` `a += 3;` → `9`|
| `-=` | Subtracts and assigns | `var a = 6;` `a -= 3;` → `3` |
| `*=` | Multiplys and assigns | `var a = 6;` `a *= 2;` → `12` |
| `/=` | Divides and assigns | `var a = 3.0;` `a /= 3;` → `1.0` |
| `%=` | Modulo and assign | `var a = 4;` `a %= 2;` → `0` |
| `~/=` | Truncating division and assign | `var a = 9;` `a ~/= 3;` → `3` |


#### 🔗 Logical operators

| Operator | Description | Example |
| :--- | :--- | :--- |
| `&&` | Logical AND | `true && true` → `true`; all other combinations return `false` |
| <code>&#124;&#124;</code> | Logical OR | <code>false &#124;&#124; false</code> → `false`; all other combinations return `true` |
| `!` | Logical NOT (negation) | `!true` → `false`; `!false` → `true` |

Logical operators are commonly used with Boolean expressions.

- `&&` returns `true` only when both conditions are `true`.
- `||` returns `true` when at least one condition is `true`.
- `!` reverses a Boolean value.

#### 🧩 Bitwise and shift operators

Bitwise and shift operators work with the binary representation of integer values.

| Operator | Description | Example |
| :--- | :--- | :--- |
| `&` | Bitwise AND | `5 & 3` → `1` |
| <code>&#124;</code> | Bitwise OR | <code>5 &#124; 3</code> → `7` |
| `^` | Bitwise XOR | `5 ^ 3` → `6` |
| `~` | Bitwise complement | `~5` → `-6` |
| `<<` | Shift left | `3 << 1` → `6` |
| `>>` | Shift right | `8 >> 1` → `4` |
| `>>>` | Unsigned shift right | `8 >>> 1` → `4` |

> 💡 These operators are useful when working with flags, masks, permissions, low-level data, or binary values.

#### ❓ Conditional expressions

| Operator | Description | Example |
| :--- | :--- | :--- |
| `condition ? expr1 : expr2` | Returns `expr1` if the condition is `true`, otherwise returns `expr2` | `age >= 18 ? 'Adult' : 'Minor'` |
| `expr1 ?? expr2` | Returns `expr1` if it is not `null`, otherwise returns `expr2` | `name ?? 'Guest'` |

```dart
var age = 20;
var status = age > 12 && age <= 19 ? 'Teenager' : 'Not a teenager';

print(status); // Not a teenager

String? name;
var username = name ?? 'Guest';

print(username); // Guest
```

#### 🌊 Cascade notation

Cascade notation allows you to perform multiple operations on the same object.

| Operator | Description | Example |
| :--- | :--- | :--- |
| `..` | Performs multiple operations on the same non-null object | `person..name = 'Lena'..age = 20` |
| `?..` | Performs cascade operations only if the object is not `null` | `person?..name = 'Lena'` |

```dart
class Person {
  String name = '';
  int age = 0;

  void introduce() {
    print('My name is $name and I am $age years old.');
  }
}

void main() {
  var person = Person()
    ..name = 'Lena'
    ..age = 30; 

  person.introduce(); // My name is Lena and I am 30 years old.
}
```

> 💡 Cascade notation is useful when you want to configure an object immediately after creating it.

#### 🧰 Other operators

Other operators are used for function calls, member access, indexing, and working with nullable values.

| Operator | Description | Example |
| :--- | :--- | :--- |
| `()` | Function call | `print('Hello')` |
| `[]` | Accesses an item by index | `numbers[0]` |
| `?[]` | Accesses an item by index only if the object is not `null` | `numbers?[0]` |
| `.` | Accesses a member of an object | `person.name` |
| `?.` | Accesses a member only if the object is not `null` | `person?.name` |
| `!` | Null assertion operator | `name!.length` |

```dart
var nums = [10, 20, 30];

print(nums[2]); // 30

String? name = 'Lena';
print(name!.length); // 4

String? noName;
print(noName?.length); // null
```

> 💡 The `!` operator tells Dart that a nullable value is not `null`.

> Use it carefully, because it throws an error if the value is actually `null`.

----

### 🧬 Patterns


---
