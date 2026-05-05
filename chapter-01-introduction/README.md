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

#### Operations with numbers
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

---

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

`String` is an immutable data type, so it cannot be changed: 

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

#### 🔧 String operations

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

> 📝 Note: Most string operations return a **new string**, because strings are immutable.

### 🧠 Key Takeaways

- Dart is statically typed with type inference (`var`)
- Strings are immutable
- String operations return new values
- Interpolation is preferred over concatenation

---

### 🔣 Runes & Symbols

`Runes` represent Unicode code points of a string.

Dart strings are based on UTF-16, which means some characters (like emojis) may take more than one position in a string.

Example:

```dart
var emoji = '😊';

print(emoji.length); // 2 ❗
print(emoji.runes);  // (128522)
```

You can also inspect all characters:

```dart
var text = 'A😊';
print(text.runes); // (65, 128522)
```

> 💡 Use `Runes` when working with Unicode characters or emojis.

A `Symbol` represents the name of an identifier as an object.

```dart
var mySymbol = #myAPI;
print(mySymbol); // Symbol("myAPI")
```

Symbols are mainly used for reflection and advanced API usage.

> ⚠️ In modern Dart (especially Flutter), Symbol is rarely used.

---

### 🔘 Boolean

In Dart, the `bool` type can have only two values: `true` or `false`.

```dart
bool canWrite = false;
var canRead = true;
```

---

### 📋 List
A `List` is an ordered collection of objects.

> 💡 Lists in Dart are zero-indexed (first element has index 0).

Unlike strings, lists are mutable — you can change their elements by index or by using built-in list methods.

This makes lists a flexible tool for storing collections of data, such as:
- items in a shopping list  
- tasks for the day  
- any group of related objects

### 📌 Important

A `List` in Dart is ordered and indexed starting from 0.

#### 🏗️ `List` declaration

```dart
List<int> numbers = [1, 2, 3, 4, 5];
var nums = [1, 2, 3];
var emptyList = <int>[];

var nums2 = List<int>.from(nums.reversed); // [3, 2, 1]

var isChecked = true;
var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  if (isChecked) 'Item 4',
];

print(items); // [Item 1, Item 2, Item 3, Item 4]

var numberedItems = [
  for (var i in items) '#$i',
];

print(numberedItems); // [#Item 1, #Item 2, #Item 3, #Item 4]
```

#### ✏️ Modify List Items

```dart
var nums = [1, 2, 3];
nums[0] = 10;
print(nums); // [10, 2, 3]
```

> ⚠️ A `List` is strongly typed. All elements must be of the same type.
```dart
var nums = [1, 2, 3];
nums[0] = 1.7; // ❌ Error: A value of type 'double' can't be assigned to a variable of type 'int'.
```

#### 🔒 Immutability
```dart
var nums = const [1, 2, 3];
var items = List.unmodifiable([4, 5, 6]);

nums[0] = 11;  // ❌ Unsupported operation: Cannot modify an unmodifiable list
items[0] = 44; // ❌ Unsupported operation: Cannot modify an unmodifiable list
```

#### ➕ Add items into the List

```dart
var nums = [1, 2, 3];

var nums2 = <int>[0, ...nums];
print(nums2); // [0, 1, 2, 3]

nums2 += [4, 5];
print(nums2); // [0, 1, 2, 3, 4, 5]
```

#### 📏 Length

You can get the length of a list using the `length` property:

```dart
var nums = [1, 2, 3];
print(nums.length); // 3
```

#### 🔧 List operations
- add(value)
- addAll([item1, item2, item3])
- insert(index, value)
- insertAll(index, [item1, item2, item3])
- removeAt(index)
- remove(firstItem)
- removeLast()
- removeRange(start, endNotInclusive)
- clear()
- removeWhere((element) => condition) => [1, 2, 3, 4, 5].removeWhere((x) => x % 2 == 0); // [1, 3, 5]
- setAll(index, [item1, item2, item3]) => [1, 2, 3, 4, 5].setAll(0, [10, 20, 30]); // [10, 20, 30, 4, 5]
- replaceRange(start, end, [item1, item2]) => [1, 2, 3, 4, 5].replaceRange(3, 5, [40, 50]); // [1, 2, 3, 40, 50]
- fillRange(start, end, value) => [1, 2, 3, 4, 5].fillRange(1, 4, 0); // [1, 0, 0, 0, 5]
- join() => [1, 2, 3].join(); // 123
- join(sep) => [1, 2, 3].join('-'); // 1-2-3
- first => [1, 2, 3].first  // 1
- last => [1, 2, 3].last    // 3
- isEmpty => [1, 2, 3].isEmpty  // false
- isNotEmpty => [].isNotEmpty   // false
- sublist(start) => [1, 2, 3, 4, 5, 6].sublist(2); // [3, 4, 5, 6]
- sublist(start, end) => [1, 2, 3, 4, 5, 6].sublist(2, 4); // [3, 4]
- shuffle() - mutates the list by shuffling the elements
- sort() - mutates the list by ascending sorting the elements

#### 🔍 contains

```dart
var items = <int>[1, 2, 3, 4];
print(items.contains(4)); // true
```

#### 📍 indexOf / lastIndexOf / any

`int indexOf(element, start)` - returns the index of the element in the list, start is a starting position to search element in the list. If the element is not found returns -1. 

```dart
var items = <int>[1, 2, 3, 4];
print(items.indexOf(3)); // 2
print(items.indexOf(3, 3)); // -1
print(items.lastIndexOf(4)); // 3

print(items.indexWhere((element) => element > 3)); // 3

items = <int>[1, 2, 1, 3, 4, 8, 3];
print(items.firstWhere((x) => x % 2 == 0)); // 2
print(items.lastWhere((x) => x % 2 == 0));  // 8

items = <int>[1, 2, 3, 4, 5];
print(items.any((x) => x % 2 == 0)); // true
```

#### 🔍 where

```dart
var items = <int>[1, 2, 3, 4, 1, 3, 4, 1];
var countOnes = items.where((x) => x == 1).length;
print(countOnes); // 3
```

#### 🔄 map

```dart
var items = <int>[1, 2, 3, 4];
var doubled = items.map((x) => x * 2).toList();
print(doubled); // [2, 4, 6, 8]
```

#### ➕ reduce

```dart
var nums = <int>[1, 2, 3, 4, 5];
var sum = nums.reduce((value, element) => value + element);
print(sum); // 15
```

#### 🔗 `List` is a reference type

```dart
var num1 = [1, 2];
var num2 = num1;

num2.add(3);
num1.add(4);

print(num1); // [1, 2, 3, 4]
print(num2); // [1, 2, 3, 4]

var num3 = List.from(num1);
num3.add(5);

print(num1); // [1, 2, 3, 4]
print(num3); // [1, 2, 3, 4, 5]

num1 = [1, 2];
num2 = [...num1];
num2.add(3);

print(num1); // [1, 2]
print(num2); // [1, 2, 3]

num1 = [1, 2];
num2 = []..addAll(num1);
num2.add(3);

print(num1); // [1, 2]
print(num2); // [1, 2, 3]
```

### 🧠 Key Takeaways

- Lists are ordered and mutable
- Lists are strongly typed
- Lists support powerful functional operations like `map`, `where`, and `reduce`
- Lists are reference types

---

### Set


---

### Map


---

### Record


---

### Null
