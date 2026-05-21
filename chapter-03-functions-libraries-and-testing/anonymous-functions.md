# Anonymous Functions in Dart

An anonymous function is a function without a name.

It is usually written directly in the place where it is needed. This is useful when another function expects a small piece of behavior, but creating a separate named function would be too much.

Main idea:

> Use an anonymous function when you need a short callback only once.

---

## Basic syntax

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

---

## What problem does it solve?

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

---

## Common use cases

Anonymous functions are common with collection methods.

| Method | Purpose | Example idea |
| :--- | :--- | :--- |
| `forEach` | Do something for each item | Print each number |
| `map` | Transform each item | Double each number |
| `where` | Filter items | Keep only even numbers |
| `sort` | Define custom order | Sort strings by length |
| `fold` | Combine values into one result | Calculate total sum |

### `map`

`map()` transforms each item into another value.

```dart
void main() {
  final numbers = [1, 2, 3];

  final doubled = numbers.map((number) {
    return number * 2;
  }).toList();

  print(doubled); // [2, 4, 6]
}
```

### `where`

`where()` filters items.

```dart
void main() {
  final names = ['Anna', 'Bob', 'Alex', 'Max'];

  final result = names.where((name) {
    return name.startsWith('A');
  }).toList();

  print(result); // [Anna, Alex]
}
```

### `sort`

`sort()` can accept a comparison function.

```dart
void main() {
  final names = ['Max', 'Alexander', 'Anna'];

  names.sort((a, b) {
    return a.length.compareTo(b.length);
  });

  print(names); // [Max, Anna, Alexander]
}
```

### `fold`

`fold()` combines all values into one result.

```dart
void main() {
  final numbers = [1, 2, 3, 4];

  final sum = numbers.fold(0, (total, number) {
    return total + number;
  });

  print(sum); // 10
}
```

---

## Arrow functions

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

---

## Anonymous function vs named function

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

---

## Capturing outer variables

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

Here, the anonymous function uses `minLength` from the outer scope.

This behavior is related to closures.

---

## Tear-offs: when anonymous function is not needed

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

---

## Key Takeaways

- Anonymous functions are functions without names.
- They are usually used as short callbacks.
- They are common with `forEach`, `map`, `where`, `sort`, and `fold`.
- Arrow functions are shorter versions for one-expression logic.
- Use named functions when logic is long, reused, or should be tested separately.
- Anonymous functions can capture variables from the outer scope.
- If an anonymous function only calls another function, consider using a tear-off.
