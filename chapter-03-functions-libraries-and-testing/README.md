# Chapter 3 - Functions, Libraries, Packages, and Testing

This chapter explains how Dart code is organized and verified:

- functions: reusable blocks of logic
- libraries: Dart files that expose or hide code
- packages: reusable Dart projects with `pubspec.yaml`
- tests: automated checks that prove code works correctly

Main idea:

> Write small functions, organize them into clean libraries/packages, and protect them with tests.

---

## Contents

- [3.1. Functions in Dart](#31-functions-in-dart)
- [3.2. Creating and Importing Libraries](#32-creating-and-importing-libraries)
- [3.3. Testing Functions](#33-testing-functions)
- [3.4. Creating and Connecting Packages](#34-creating-and-connecting-packages)
- [Summary](#summary)
- [Key Takeaways](#key-takeaways)
- [Useful References](#useful-references)

---

## 3.1. Functions in Dart

A function is a reusable block of code that performs a specific task.

In Dart, functions are objects. This means a function can be:

- assigned to a variable
- passed as an argument to another function
- returned from another function
- stored in collections

```dart
int add(int a, int b) {
  return a + b;
}

void main() {
  print(add(10, 20)); // 30
}
```

### Required positional parameters

Required positional parameters must be passed in the correct order.

```dart
void greet(String name, int age) {
  print('Name: $name, Age: $age');
}

void main() {
  greet('Anna', 27);
}
```

### Optional positional parameters

Optional positional parameters are written inside square brackets `[]`.

```dart
void greet(String name, [String message = 'Welcome!']) {
  print('Hello, $name. $message');
}

void main() {
  greet('Anna');
  greet('Max', 'Good morning!');
}
```

If an optional positional parameter has no default value, it must be nullable.

```dart
void greet(String name, [String? message]) {
  print(message);
}
```

### Named parameters

Named parameters are written inside curly braces `{}`.

```dart
void createUser({required String name, int age = 18}) {
  print('Name: $name, Age: $age');
}

void main() {
  createUser(name: 'Anna');
  createUser(name: 'Max', age: 25);
}
```

Named parameters are optional by default. To make them required, use `required`.

```dart
void connect({required String host, required int port}) {
  print('Connecting to $host:$port');
}
```

Valid parameter combinations:

```dart
void example1(String name, int age) {}
void example2(String name, [int age = 18]) {}
void example3(String name, {int age = 18}) {}
```

Invalid combination:

```dart
// Error: optional positional and named parameters cannot be mixed.
void wrong(String name, [int age = 18], {String city = 'Dushanbe'}) {}
```

Default values must be compile-time constants.

### Scope

Scope defines where a variable can be accessed.

Dart has lexical scope. This means the structure of the code determines where variables are visible.

```dart
String globalMessage = 'Global message';

void main() {
  String mainMessage = 'Main message';

  void innerFunction() {
    String innerMessage = 'Inner message';

    print(globalMessage);
    print(mainMessage);
    print(innerMessage);
  }

  innerFunction();
}
```

Inner scopes can access outer variables, but outer scopes cannot access variables declared inside inner scopes.

### Function variables

Because functions are objects, they can be stored in variables.

```dart
int add(int a, int b) => a + b;

void main() {
  var operation = add;
  print(operation(5, 3)); // 8
}
```

Explicit function type:

```dart
int Function(int, int) operation = add;
```

### Function as an argument

A function can be passed into another function.

```dart
void calculate(int a, int b, void Function(int) callback) {
  final result = a + b;
  callback(result);
}

void printResult(int value) {
  print('Result: $value');
}

void main() {
  calculate(10, 20, printResult);
}
```

This is common in collections:

```dart
final numbers = [1, 2, 3, 4, 5, 6];
final evenNumbers = numbers.where((number) => number.isEven).toList();
```

### Type aliases

`typedef` creates a readable name for a type.

```dart
typedef Operation = int Function(int a, int b);

int add(int a, int b) => a + b;
int multiply(int a, int b) => a * b;

void calculate(int a, int b, Operation operation) {
  print(operation(a, b));
}
```

Type aliases are useful when a function type is long or used many times.

### Anonymous and arrow functions

An anonymous function is a function without a name.

It is usually written directly in the place where it is needed. This is useful when another function expects a small piece of behavior, but creating a separate named function would be unnecessary.

Main idea:

> Use an anonymous function when you need a short callback only once.

Basic syntax:

```dart
(parameters) {
  // function body
}
```

Example:

```dart
final numbers = [1, 2, 3];

numbers.forEach((number) {
  print(number);
});
```

Here, `(number) { print(number); }` is an anonymous function.

| Part | Meaning |
| :--- | :--- |
| `(number)` | Parameter list |
| `{ ... }` | Function body |
| No name | The function is used inline |

#### What problem does it solve?

Many Dart APIs expect a function as an argument.

For example, `where()` needs a rule that decides which items should remain in a collection. That rule can be passed as an anonymous function.

Without anonymous function:

```dart
bool isEven(int number) {
  return number.isEven;
}

void main() {
  final numbers = [1, 2, 3, 4, 5, 6];
  final evenNumbers = numbers.where(isEven).toList();

  print(evenNumbers); // [2, 4, 6]
}
```

With anonymous function:

```dart
void main() {
  final numbers = [1, 2, 3, 4, 5, 6];

  final evenNumbers = numbers.where((number) {
    return number.isEven;
  }).toList();

  print(evenNumbers); // [2, 4, 6]
}
```

The anonymous version keeps the rule close to the place where it is used.

#### Common use cases

Anonymous functions are common with collection methods.

| Method | Purpose | Example idea |
| :--- | :--- | :--- |
| `forEach` | Do something for each item | Print each number |
| `map` | Transform each item | Double each number |
| `where` | Filter items | Keep only even numbers |
| `sort` | Define custom order | Sort strings by length |
| `fold` | Combine values into one result | Calculate total sum |

Example with `map`:

```dart
void main() {
  final numbers = [1, 2, 3];

  final doubled = numbers.map((number) {
    return number * 2;
  }).toList();

  print(doubled); // [2, 4, 6]
}
```

Example with `where`:

```dart
void main() {
  final names = ['Anna', 'Bob', 'Alex', 'Max'];

  final result = names.where((name) {
    return name.startsWith('A');
  }).toList();

  print(result); // [Anna, Alex]
}
```

Example with `sort`:

```dart
void main() {
  final names = ['Max', 'Alexander', 'Anna'];

  names.sort((a, b) {
    return a.length.compareTo(b.length);
  });

  print(names); // [Max, Anna, Alexander]
}
```

Example with `fold`:

```dart
void main() {
  final numbers = [1, 2, 3, 4];

  final sum = numbers.fold(0, (total, number) {
    return total + number;
  });

  print(sum); // 10
}
```

#### Arrow functions

If an anonymous function contains only one expression, it can be written using arrow syntax `=>`.

Long form:

```dart
final doubled = numbers.map((number) {
  return number * 2;
}).toList();
```

Short arrow form:

```dart
final doubled = numbers.map((number) => number * 2).toList();
```

Arrow syntax can also be used with named functions.

```dart
int square(int number) => number * number;
```

Important rule:

> After `=>`, Dart expects one expression, not a block of statements.

Correct:

```dart
final evenNumbers = numbers.where((number) => number.isEven).toList();
```

Incorrect:

```dart
// Error
final evenNumbers = numbers.where((number) => {
  return number.isEven;
}).toList();
```

#### Anonymous function vs named function

| Use anonymous function when... | Use named function when... |
| :--- | :--- |
| The logic is short | The logic is long |
| The logic is used once | The logic is reused many times |
| The meaning is obvious from context | The function needs a clear name |
| It is a simple callback | You want to test it separately |

Good anonymous function:

```dart
final longNames = names.where((name) => name.length > 3).toList();
```

Better as a named function:

```dart
bool hasValidLength(String name) {
  return name.length >= 3 && name.length <= 20;
}

final validNames = names.where(hasValidLength).toList();
```

#### Anonymous functions can capture outer variables

Anonymous functions can use variables from the surrounding scope.

```dart
void main() {
  final minLength = 4;
  final names = ['Anna', 'Bob', 'Alexander'];

  final result = names.where((name) {
    return name.length >= minLength;
  }).toList();

  print(result); // [Anna, Alexander]
}
```

Here, the anonymous function uses `minLength` from the outer scope. This behavior is related to closures.

#### Tear-offs: when anonymous function is not needed

Sometimes an anonymous function only calls another function.

```dart
final names = ['Anna', 'Max', 'John'];

names.forEach((name) {
  print(name);
});
```

In this case, you can pass the function directly.

```dart
final names = ['Anna', 'Max', 'John'];

names.forEach(print);
```

This is called a function tear-off.

Use a tear-off when an existing function already matches the expected callback signature.

### Closures

A closure is a function that remembers variables from the scope where it was created.

This means a function can continue to use variables from an outer scope even after that outer function has finished executing.

Main idea:

> A closure is a function plus the environment it remembers.

Basic example:

```dart
int Function() makeCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

void main() {
  final counter = makeCounter();

  print(counter()); // 1
  print(counter()); // 2
  print(counter()); // 3
}
```

`makeCounter()` finishes, but the returned function still remembers `count`.

#### What problem do closures solve?

Closures solve this problem:

> I need a function that keeps some private state or remembers some configuration.

Without a closure, you often need a class just to store a small piece of state.

With a closure, the state can stay inside the function that created it.

```dart
int Function() createCounter(int startFrom) {
  var value = startFrom;

  return () {
    value++;
    return value;
  };
}

void main() {
  final counterA = createCounter(0);
  final counterB = createCounter(100);

  print(counterA()); // 1
  print(counterA()); // 2

  print(counterB()); // 101
  print(counterB()); // 102
}
```

Each counter has its own remembered `value`.

#### Closures as configured functions

A closure can remember configuration and use it later.

```dart
String Function(String) addPrefix(String prefix) {
  return (String text) {
    return '$prefix $text';
  };
}

void main() {
  final addError = addPrefix('Error:');
  final addWarning = addPrefix('Warning:');

  print(addError('File not found')); // Error: File not found
  print(addWarning('Low battery')); // Warning: Low battery
}
```

Here, each returned function remembers a different `prefix`.

#### Closures in callbacks

Closures are often used when a callback needs data from the surrounding scope.

```dart
void main() {
  final minSalary = 5000;
  final salaries = [2000, 5000, 8000, 12000];

  final highSalaries = salaries.where((salary) {
    return salary >= minSalary;
  }).toList();

  print(highSalaries); // [5000, 8000, 12000]
}
```

The anonymous function passed to `where()` remembers `minSalary`.

#### Closures capture variables, not only values

A closure can observe changes to a captured variable.

```dart
void main() {
  var multiplier = 2;

  final multiply = (int number) {
    return number * multiplier;
  };

  print(multiply(10)); // 20

  multiplier = 3;

  print(multiply(10)); // 30
}
```

The closure uses the current value of `multiplier` when it runs.

#### Closure vs anonymous function

| Concept | Meaning |
| :--- | :--- |
| Anonymous function | A function without a name |
| Closure | A function that captures variables from an outer scope |

An anonymous function can be a closure, but not every anonymous function captures something.

Not a closure in practice:

```dart
final square = (int number) => number * number;
```

Closure:

```dart
final factor = 10;
final multiply = (int number) => number * factor;
```

#### When to use closures

Closures are useful when:

- you need a small function with remembered state
- you want to create configured functions
- a callback needs variables from the surrounding scope
- you want to avoid creating a small class too early
- you want to keep some state private

Use a class instead when the state becomes complex, has many methods, or represents a real domain object.

### Recursion

Recursion is when a function calls itself.

Main idea:

> A recursive function solves a problem by reducing it to a smaller version of the same problem.

A recursive function should always have:

- base case - stops recursion
- recursive case - calls the function again with a smaller/simpler input

```dart
int factorial(int n) {
  if (n < 0) {
    throw ArgumentError('n must be non-negative');
  }

  if (n == 0 || n == 1) {
    return 1;
  }

  return n * factorial(n - 1);
}

void main() {
  print(factorial(5)); // 120
}
```

How it works:

```text
factorial(5)
5 * factorial(4)
5 * 4 * factorial(3)
5 * 4 * 3 * factorial(2)
5 * 4 * 3 * 2 * factorial(1)
5 * 4 * 3 * 2 * 1 = 120
```

#### Base case and recursive case

| Part | Example | Purpose |
| :--- | :--- | :--- |
| Base case | `if (n == 0 || n == 1) return 1;` | Stops recursion |
| Recursive case | `return n * factorial(n - 1);` | Continues with a smaller problem |

Without a base case, recursion can continue forever until the program crashes with a stack overflow.

#### Another simple example: sum from 1 to n

```dart
int sumTo(int n) {
  if (n <= 0) {
    return 0;
  }

  return n + sumTo(n - 1);
}

void main() {
  print(sumTo(5)); // 15
}
```

#### Recursion and the call stack

Each recursive call waits for the next call to finish.

```text
sumTo(3)
3 + sumTo(2)
3 + 2 + sumTo(1)
3 + 2 + 1 + sumTo(0)
3 + 2 + 1 + 0 = 6
```

This waiting chain is stored in the call stack.

If recursion goes too deep, the call stack can become too large.

#### Direct and indirect recursion

Direct recursion: a function calls itself.

```dart
void direct(int n) {
  if (n <= 0) return;
  direct(n - 1);
}
```

Indirect recursion: functions call each other.

```dart
void a(int n) {
  if (n <= 0) return;
  b(n - 1);
}

void b(int n) {
  if (n <= 0) return;
  a(n - 1);
}
```

#### Recursion with tree-like data

Recursion is especially useful for nested or tree-like structures.

```dart
class MenuItem {
  final String title;
  final List<MenuItem> children;

  MenuItem(this.title, [this.children = const []]);
}

void printMenu(MenuItem item, [int level = 0]) {
  final indent = '  ' * level;
  print('$indent- ${item.title}');

  for (final child in item.children) {
    printMenu(child, level + 1);
  }
}

void main() {
  final menu = MenuItem('Root', [
    MenuItem('Dashboard'),
    MenuItem('Settings', [
      MenuItem('Profile'),
      MenuItem('Security'),
    ]),
  ]);

  printMenu(menu);
}
```

This is a natural recursive problem because each menu item can contain other menu items.

#### Recursion vs loop

| Use recursion when... | Use a loop when... |
| :--- | :--- |
| The data is nested or tree-like | The data is flat and simple |
| The problem naturally splits into smaller similar problems | A simple `for` or `while` is easier |
| Readability improves | Recursion would be harder to follow |

Loop version of sum:

```dart
int sumToLoop(int n) {
  var result = 0;

  for (var i = 1; i <= n; i++) {
    result += i;
  }

  return result;
}
```

For simple numeric loops, the loop version is often easier and safer.

#### Common recursion mistakes

| Mistake | Problem |
| :--- | :--- |
| No base case | Infinite recursion |
| Input does not get smaller | Recursion never reaches the base case |
| Too much recursion depth | Possible stack overflow |
| Recursion used for simple loops | Code becomes harder than necessary |

### Generator functions

Generator functions produce a sequence of values.

They are useful when we do not want to create the whole collection at once.

Main idea:

> A generator gives values one by one, only when they are requested.

Dart has two main generator types:

| Generator type | Return type | Keyword | Used for |
| :--- | :--- | :--- | :--- |
| Synchronous generator | `Iterable<T>` | `sync*` | Normal lazy sequences |
| Asynchronous generator | `Stream<T>` | `async*` | Values that arrive over time |

#### Why generators are useful

Without a generator, we often create and return a full list.

```dart
List<int> countToList(int max) {
  final numbers = <int>[];

  for (var i = 1; i <= max; i++) {
    numbers.add(i);
  }

  return numbers;
}
```

This creates the entire list before the caller can use it.

With a generator:

```dart
Iterable<int> countTo(int max) sync* {
  for (var i = 1; i <= max; i++) {
    yield i;
  }
}
```

The values are produced lazily.

```dart
void main() {
  for (final number in countTo(3)) {
    print(number);
  }
}
```

Output:

```text
1
2
3
```

#### `sync*` and `yield`

A synchronous generator uses `sync*` and returns `Iterable<T>`.

```dart
Iterable<int> evenNumbersUpTo(int max) sync* {
  for (var i = 0; i <= max; i++) {
    if (i.isEven) {
      yield i;
    }
  }
}

void main() {
  print(evenNumbersUpTo(10).toList()); // [0, 2, 4, 6, 8, 10]
}
```

`yield` produces one value and then pauses the generator until the next value is requested.

#### Lazy evaluation

Generators are lazy. The body does not run until the iterable is actually used.

```dart
Iterable<int> numbers() sync* {
  print('Generator started');

  yield 1;
  print('After 1');

  yield 2;
  print('After 2');
}

void main() {
  final iterable = numbers();

  print('Before iteration');

  for (final value in iterable) {
    print('Value: $value');
  }
}
```

Possible output:

```text
Before iteration
Generator started
Value: 1
After 1
Value: 2
After 2
```

The generator starts only when the `for` loop begins.

#### `yield*`

`yield*` delegates generation to another iterable or generator.

```dart
Iterable<int> firstPart() sync* {
  yield 1;
  yield 2;
}

Iterable<int> secondPart() sync* {
  yield 3;
  yield 4;
}

Iterable<int> allNumbers() sync* {
  yield* firstPart();
  yield* secondPart();
}

void main() {
  print(allNumbers().toList()); // [1, 2, 3, 4]
}
```

Use `yield*` when one generator should include all values from another sequence.

#### Recursive generators

Generators work very well with recursion.

```dart
class MenuItem {
  final String title;
  final List<MenuItem> children;

  MenuItem(this.title, [this.children = const []]);
}

Iterable<String> flattenMenu(MenuItem item) sync* {
  yield item.title;

  for (final child in item.children) {
    yield* flattenMenu(child);
  }
}

void main() {
  final menu = MenuItem('Root', [
    MenuItem('Dashboard'),
    MenuItem('Settings', [
      MenuItem('Profile'),
      MenuItem('Security'),
    ]),
  ]);

  print(flattenMenu(menu).toList());
  // [Root, Dashboard, Settings, Profile, Security]
}
```

This is powerful because the function can walk through nested data and produce values one by one.

#### Infinite generators

Because generators are lazy, they can represent infinite sequences.

```dart
Iterable<int> naturalNumbers() sync* {
  var number = 1;

  while (true) {
    yield number;
    number++;
  }
}

void main() {
  final firstFive = naturalNumbers().take(5).toList();
  print(firstFive); // [1, 2, 3, 4, 5]
}
```

Important: never convert an infinite generator directly to a list without limiting it.

```dart
// Danger: this never ends.
// final allNumbers = naturalNumbers().toList();
```

#### `async*` and Stream

An asynchronous generator uses `async*` and returns `Stream<T>`.

It is useful when values arrive over time.

```dart
Stream<int> countWithDelay(int max) async* {
  for (var i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

Future<void> main() async {
  await for (final number in countWithDelay(3)) {
    print(number);
  }
}
```

`await for` listens to the stream and processes values as they arrive.

#### `yield*` with streams

`yield*` can also delegate to another stream inside an `async*` generator.

```dart
Stream<String> firstMessages() async* {
  yield 'Hello';
  yield 'How are you?';
}

Stream<String> secondMessages() async* {
  yield 'Goodbye';
}

Stream<String> allMessages() async* {
  yield* firstMessages();
  yield* secondMessages();
}
```

#### `yield` vs `return`

| Keyword | Meaning in a generator |
| :--- | :--- |
| `yield` | Produces one value and continues later |
| `yield*` | Produces all values from another sequence |
| `return` | Stops the generator |

Example:

```dart
Iterable<int> numbersUntilThree() sync* {
  yield 1;
  yield 2;
  return;
  // yield 3; // Unreachable
}
```

#### Generator vs List

| Use a generator when... | Use a list when... |
| :--- | :--- |
| Values can be produced one by one | You already have all values |
| The sequence may be large | The collection is small |
| You want lazy evaluation | You need random access by index |
| You may stop early | You need to store and reuse all values |

Example where generator is useful:

```dart
Iterable<int> findDivisors(int number) sync* {
  for (var i = 1; i <= number; i++) {
    if (number % i == 0) {
      yield i;
    }
  }
}

void main() {
  final divisors = findDivisors(28);
  print(divisors.toList()); // [1, 2, 4, 7, 14, 28]
}
```

#### Common generator mistakes

| Mistake | Problem |
| :--- | :--- |
| Forgetting `sync*` | You cannot use `yield` in a normal function |
| Returning `List<T>` from `sync*` | `sync*` should return `Iterable<T>` |
| Calling `toList()` too early | You lose laziness |
| Infinite generator without `take()` | Program may never finish |
| Using `async*` when values are not asynchronous | Adds unnecessary complexity |

---

## 3.2. Creating and Importing Libraries

A library is a unit of Dart code.

Important rule:

> Every Dart file is a library, even if it does not contain the `library` keyword.

Dart does not use `public`, `private`, or `protected` like Java/Kotlin. Instead, Dart uses `_` for library-private members.

```dart
int publicValue = 10;
int _privateValue = 20;
```

`_privateValue` is visible only inside the same library.

### Project structure: bin, lib, src, and test

A typical Dart project can look like this:

```text
conquest_functions/
  bin/
    main.dart
  lib/
    conquest_functions.dart
    src/
      my_math.dart
      my_str.dart
  test/
    my_functions_test.dart
  pubspec.yaml
  pubspec.lock
  README.md
```

| Directory/File | Purpose |
| :--- | :--- |
| `bin/` | Entry points for command-line apps. Usually contains `main.dart`. |
| `lib/` | Public library code of the package. Other packages can import files from here. |
| `lib/src/` | Internal implementation files. Users of your package should not import this directly. |
| `test/` | Test files. Usually files end with `_test.dart`. |
| `pubspec.yaml` | Project/package configuration: name, SDK, dependencies, dev dependencies. |
| `pubspec.lock` | Resolved dependency versions. |

### bin

`bin/` is usually used for runnable programs.

```dart
// bin/main.dart
import 'package:conquest_functions/conquest_functions.dart';

void main() {
  print(add(2, 3));
}
```

Run:

```bash
dart run
```

or:

```bash
dart run bin/main.dart
```

### lib and src

`lib/` contains code that belongs to the package. Files directly inside `lib/` are usually public API files.

```dart
// lib/conquest_functions.dart
export 'src/my_math.dart';
export 'src/my_str.dart';
```

`lib/src/` is for internal implementation.

```dart
// lib/src/my_math.dart
int add(int a, int b) => a + b;
int sub(int a, int b) => a - b;
int mul(int a, int b) => a * b;
```

Avoid this in external packages:

```dart
import 'package:conquest_functions/src/my_math.dart';
```

Prefer this:

```dart
import 'package:conquest_functions/conquest_functions.dart';
```

### Importing Dart files

`import` allows one Dart file to use code from another library.

| Import style | Example | When to use |
| :--- | :--- | :--- |
| SDK library | `import 'dart:math';` | Built-in Dart libraries |
| Package import | `import 'package:test/test.dart';` | Code from packages |
| Relative import | `import 'src/my_math.dart';` | Files inside the same package |

Import from Dart SDK:

```dart
import 'dart:math';

void main() {
  print(max(10, 20));
}
```

`dart:core` is imported automatically, so `String`, `int`, `List`, `Map`, and `print` are available without import.

Import with prefix:

```dart
import 'dart:math' as math;

void main() {
  print(math.max(10, 20));
}
```

Use `as` when two libraries have conflicting names or when you want a clearer namespace.

### Exporting public API

`export` re-exports code from another file.

Instead of forcing users to import many files:

```dart
import 'package:conquest_functions/src/my_math.dart';
import 'package:conquest_functions/src/my_str.dart';
```

Create one public API file:

```dart
// lib/conquest_functions.dart
export 'src/my_math.dart';
export 'src/my_str.dart';
```

Now users write one clean import:

```dart
import 'package:conquest_functions/conquest_functions.dart';
```

Why `export` is useful:

| Without export | With export |
| :--- | :--- |
| Many imports in user code | One clean import |
| Internal structure is exposed | Internal structure is hidden |
| Harder to refactor | Easier to refactor |

### show and hide

`show` and `hide` allow importing or exporting only part of a library.

`show` imports only selected names:

```dart
import 'dart:math' show max;

void main() {
  print(max(10, 20));
  // print(min(10, 20)); // Error
}
```

`hide` imports everything except selected names:

```dart
import 'dart:math' hide Random;

void main() {
  print(max(10, 20));
  // final random = Random(); // Error
}
```

They also work with `export`:

```dart
// lib/conquest_functions.dart
export 'src/my_math.dart' show add, sub, mul;
export 'src/my_str.dart' show toUpper, toLower;
```

This means only these names become public through `conquest_functions.dart`.

### Deferred imports

A deferred import loads a library only when it is needed.

```dart
import 'package:greetings/hello.dart' deferred as hello;

Future<void> greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
```

Deferred loading is mainly useful for web apps when some code is rarely used and should not increase initial startup size. For normal beginner CLI apps, deferred imports are usually not needed.

---

## 3.3. Testing Functions

Testing means checking that your code works as expected.

Instead of manually running the program and looking at printed output, we write tests that automatically verify the result.

```dart
expect(add(2, 3), equals(5));
```

This means: I expect `add(2, 3)` to return `5`.

If the result is `5`, the test passes. If the result is different, the test fails.

### Why tests are useful

Tests help us:

- catch bugs earlier
- change code with more confidence
- document expected behavior
- protect code from regressions
- make functions easier to design

Manual check:

```dart
void main() {
  print(add(2, 3)); // You look at the console manually.
}
```

Automated test:

```dart
test('add returns sum of two numbers', () {
  expect(add(2, 3), equals(5));
});
```

### Installing the test package

Add `test` as a dev dependency:

```bash
dart pub add dev:test
```

This updates `pubspec.yaml`:

```yaml
dev_dependencies:
  test: ^1.31.1
```

The exact version can be different. Pub chooses a compatible version.

Import it in test files:

```dart
import 'package:test/test.dart';
```

### Writing tests

Test files usually live in the `test/` directory and end with `_test.dart`.

Source code:

```dart
// lib/src/my_math.dart
int add(int a, int b) => a + b;
int sub(int a, int b) => a - b;
int mul(int a, int b) => a * b;

int powInt(int base, int exponent) {
  var result = 1;

  for (var i = 0; i < exponent; i++) {
    result *= base;
  }

  return result;
}
```

Test file:

```dart
// test/my_functions_test.dart
import 'package:test/test.dart';
import 'package:conquest_functions/conquest_functions.dart';

void main() {
  test('Check addition', () {
    expect(add(2, 3), equals(5));
  });

  test('Check subtraction', () {
    expect(sub(2, 3), equals(-1));
  });

  test('Check multiplication', () {
    expect(mul(2, 3), equals(6));
  });

  test('Check power', () {
    expect(powInt(2, 3), equals(8));
  });
}
```

Basic testing structure:

```dart
test('description', () {
  expect(actualValue, matcher);
});
```

| Part | Meaning |
| :--- | :--- |
| `test()` | Defines one test case |
| `description` | Human-readable test name |
| `expect()` | Checks actual result |
| `equals()` | Matcher for expected value |

Common matchers:

| Matcher | Meaning |
| :--- | :--- |
| `equals(value)` | Must be equal to `value` |
| `isTrue` | Must be `true` |
| `isFalse` | Must be `false` |
| `isNull` | Must be `null` |
| `isNotNull` | Must not be `null` |
| `throwsA(...)` | Must throw an error/exception |

Example with `throwsA`:

```dart
int divide(int a, int b) {
  if (b == 0) {
    throw ArgumentError('b must not be zero');
  }

  return a ~/ b;
}

void main() {
  test('divide throws when b is zero', () {
    expect(() => divide(10, 0), throwsA(isA<ArgumentError>()));
  });
}
```

For errors, pass a function to `expect`: `() => divide(10, 0)`.

### Grouping tests

`group()` organizes related tests.

```dart
void main() {
  group('Arithmetic operations', () {
    test('Check addition', () {
      expect(add(2, 3), equals(5));
    });

    test('Check subtraction', () {
      expect(sub(2, 3), equals(-1));
    });
  });

  group('String manipulations', () {
    test('String to lower case', () {
      expect('HELLO'.toLowerCase(), equals('hello'));
    });
  });
}
```

Grouping makes output easier to read and allows shared setup inside a group.

### setUp and tearDown

`setUp()` runs before each test in the current group or file. `tearDown()` runs after each test.

```dart
void main() {
  group('Arithmetic operations', () {
    late int a;
    late int b;

    setUp(() {
      a = 2;
      b = 3;
    });

    test('Check addition', () {
      expect(add(a, b), equals(5));
    });
  });
}
```

Use `tearDown()` when tests need cleanup: close files, close servers, clear temporary data, reset global state, or close connections.

```dart
import 'dart:io';
import 'package:test/test.dart';

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('my_test_');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('temporary directory exists', () async {
    expect(await tempDir.exists(), isTrue);
  });
}
```

| Function | Runs |
| :--- | :--- |
| `setUp()` | Before each test |
| `tearDown()` | After each test |
| `setUpAll()` | Once before all tests in the group/file |
| `tearDownAll()` | Once after all tests in the group/file |

### Skipping tests

Skip one test:

```dart
test(
  'Check power',
  () {
    expect(powInt(2, 3), equals(8));
  },
  skip: 'Power function is not implemented yet',
);
```

Skip a group:

```dart
group(
  'String manipulations',
  () {
    test('String to lower case', () {
      expect('HELLO'.toLowerCase(), equals('hello'));
    });
  },
  skip: 'String manipulation tests are currently skipped',
);
```

| Syntax | Meaning |
| :--- | :--- |
| `skip: true` | Skip without a detailed reason |
| `skip: 'reason'` | Skip and print the reason |

It is better to write a reason.

### Tags

Tags are labels for tests. They help run only a subset of tests.

```dart
void main() {
  test(
    'fast unit test',
    () {
      expect(2 + 2, equals(4));
    },
    tags: ['unit', 'fast'],
  );

  test(
    'slow integration test',
    () {
      expect(true, isTrue);
    },
    tags: ['integration', 'slow'],
  );
}
```

Run only tests with the `unit` tag:

```bash
dart test -t unit
```

Exclude slow tests:

```bash
dart test -x slow
```

Run tests using a boolean tag expression:

```bash
dart test -t "unit && !slow"
```

Tags can also be used on groups.

Optional `dart_test.yaml` example:

```yaml
# dart_test.yaml
tags:
  slow:
    timeout: 2x
```

### onPlatform

`onPlatform` allows different test behavior for different platforms.

```dart
import 'package:test/test.dart';

void main() {
  test(
    'platform-specific test',
    () {
      expect(true, isTrue);
    },
    onPlatform: {
      'windows': Skip('Temporarily skipped on Windows'),
    },
  );
}
```

Another example:

```dart
test(
  'slow browser test',
  () async {
    await Future.delayed(Duration(seconds: 1));
    expect(true, isTrue);
  },
  onPlatform: {
    'chrome': Timeout.factor(2),
    'safari': Skip('Safari is currently not supported'),
  },
);
```

Common platform selectors:

| Selector | Meaning |
| :--- | :--- |
| `vm` | Dart VM |
| `chrome` | Google Chrome |
| `firefox` | Firefox |
| `safari` | Safari |
| `browser` | Any browser |
| `windows` | Windows |
| `mac-os` | macOS |
| `linux` | Linux |
| `posix` | POSIX systems, usually not Windows |

You can restrict a whole test file using `@TestOn`.

```dart
@TestOn('vm')

import 'package:test/test.dart';

void main() {
  test('runs only on Dart VM', () {
    expect(true, isTrue);
  });
}
```

### Running tests

Run all tests in the `test/` directory:

```bash
dart test
```

Run one file:

```bash
dart test test/my_functions_test.dart
```

Run tests by name:

```bash
dart test -n "Check addition"
```

Run tests with a tag:

```bash
dart test -t unit
```

Exclude tests with a tag:

```bash
dart test -x slow
```

Run tests on a specific platform:

```bash
dart test -p vm
```

Show expanded output:

```bash
dart test --reporter expanded
```

Collect coverage:

```bash
dart run test --coverage-path=coverage/lcov.info
```

`dart test` automatically looks for `*_test.dart` files inside the `test/` directory.

---

## 3.4. Creating and Connecting Packages

A package is a reusable Dart project. The key file is `pubspec.yaml`.

A package can contain:

- libraries
- command-line apps
- tests
- examples
- documentation
- dependencies

### Package vs library

| Concept | Meaning |
| :--- | :--- |
| Library | One Dart file and its parts. It controls imports and privacy. |
| Package | A project with `pubspec.yaml`. It can contain many libraries. |

A package can have many library files:

```text
lib/
  conquest_functions.dart
  calc.dart
  src/
    my_math.dart
    my_str.dart
```

Each `.dart` file is a library, but the whole project is a package.

### Creating a package

Create a reusable Dart package:

```bash
dart create -t package my_math_package
```

Example structure:

```text
my_math_package/
  lib/
    my_math_package.dart
  test/
    my_math_package_test.dart
  pubspec.yaml
  README.md
```

Add code:

```dart
// lib/my_math_package.dart
int add(int a, int b) => a + b;
```

Test it:

```dart
// test/my_math_package_test.dart
import 'package:test/test.dart';
import 'package:my_math_package/my_math_package.dart';

void main() {
  test('add returns sum', () {
    expect(add(2, 3), equals(5));
  });
}
```

### Connecting a local package

During development, you can connect one local package to another using a path dependency.

```text
dart_workspace/
  my_app/
  my_math_package/
```

In `my_app/pubspec.yaml`:

```yaml
dependencies:
  my_math_package:
    path: ../my_math_package
```

Then run:

```bash
dart pub get
```

Use it in `my_app`:

```dart
import 'package:my_math_package/my_math_package.dart';

void main() {
  print(add(2, 3));
}
```

Path dependencies are great for local development, but they are not suitable for publishing to pub.dev because other users do not have your local file path.

### Connecting a remote package

From pub.dev:

```bash
dart pub add http
```

This updates `pubspec.yaml`:

```yaml
dependencies:
  http: ^1.0.0
```

Then import it:

```dart
import 'package:http/http.dart' as http;
```

From Git:

```yaml
dependencies:
  my_math_package:
    git:
      url: https://github.com/example/my_math_package.git
      ref: main
```

After changing `pubspec.yaml`, run:

```bash
dart pub get
```

---

## Summary

| Concept | Meaning |
| :--- | :--- |
| Function | Reusable block of code that performs a task |
| Required positional parameters | Parameters that must be passed in order |
| Optional positional parameters | Optional parameters written inside `[]` |
| Named parameters | Parameters written inside `{}` and called by name |
| `required` | Makes a named parameter required |
| Scope | Area where a variable is visible |
| Callback | A function passed to another function |
| `typedef` | A readable name for a complex type |
| Anonymous function | Function without a name, usually used inline as a short callback |
| Arrow function | Compact syntax for a function with one expression |
| Tear-off | Passing an existing function directly instead of wrapping it in an anonymous function |
| Closure | Function that remembers variables from outer scope |
| Recursion | Function calling itself with a smaller version of the same problem |
| Base case | Condition that stops recursion |
| Recursive case | Part that continues recursion |
| Generator function | Function that produces a sequence of values lazily |
| `sync*` | Creates a synchronous generator that returns `Iterable<T>` |
| `async*` | Creates an asynchronous generator that returns `Stream<T>` |
| `yield` | Produces one value from a generator |
| `yield*` | Delegates generation to another iterable or stream |
| Library | A Dart file and its parts; a unit of privacy |
| Package | A Dart project with `pubspec.yaml` |
| `bin/` | Runnable app entry points |
| `lib/` | Public package library code |
| `lib/src/` | Internal implementation files |
| `test/` | Automated tests |
| `import` | Brings code from another library into current file |
| `export` | Re-exports code as part of a public API |
| `show` | Imports/exports only selected names |
| `hide` | Imports/exports everything except selected names |
| `deferred as` | Lazy-loads a library when needed |
| `test()` | Defines one test case |
| `expect()` | Checks actual result against expected matcher |
| `group()` | Groups related tests |
| `setUp()` | Runs before each test |
| `tearDown()` | Runs after each test |
| `skip` | Temporarily disables a test or group |
| `tags` | Labels tests for filtering/configuration |
| `onPlatform` | Applies platform-specific test configuration |

---

## Key Takeaways

- Dart functions are objects.
- Required positional parameters must be passed in the correct order.
- Optional positional parameters use `[]`.
- Named parameters use `{}`.
- Named parameters are optional by default unless marked with `required`.
- Functions can be assigned to variables and passed as arguments.
- `typedef` makes complex function types easier to read.
- Anonymous functions are useful for short one-time callbacks.
- Arrow functions are best for short one-expression logic.
- Use named functions when logic is complex, reused, or should be tested separately.
- Use tear-offs when an existing function already matches the expected callback signature.
- Closures can remember variables from outer scopes.
- Closures are useful for private state, configured functions, and callbacks that need surrounding variables.
- Recursion needs a base case and a recursive case.
- Recursion is useful for nested or tree-like data, but simple loops are often better for flat data.
- Generator functions can produce values lazily using `yield`.
- `sync*` returns `Iterable<T>` and is used for normal lazy sequences.
- `async*` returns `Stream<T>` and is used for values that arrive over time.
- `yield*` is useful when one generator delegates to another sequence.
- Do not call `toList()` too early if you want to keep generator laziness.
- Every Dart file is a library.
- Identifiers that start with `_` are library-private.
- `lib/src/` is for internal implementation files.
- Use `export` to create a clean public API.
- Use `show` and `hide` to control imported/exported names.
- Use `test`, `expect`, and matchers to verify behavior automatically.
- Use `group` to organize tests.
- Use `setUp` and `tearDown` when tests need shared preparation or cleanup.
- Use `skip` only with a clear reason.
- Use `tags` to run only selected groups of tests.
- Use `onPlatform` for platform-specific skips or timeouts.
- A package is connected to a project through `pubspec.yaml`.

---

## Useful References

- [Dart documentation - Functions](https://dart.dev/language/functions)
- [Dart documentation - Libraries and imports](https://dart.dev/language/libraries)
- [Dart documentation - Package layout conventions](https://dart.dev/tools/pub/package-layout)
- [Dart documentation - Package dependencies](https://dart.dev/tools/pub/dependencies)
- [Dart documentation - dart create](https://dart.dev/tools/dart-create)
- [Dart documentation - dart pub add](https://dart.dev/tools/pub/cmd/pub-add)
- [package:test](https://pub.dev/packages/test)
