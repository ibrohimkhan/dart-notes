# Chapter 1 — Introduction to Dart

## ⚡ Blitz Overview

### 🧩 What is Dart?

Dart is:
- an object-oriented programming language (OOP)
- similar to C/C++, Java/Kotlin, and C#
- null-safe by design
- single-threaded, but uses **isolates** with no shared memory and communication via messages

---

### ⚙️ Key Features

- Virtual Machine (Dart VM)
- Garbage Collector
- JIT (Just-In-Time) compilation — enables hot reload in Flutter
- AOT (Ahead-Of-Time) compilation — optimized production builds
- Web support via `dartdevc` and `dart2js`

---

### 📦 Package Management

Dart uses **pub** as a package manager.

Dependencies are defined in the `pubspec.yaml` file.

---

### 🚀 Entry Point

Every Dart application starts from the `main` function:

```dart
void main() {
  print('Hello world!');
}
```

---

### 🏷️ Naming Conventions
- `lowerCamelCase` — variables, functions, and methods
- `UpperCamelCase` — classes
- Names cannot start with digits
- Dart is case-sensitive: `name` and `NAME` are different identifiers
- Names starting with `_` are private to the library

---

### 📊 Built-in Data Types

Dart provides a rich set of built-in types:
- `num`, `int`, `double`
- `String`
- `Runes`
- `Symbol`
- `bool`
- `List`
- `Set`
- `Map`
- `Record`
- `Null`

All of these types are objects in Dart.

---

### 🔢 Numbers
`num` is a base type for `int` and `double`. Both types are 64-bit.

Examples:

```dart
int a = 10;
var b = 20;

double c = 3.5;
var d = 4.5;
```

`var` is a Dart keyword. It means the variable type is inferred by the compiler. 

Dart uses static typing, so this will cause error:
```dart
int a = 5;
a = 5.7;  // ❌ Error: double can't be assigned int.
```

Valid assignments:
```dart
double b = 3.2;
b = 3; // becomes 3.0

num a = 5.7;
a = 5; // becomes 5
```

## Operations with numbers
```dart
void main() {
  print((-3).abs());  // 3
  print(5.5.round()); // 6
  print(5.4.round()); // 5
  print(5.5.floor()); // 5
  print(5.5.ceil());  // 6
  print(5.5.toInt()); // 5

  print(3.isEven); // false
  print(4.isEven); // true

  print(3.isOdd); // true
  print(4.isOdd); // false

  print(4.isNegative);    // false
  print((-4).isNegative); // true
}
```

### 🔤 String

A `String` is a sequence of UTF-16 code units. In Dart, you can use single or double quotes. 
```dart
String name = 'Bob';
var city = "Dushanbe";
```

You can access characters by index:
```dart
var city = 'Dushanbe';
print("${city[0]}${city[1]}"); // Du
```

> Note: Accessing by index returns a single-character string.

#### 💡 String Interpolation

String interpolation allows you to insert variables or expressions directly into a string.
```dart
var name = 'Bob';

print('Hello $name');                   // Hello Bob
print('Name length: ${name.length}');   // Name length: 3
```

#### 🔒 Immutability

`String` is an immutble data type, so it cannot be changed: 
```dart
var name = 'bob';
name[0] = 'B'; ❌ // Error: The operator '[]=' isn't defined for the type 'String'.
```

#### 📏 Length
You can get the length of a string using the `length` property:
```dart
var name = 'bob';
print(name.length); // 3
```

### 🔧 String operations

#### ➕ Concatenation
You can use `+` to concatenate strings
```dart
var fullName = 'James' + ' ' + 'Bond';
print(fullName); // James Bond
```

#### ✂️ Substring
```dart
var fullName = 'James' + ' ' + 'Bond';

var firstName = fullName.substring(0, 5);
print(firstName); // James

var lastName = fullName.substring(6);
print(lastName); // Bond
```

#### 🔠 Case Conversion
```dart
print('bob'.toUpperCase()); // BOB
print('Bob'.toLowerCase()); // bob
```

#### 🔄 Conversion
```dart
print(42.toString()); // 42
print(3.14.toString()); // 3.14

var age = int.parse('25'); // 25
var payment = double.parse('34.85'); // 34.85
```

#### ⚠️ Invalid Operation
```dart
print('a' + 3); // ❌ Error: A value of type 'int' can't be assigned to a variable of type 'String'
```

#### ✅ Valid Operation
```dart
print('a' * 3); // aaa
```

#### ⚖️ Comparison
```dart
var a = 'a';
print(a == 'a'); // true

var b = 'b';
print(a == b); // false

print(a.compareTo(b));   // -1
print(b.compareTo(a));   // 1
print(a.compareTo('a')); // 0
```

`this.compareTo(other)` returns:
- a negative value if `this` is ordered before `other`
- a positive value if `this` is ordered after `other`
- zero if `this` and `other` are equivalent

#### 🔍 contains
```dart
var bob = 'bob';
print(bob.contains('o')); // true 
print(bob.contains('O')); // false

// with element position
print(bob.contains('o', 1)); // true
print(bob.contains('o', 2)); // false
```

#### 📍 indexOf / lastIndexOf
```dart
var text = 'abra cadabra';
print(text.indexOf('a')); // 0
print(text.indexOf('a', 1)); // 3
print(text.lastIndexOf('a')); // 11
print(text.lastIndexOf('a', 9)); // 8
```

#### ✂️ trim
```dart
var bob = '   bob   ';
print(bob.trimLeft());  // 'bob   '    
print(bob.trimRight()); // '   bob'
print(bob.trim());      // 'bob'  
```

> The original string is unchanged due to immutability.

#### 🔁 replace & split
```dart
var text = 'abra cadabra shavabra';
print(text.replaceAll('abra', 'xxxx'));   // xxxx cadxxxx shavxxxx
print(text.replaceFirst('abra', 'xxxx')); // xxxx cadabra shavabra

print(text.split(' '));     // [abra, cadabra, shavabra]
print(text.split('abra'));  // [, cad, shav, ]
```

#### 📭 Empty check
```dart
var bob = 'bob';
print(bob.isEmpty);     // false
print(bob.isNotEmpty);  // true

bob = '';
print(bob.isEmpty);     // true
print(bob.isNotEmpty);  // false
```

>📝 Note
>Most string operations return a **new string**, because strings are immutable.
