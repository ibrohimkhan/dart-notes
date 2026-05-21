# Anonymous Functions Draft

An anonymous function is a function without a name.

It is usually written directly in the place where it is needed. This is useful when another function expects a small piece of behavior, but creating a separate named function would be too much.

```dart
final numbers = [1, 2, 3];

numbers.forEach((number) {
  print(number);
});
```

Use anonymous functions when the logic is short, used once, and clearer near the call site.

```dart
final evenNumbers = numbers.where((number) => number.isEven).toList();
```

Use a named function when the logic is complex or reused.
