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
| `*=` | Multiplies and assigns | `var a = 6;` `a *= 2;` → `12` |
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

A **pattern** describes the expected form of a value.

Patterns can be used to check whether a value:
- has a specific shape
- has a specific type
- equals a specific value
- matches a specific condition
- contains values that can be extracted

```dart
final value = 10;

final result = switch (value) {
  < 0 => 'Negative',
  == 0 => 'Zero',
  > 0 => 'Positive',
  _ => 'Unknown',
};

print(result); // Positive
```

In this example:

```dart
< 0
== 0
> 0
_
```

are patterns.

They describe what kind of value should match each `case`.

> 💡 A `switch` expression must be exhaustive.

> The `_` pattern means “match anything”

#### 🔍 Pattern Matching

**Pattern matching** means comparing a value with a pattern.

If the value matches the pattern, Dart executes the related code block or returns the related value.

```dart
final age = 25;

final category = switch (age) {
  >= 0 && < 18 => 'Child',
  >= 18 && < 65 => 'Adult',
  >= 65 => 'Senior',
  _ => 'Unknown',
};

print(category); // Adult
```

#### 📦 Destructuring

**Destructuring** means extracting values from a complex structure into separate variables.

It can be used with:
- lists
- records
- maps
- objects
- function return values

```dart
final user = ('Alex', 30);

final (name, age) = user;

print(name); // Alex
print(age);  // 30
```

Without destructuring, we would write:

```dart
final name = user.$1;
final age = user.$2;
```

Destructuring makes the code shorter and more readable.

---

### 🔀 Conditional Statements

Conditional statements allow a program to execute different blocks of code depending on a condition.

#### ✅ `if`

The `if` statement executes code only when the condition is `true`.

```dart
final age = 20;

if (age >= 18) {
  print('Adult');
}
```

The condition inside `if` must be a boolean expression.

#### 🔁 `if-else`

The `else` block is optional.

It is used when we want to execute another block of code if the condition is `false`.

```dart
final age = 16;

if (age >= 18) {
  print('Adult');

} else {
  print('Minor');
}
```

#### 🪜 `else-if`

`else-if` is used when there are multiple conditions.

```dart
final score = 85;

if (score >= 90) {
  print('Excellent');

} else if (score >= 70) {
  print('Good');

} else {
  print('Needs improvement');
}
```

#### ❓ Ternary Operator

The ternary operator is a short form of simple `if-else`.

```dart
condition ? true : false
```

```dart
final age = 20;

final message = age >= 18 ? 'Adult' : 'Minor';

print(message);
```

> Use the ternary operator when the condition is simple and the result is easy to read.

```dart
final discount = isStudent ? 0.2 : 0.0;
```

> Avoid nested ternary expressions because they are difficult to read.

```dart
final result = condition1
    ? condition2
        ? 'A'
        : 'B'
    : condition3
        ? 'C'
        : 'D';
```

In such cases, it is better to use `if-else` or `switch`.

---

### 🔁 Loops

Loops are used to repeat a block of code multiple times.

Dart supports several loop structures:

| Loop | Description |
| :--- | :--- |
| `for` | Used when we need a counter, index, or custom iteration logic |
| `for-in` | Used to iterate over values in an `Iterable` |
| `while` | Checks the condition before executing the body |
| `do-while` | Executes the body first, then checks the condition |


#### 🔢 `for` loop

The `for` loop is useful when we need an index, counter, or custom iteration logic.

```dart
for (var i = 0; i < 5; i++) {
  print(i);
}
```

```dart
final numbers = [10, 20, 30];

for (var i = 0; i < numbers.length; i++) {
  print('Index: $i, value: ${numbers[i]}');
}
```

Use `for` when you need access to the index.

#### 📚 `for-in` loop

The `for-in` loop is used to iterate over elements of an `Iterable`.

```dart
final numbers = [10, 20, 30];

for (final number in numbers) {
  print(number);
}
```

Use `for-in` when you do not need an index.

#### ⚖️ Difference between `for` and `for-in`

| Loop | Best used when |
| :--- | :--- |
| `for` | You need an index, counter, or custom iteration logic |
| `for-in` | You only need to iterate over values |

```dart
final names = ['Alex', 'Anna', 'John'];

for (var i = 0; i < names.length; i++) {
  print('$i: ${names[i]}');
}
```

```dart
final names = ['Alex', 'Anna', 'John'];

for (final name in names) {
  print(name);
}
```

#### 🔄 `while` loop

The `while` loop checks the condition before executing the loop body.

```dart
var i = 0;

while (i < 3) {
  print(i++);
}
```

If the condition is `false` from the beginning, the body will not execute.

```dart
var i = 5;

while (i < 3) {
  print(i++); // This code will not run
}
```

#### 🔂 `do-while` loop

The `do-while` loop executes the body first and checks the condition after that.

```dart
var i = 0;

do {
  print(i++);
} while (i < 3);
```

The body of a `do-while` loop runs at least once.

```dart
var i = 5;

do {
  print(i++); // Runs once
} while (i < 3);
```

#### ⚖️ Difference between `while` and `do-while`

| Loop | Condition check | Minimum executions |
| :--- | :--- | :--- |
| `while` | Before the body | Zero |
| `do-while` | After the body | One |


#### ⛔ `break` and `continue`

`break` and `continue` are used to control loop execution.


#### 🛑 `break`

The `break` statement stops the loop completely.

```dart
for (var i = 0; i < 10; i++) {
  if (i == 5) {
    break;
  }

  print(i);
}
```

Output:

```text
0
1
2
3
4
```

#### ⏭️ `continue`

The `continue` statement skips the current iteration and moves to the next one.

```dart
for (var i = 0; i < 5; i++) {
  if (i == 2) {
    continue;
  }

  print(i);
}
```

Output:

```text
0
1
3
4
```

#### 🗺️ Iterating over maps

A `Map<K, V>` stores data as key-value pairs.

The most common way to iterate over a map is to use `.entries`.

```dart
final capitals = {
  'Tajikistan': 'Dushanbe',
  'Germany': 'Berlin',
};

for (final entry in capitals.entries) {
  print('${entry.key}: ${entry.value}');
}
```

#### 🧩 Map destructuring with `MapEntry`

When iterating over `.entries`, each item is a `MapEntry`.

It can be destructured.

```dart
final capitals = {
  'Tajikistan': 'Dushanbe',
  'Germany': 'Berlin',
};

for (final MapEntry(:key, :value) in capitals.entries) {
  print('$key: $value');
}
```

or

```dart
for (final MapEntry(key: country, value: capital) in capitals.entries) {
  print('$country: $capital');
}
```

Without destructuring:

```dart
for (final entry in capitals.entries) {
  print('${entry.key}: ${entry.value}');
}
```

#### 🔑 Iterating over keys

```dart
for (final key in capitals.keys) {
  print(key);
}
```

#### 📌 Iterating over values

```dart
for (final value in capitals.values) {
  print(value);
}
```
