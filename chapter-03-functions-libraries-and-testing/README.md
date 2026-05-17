# Chapter 3 — Functions, Libraries, and Testing

## 🧩 Functions in Dart

A function is a reusable block of code that performs a specific task.

In Dart, functions are **objects**. This means a function can be:

- assigned to a variable
- passed as an argument to another function
- returned from another function
- stored in collections

Functions help make code more readable, reusable, and easier to test.

---

## 📚 Contents

- [3.1.1. Declaring Function Parameters](#311-declaring-function-parameters)
- [3.1.2. Optional Parameters and Default Values](#312-optional-parameters-and-default-values)
- [3.1.3. Variable Scope](#313-variable-scope)
- [3.1.4. Calling a Function Through a Variable](#314-calling-a-function-through-a-variable)
- [3.1.5. Function as an Argument of Another Function](#315-function-as-an-argument-of-another-function)
- [3.1.6. Type Aliases](#316-type-aliases)
- [3.1.7. Anonymous and Arrow Functions](#317-anonymous-and-arrow-functions)
- [3.1.8. Closures](#318-closures)
- [3.1.9. Recursion](#319-recursion)
- [3.1.10. Generator Functions](#3110-generator-functions)
- [Summary](#-summary)

---

## 3.1.1. Declaring Function Parameters

A basic function usually has:

- a return type
- a function name
- parameters
- a function body

```dart
int add(int a, int b) {
  return a + b;
}

void main() {
  print(add(10, 20)); // 30
}
```

In this example:

- `int` is the return type
- `add` is the function name
- `int a` and `int b` are parameters
- `return a + b;` returns the result

### Required positional parameters

The most basic parameters in Dart are **required positional parameters**.

```dart
void greet(String name, int age) {
  print('Name: $name, Age: $age');
}

void main() {
  greet('Anna', 27);
}
```

Required positional parameters have two important rules:

- they must be passed
- their order matters

```dart
greet('Anna', 27); // OK
// greet(27, 'Anna'); // Error: wrong argument order
```

---

## 3.1.2. Optional Parameters and Default Values

Dart supports two main kinds of optional parameters:

| Parameter type | Syntax | Example |
| :--- | :--- | :--- |
| Optional positional | `[]` | `void greet(String name, [String? message])` |
| Named | `{}` | `void createUser({required String name})` |

> 💡 A function can use required positional parameters with optional positional parameters, or required positional parameters with named parameters. However, optional positional parameters and named parameters cannot be mixed in the same function signature.

---

### Optional positional parameters

Optional positional parameters are written inside square brackets `[]`.

```dart
void greet(String name, [String? message]) {
  print('Hello, $name');

  if (message != null) {
    print(message);
  }
}

void main() {
  greet('Anna');
  greet('Anna', 'Welcome back!');
}
```

If an optional parameter has no default value, its value is `null`. That is why `message` is declared as `String?`.

---

### Optional positional parameters with default values

Optional parameters can have default values.

```dart
void greet(String name, [String message = 'Welcome!']) {
  print('Hello, $name. $message');
}

void main() {
  greet('Anna'); // Hello, Anna. Welcome!
  greet('Max', 'Good morning!'); // Hello, Max. Good morning!
}
```

If the second argument is not passed, Dart uses the default value.

---

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

Named parameters make function calls easier to read because the argument names are visible at the call site.

```dart
createUser(name: 'Anna', age: 27);
```

This is especially useful when a function has many parameters.

---

### Required named parameters

Named parameters are optional by default. To make a named parameter required, use the `required` keyword.

```dart
void connect({required String host, required int port}) {
  print('Connecting to $host:$port');
}

void main() {
  connect(host: 'localhost', port: 5432);
}
```

Without `required`, a named parameter must either be nullable or have a default value.

```dart
void example({String? name, int age = 18}) {
  print('$name $age');
}
```

---

### Important parameter rules

Valid examples:

```dart
// Required positional parameters only
void example1(String name, int age) {}

// Required positional + optional positional
void example2(String name, [int age = 18]) {}

// Required positional + named parameters
void example3(String name, {int age = 18}) {}
```

Invalid example:

```dart
// Error: optional positional and named parameters cannot be mixed
void wrong(String name, [int age = 18], {String city = 'Dushanbe'}) {}
```

Default values must be compile-time constants.

```dart
void printMessage([String message = 'Hello']) {
  print(message);
}
```

---

## 3.1.3. Variable Scope

Scope defines where a variable can be accessed.

Dart has **lexical scope**. This means that the structure of the code determines where variables are visible.

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

The inner function can access variables from outer scopes.

However, outer scopes cannot access variables declared inside inner scopes.

```dart
void main() {
  void innerFunction() {
    String message = 'Hello';
  }

  // print(message); // Error: message is not visible here
}
```

> 💡 Inner scopes can see outer variables, but outer scopes cannot see inner variables.

---

## 3.1.4. Calling a Function Through a Variable

Because functions are objects, a function can be assigned to a variable.

```dart
int add(int a, int b) {
  return a + b;
}

void main() {
  var operation = add;

  print(operation(5, 3)); // 8
}
```

Dart understands that `operation` stores a function.

For better readability, an explicit function type can be used.

```dart
int add(int a, int b) => a + b;

void main() {
  int Function(int, int) operation = add;

  print(operation(10, 5)); // 15
}
```

The type `int Function(int, int)` means:

- the function returns `int`
- the function accepts two `int` arguments

---

## 3.1.5. Function as an Argument of Another Function

A function can be passed as an argument to another function.

```dart
void printResult(int value) {
  print('Result: $value');
}

void calculate(int a, int b, void Function(int) callback) {
  final result = a + b;
  callback(result);
}

void main() {
  calculate(10, 20, printResult);
}
```

Here, `printResult` is passed into `calculate` as a callback function.

This idea is common in Dart collections.

```dart
void main() {
  final numbers = [1, 2, 3, 4];

  numbers.forEach(print);
}
```

In this example, `print` is passed to `forEach` as a function argument.

Another example with `where`:

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

---

## 3.1.6. Type Aliases

A type alias gives another name to an existing type.

For function types, Dart commonly uses `typedef`.

```dart
typedef Operation = int Function(int a, int b);

int add(int a, int b) => a + b;
int multiply(int a, int b) => a * b;

void calculate(int a, int b, Operation operation) {
  print(operation(a, b));
}

void main() {
  calculate(5, 3, add);      // 8
  calculate(5, 3, multiply); // 15
}
```

Without `typedef`, the function type can be harder to read.

```dart
void calculate(int a, int b, int Function(int, int) operation) {
  print(operation(a, b));
}
```

With `typedef`, the code is cleaner.

```dart
typedef Operation = int Function(int, int);

void calculate(int a, int b, Operation operation) {
  print(operation(a, b));
}
```

Type aliases are useful when:

- a function type is long
- the same type is used many times
- we want to make code more expressive

---

## 3.1.7. Anonymous and Arrow Functions

### Anonymous functions

An anonymous function is a function without a name.

```dart
void main() {
  final numbers = [1, 2, 3];

  numbers.forEach((number) {
    print(number);
  });
}
```

Anonymous functions are often used with collection methods such as:

- `forEach`
- `map`
- `where`
- `reduce`
- `fold`

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

---

### Arrow functions

If a function contains only one expression, it can be written using arrow syntax `=>`.

```dart
int square(int number) => number * number;
```

This is the same as:

```dart
int square(int number) {
  return number * number;
}
```

Arrow functions are very common with collections.

```dart
void main() {
  final numbers = [1, 2, 3];

  final doubled = numbers.map((number) => number * 2).toList();

  print(doubled); // [2, 4, 6]
}
```

> 💡 After `=>`, Dart expects a single expression, not a block of statements.

Correct:

```dart
int add(int a, int b) => a + b;
```

Incorrect:

```dart
// Error
int add(int a, int b) => {
  return a + b;
};
```

---

## 3.1.8. Closures

A closure is a function that remembers variables from the scope where it was created.

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

Even after `makeCounter()` finishes, the returned function still remembers the variable `count`.

Closures are useful when we need to keep private internal state.

Another example:

```dart
String Function(String) addPrefix(String prefix) {
  return (String text) => '$prefix $text';
}

void main() {
  final addError = addPrefix('Error:');

  print(addError('File not found')); // Error: File not found
}
```

Here, the returned anonymous function remembers the `prefix` variable.

---

## 3.1.9. Recursion

Recursion is when a function calls itself.

A recursive function should always have:

- a base case
- a recursive case

The base case stops the recursion. Without it, the function may call itself forever.

Example: factorial.

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

Another example: sum of numbers from `1` to `n`.

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

> 💡 Recursion is useful when a problem can be divided into smaller versions of the same problem.

---

## 3.1.10. Generator Functions

Generator functions produce a sequence of values.

Dart has two main generator types:

| Generator type | Return type | Keyword |
| :--- | :--- | :--- |
| Synchronous generator | `Iterable<T>` | `sync*` |
| Asynchronous generator | `Stream<T>` | `async*` |

---

### Synchronous generator

A synchronous generator returns an `Iterable`.

```dart
Iterable<int> countTo(int max) sync* {
  for (var i = 1; i <= max; i++) {
    yield i;
  }
}

void main() {
  final numbers = countTo(5);

  for (final number in numbers) {
    print(number);
  }
}
```

Output:

```text
1
2
3
4
5
```

The `yield` keyword produces one value at a time.

---

### Asynchronous generator

An asynchronous generator returns a `Stream`.

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

Output:

```text
1
2
3
```

Each value is produced asynchronously.

---

### `yield*`

The `yield*` keyword delegates generation to another generator or iterable.

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

`yield*` is useful when one generator needs to include values from another generator.

---

## ✅ Summary

| Concept | Meaning |
| :--- | :--- |
| Function | Reusable block of code that performs a task |
| Required positional parameters | Parameters that must be passed in order |
| Optional positional parameters | Optional parameters written inside `[]` |
| Named parameters | Parameters written inside `{}` and called by name |
| `required` | Makes a named parameter required |
| Default values | Values used when an argument is not provided |
| Scope | Area where a variable is visible |
| Function variable | A variable that stores a function |
| Callback | A function passed to another function |
| Type alias | A readable name for a complex type |
| Anonymous function | Function without a name |
| Arrow function | Short syntax for one-expression functions |
| Closure | Function that remembers variables from outer scope |
| Recursion | Function calling itself |
| Generator function | Function that produces a sequence of values |
| `sync*` | Creates a synchronous generator that returns `Iterable<T>` |
| `async*` | Creates an asynchronous generator that returns `Stream<T>` |
| `yield` | Produces a value from a generator |
| `yield*` | Delegates generation to another generator or iterable |

---

## 🧠 Key Takeaways

- Dart functions are objects.
- Required positional parameters must be passed in the correct order.
- Optional positional parameters use `[]`.
- Named parameters use `{}`.
- Named parameters are optional by default unless marked with `required`.
- Default parameter values must be compile-time constants.
- Functions can be assigned to variables and passed as arguments.
- `typedef` makes complex function types easier to read.
- Anonymous functions are useful for short callbacks.
- Arrow functions are used for one-expression functions.
- Closures can remember variables from outer scopes.
- Recursion needs a base case.
- Generator functions can produce values lazily using `yield`.

---

## 🔗 Useful References

- [Dart documentation — Functions](https://dart.dev/language/functions)
- [Dart documentation — Typedefs](https://dart.dev/language/typedefs)
- [Dart documentation — Creating streams](https://dart.dev/libraries/async/creating-streams)
