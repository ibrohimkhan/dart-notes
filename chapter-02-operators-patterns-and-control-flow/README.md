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

Patterns describe the expected **shape**, **type**, **structure**, or **value**.

They are used when Dart needs to check whether a value matches a certain form.

Patterns are useful for:

- checking values;
- checking types;
- extracting data from records, lists, maps, and objects;
- writing more expressive `switch` and `if-case` logic.

| Concept | Description | Example |
| :--- | :--- | :--- |
| Pattern | Describes what a value should look like | `>= 18`, `[a, b]`, `User(:name)` |
| Pattern matching | Checks whether a value matches a pattern | `case >= 18:` |
| Destructuring | Extracts values from a matched structure | `final (name, age) = user;` |

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

> 💡 The `_` pattern means “match anything”.

> 💡 It is commonly used as a fallback case.

#### 🔍 Pattern matching

**Pattern matching** means comparing a value with a pattern.

If the value matches the pattern, Dart executes the related branch.

```dart
final value = 10;

switch (value) {
  case < 0:
    print('Negative');
  case == 0:
    print('Zero');
  case > 0:
    print('Positive');
  default:
    print('Unknown');
}
```

Common pattern types:

| Pattern type | Description | Example |
| :--- | :--- | :--- |
| Constant pattern | Matches a specific value | `case 200:` |
| Variable pattern | Stores the matched value in a variable | `case var value:` |
| Wildcard pattern | Matches anything and ignores the value | `case _:` |
| Relational pattern | Compares a value | `case >= 18:` |
| Logical pattern | Combines patterns | `case >= 18 && <= 65:` |
| List pattern | Matches a list structure | `case [a, b]:` |
| Record pattern | Matches a record structure | `case (name, age):` |
| Object pattern | Matches and destructures an object | `case User(:name):` |

> 💡 Pattern matching checks the value.

> 💡 Destructuring extracts values from it.

----

### 🔀 Control flow

Control flow means controlling which part of the program should run.

Dart provides several control flow tools:

- conditional statements;
- loops;
- `switch`;
- `if-case`;
- `break`;
- `continue`.

#### ✅ Conditional statements

Conditional statements are used when code should run only under certain conditions.

**`if`** runs a block of code only if the condition is `true`.

```dart
final age = 20;

if (age >= 18) {
  print('Adult');
}
```

**`else`** is optional and runs when the `if` condition is `false`.

```dart
final age = 16;

if (age >= 18) {
  print('Adult');
} else {
  print('Minor');
}
```

**`else-if`** is used when there are multiple conditions.

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

> 💡 Use normal `if` when you need to check a Boolean condition.

> 💡 Use the ternary operator only for short and simple `if-else` expressions.

#### 🔁 Loops

Loops are used to repeat a block of code multiple times.

| Loop | Description |
| :--- | :--- |
| `for` | Used when we need an index, counter, or custom iteration logic |
| `for-in` | Used to iterate over values in an `Iterable` |
| `while` | Checks the condition before running the loop body |
| `do-while` | Runs the body first, then checks the condition |

**`for` loop**

Use `for` when you need an index or counter.

```dart
final numbers = [10, 20, 30];

for (var i = 0; i < numbers.length; i++) {
  print('Index: $i, value: ${numbers[i]}');
}
```

**`for-in` loop**

Use `for-in` when you only need values from a collection.

```dart
final numbers = [10, 20, 30];

for (final number in numbers) {
  print(number);
}
```

| Loop | Best used when |
| :--- | :--- |
| `for` | You need an index, counter, or custom iteration logic |
| `for-in` | You only need values from a collection |

**`while` loop**

`while` checks the condition before executing the body.

```dart
var i = 0;

while (i < 3) {
  print(i);
  i++;
}
```

If the condition is `false` from the beginning, the body will not run.

```dart
var i = 5;

while (i < 3) {
  print(i); // This code will not run
  i++;
}
```

**`do-while` loop**

`do-while` executes the body first and checks the condition after that.

```dart
var i = 5;

do {
  print(i); // Runs once
  i++;
} while (i < 3);
```

| Loop | Condition check | Minimum executions |
| :--- | :--- | :--- |
| `while` | Before the body | Zero |
| `do-while` | After the body | One |

#### ⛔ `break` and `continue`

`break` and `continue` are used to control loop execution.

| Statement | Description |
| :--- | :--- |
| `break` | Stops the loop completely |
| `continue` | Skips the current iteration and moves to the next one |

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

#### 🗺️ Iterating over `Map<K, V>`

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

With destructuring:

```dart
for (final MapEntry(:key, :value) in capitals.entries) {
  print('$key: $value');
}
```

Full form:

```dart
for (final MapEntry(key: country, value: capital) in capitals.entries) {
  print('$country: $capital');
}
```

You can also iterate only over keys or values.

```dart
for (final key in capitals.keys) {
  print(key);
}

for (final value in capitals.values) {
  print(value);
}
```

> 💡 Use `.entries` when you need both key and value.

#### 🔀 `switch-case`

`switch-case` is used to choose one branch of execution based on a value.

In modern Dart, each `case` uses a pattern.

This means `switch` can match:
- simple values;
- types;
- ranges;
- lists;
- records;
- objects;
- additional conditions with `when`.

```dart
final command = 'open';

switch (command) {
  case 'open':
    print('Opening...');
  case 'close':
    print('Closing...');
  default:
    print('Unknown command');
}
```

> 💡 Non-empty `case` clauses do not require `break` in modern Dart.

#### 📤 `switch` expression

A `switch` expression returns a value.

```dart
final statusCode = 200;

final message = switch (statusCode) {
  200 => 'OK',
  404 => 'Not found',
  500 => 'Server error',
  _ => 'Unknown',
};

print(message); // OK
```

A `switch` expression must be exhaustive.

That means it must handle all possible values.

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

> 💡 Use `_` as a fallback pattern when Dart cannot prove that all possible values are covered.

#### 📏 Relational patterns in `switch`

Relational patterns allow comparisons.

| Pattern | Description |
| :--- | :--- |
| `< value` | Less than |
| `<= value` | Less than or equal to |
| `> value` | Greater than |
| `>= value` | Greater than or equal to |
| `== value` | Equal to |
| `!= value` | Not equal to |

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

#### 👤 Object patterns in `switch`

Object patterns allow us to match and destructure objects.

```dart
class Employee {
  final String name;
  final int age;
  final String position;
  final int salary;

  Employee(this.name, this.age, this.position, this.salary);
}
```

Full form:

```dart
final employee = Employee('Anna', 27, 'Team Leader', 29000);

switch (employee) {
  case Employee(name: var name, age: var age):
    print('$name is $age years old');
}
```

Shorter form:

```dart
switch (employee) {
  case Employee(:name, :age):
    print('$name is $age years old');
}
```

#### 🏷️ Labels in `switch`

Labels can be used when one `case` needs to continue execution from another `case`.

```dart
final command = 'open';

switch (command) {
  case 'open':
    print('Opening...');
    continue afterOpen;

  case 'close':
    print('Closing...');

  afterOpen:
  case 'pending':
    print('Additional processing...');
}
```

This feature should be used carefully because it can make code harder to read.

In most cases, it is better to avoid labels and use clearer logic.

```dart
switch (command) {
  case 'open' || 'pending':
    print('Additional processing...');
  case 'close':
    print('Closing...');
  default:
    print('Unknown command');
}
```

> 💡 Labels are available for control flow, but they are rarely needed in everyday Dart code.

----

#### 🧪 `if-case`

`if-case` checks whether a value matches a pattern.

A normal `if` checks a Boolean condition.

```dart
if (value is String) {
  print(value.length);
}
```

`if-case` checks the structure of a value and can extract data at the same time.

```dart
final pair = [10, 20];

if (pair case [int x, int y]) {
  print('x = $x, y = $y');
}
```

```dart
final employee = Employee('Anna', 27, 'Team Leader', 29000);

if (employee case Employee(:name, :salary)) {
  print('$name earns $salary');
}
```

| Statement | Purpose |
| :--- | :--- |
| `if` | Checks a Boolean condition |
| `if-case` | Matches a value against a pattern and can destructure it |

> 💡 Use `if-case` when you want to check structure and extract data at the same time.

----

#### 🛡️ Guard clauses

A **guard clause** is an additional condition after a pattern.

In Dart, guard clauses are written using the `when` keyword.

They can be used with:

- `switch` statement;
- `switch` expression;
- `if-case`.

```dart
final age = 22;

final result = switch (age) {
  int value when value >= 18 => 'Adult',
  int value when value < 18 => 'Minor',
  _ => 'Unknown',
};

print(result); // Adult
```

```dart
final employee = Employee('Anna', 27, 'Team Leader', 29000);

switch (employee) {
  case Employee(:name, :salary) when salary > 20000:
    print('$name has a high salary');

  case Employee(:name):
    print('$name has a regular salary');
}
```

```dart
if (employee case Employee(:name, :salary) when salary > 20000) {
  print('$name has a high salary');
}
```

> 💡 The pattern is checked first.

> 💡 Then the `when` condition is checked.

----

### 📦 Destructuring

Destructuring extracts values from a structure into separate variables.

Dart supports destructuring for:
- lists;
- records;
- objects;
- `MapEntry` objects.

#### 📋 List destructuring

Full list destructuring:

```dart
final numbers = [1, 2, 3];

final [a, b, c] = numbers;

print(a); // 1
print(b); // 2
print(c); // 3
```

Ignoring values with `_`:

```dart
final numbers = [1, 2, 3];

final [first, _, third] = numbers;

print(first); // 1
print(third); // 3
```

Using a rest pattern:

```dart
final numbers = [1, 2, 3, 4, 5];

final [first, ...middle, last] = numbers;

print(first);  // 1
print(middle); // [2, 3, 4]
print(last);   // 5
```

List pattern in `if-case`:

```dart
final pair = [10, 20];

if (pair case [int x, int y]) {
  print('x = $x, y = $y');
}
```

List pattern in `switch`:

```dart
final numbers = [1, 2, 3];

switch (numbers) {
  case [var first, var second, var third]:
    print('$first, $second, $third');

  case [var onlyOne]:
    print('Only one element: $onlyOne');

  default:
    print('Unknown structure');
}
```

#### 🧾 Record destructuring

Positional record destructuring:

```dart
final user = ('Alex', 30);

final (name, age) = user;

print(name); // Alex
print(age);  // 30
```

Named record destructuring:

```dart
final user = (name: 'Alex', age: 30);

final (:name, :age) = user;

print(name); // Alex
print(age);  // 30
```

Destructuring with renaming:

```dart
final user = (name: 'Alex', age: 30);

final (name: userName, age: userAge) = user;

print(userName); // Alex
print(userAge);  // 30
```

Returning multiple values with records:

```dart
(String, int) getUserInfo() {
  return ('Alex', 30);
}

final (name, age) = getUserInfo();

print(name); // Alex
print(age);  // 30
```

With named fields:

```dart
({String name, int age}) getUserInfo() {
  return (name: 'Alex', age: 30);
}

final (:name, :age) = getUserInfo();

print(name); // Alex
print(age);  // 30
```

> 💡 Records are useful when you need to return several values without creating a separate class.

#### 👤 Object destructuring

Object destructuring extracts values from object fields or getters.

```dart
class User {
  final String name;
  final int age;

  User(this.name, this.age);
}
```

Short form:

```dart
final user = User('Alex', 30);

final User(:name, :age) = user;

print(name); // Alex
print(age);  // 30
```

Full form:

```dart
final User(name: userName, age: userAge) = user;

print(userName); // Alex
print(userAge);  // 30
```

Inside `switch`:

```dart
switch (user) {
  case User(:name, :age):
    print('$name is $age years old');
}
```

Inside `if-case`:

```dart
if (user case User(:name, :age)) {
  print('$name is $age years old');
}
```

> 💡 Object patterns use getters to extract values from an object.

#### 🗺️ `MapEntry` destructuring

Maps are commonly destructured through `MapEntry` when iterating over `.entries`.

```dart
final scores = {
  'Alex': 90,
  'Anna': 95,
};

for (final MapEntry(:key, :value) in scores.entries) {
  print('$key: $value');
}
```

Full form:

```dart
for (final MapEntry(key: name, value: score) in scores.entries) {
  print('$name: $score');
}
```

Without destructuring:

```dart
for (final entry in scores.entries) {
  print('${entry.key}: ${entry.value}');
}
```

> 💡 The destructuring version is shorter and cleaner when both key and value are needed.

----

### 🧠 Summary

In this chapter, we learned that:

- Dart has different groups of operators;
- `if`, `else-if`, and `else` are used for conditional execution;
- the `else` block is optional;
- loops are used to repeat code;
- `for` is useful when we need an index;
- `for-in` is useful when we only need values;
- `while` checks the condition before execution;
- `do-while` executes at least once;
- `break` stops a loop;
- `continue` skips the current iteration;
- `Map<K, V>` is commonly iterated using `.entries`;
- `switch-case` selects a branch based on patterns;
- `switch` expressions return values and must be exhaustive;
- `if-case` matches a value against a pattern;
- guard clauses use `when` for additional conditions;
- patterns describe the expected shape, type, structure, or value;
- pattern matching checks whether a value matches a pattern;
- destructuring extracts values from lists, records, objects, and `MapEntry` objects.

> 💡 Patterns and destructuring make Dart code more expressive, readable, and concise.

----

### 🔗 Useful references

- [Dart: Operators](https://dart.dev/language/operators)
- [Dart: Patterns](https://dart.dev/language/patterns)
- [Dart: Pattern types](https://dart.dev/language/pattern-types)
- [Dart: Branches](https://dart.dev/language/branches)
- [Dart: Loops](https://dart.dev/language/loops)
- [Dart: Records](https://dart.dev/language/records)
