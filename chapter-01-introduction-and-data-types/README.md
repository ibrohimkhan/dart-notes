# Chapter 1 — Introduction to Dart and Built-in Data Types

> 💡 This chapter covers the core Dart types and basic concepts.

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

#### 🔧 String Operations

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

`Runes` represent the Unicode code points of a string, where each code point is stored as a UTF-32 value.

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

> 💡 `String` represents text as a sequence of UTF-16 code units, while `Runes` represent Unicode code points as UTF-32 values.

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

#### 📏 Fixed-length List

> 💡 A fixed-length list has a fixed size — you cannot add or remove elements.

```dart
var nums = List<int>.filled(3, 0); // fixed-length list
print(nums); // [0, 0, 0] 

nums[1] = 1;
print(nums); // [0, 1, 0]

// ❌ Not allowed operations
nums.add(4); // Unsupported operation: Cannot add to a fixed-length list
nums[3] = 2; // RangeError (index): Invalid value: Not in inclusive range 0..2: 3
```

> 💡 Use growable lists in most cases. Fixed-length lists are useful when the size must stay constant.

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

#### ➕ Add items to the List

```dart
var nums = [1, 2, 3];

var nums2 = <int>[0, ...nums];
print(nums2); // [0, 1, 2, 3]

nums2 += [4, 5];
print(nums2); // [0, 1, 2, 3, 4, 5]
```

#### 📏 Properties

```dart
var nums = [1, 2, 3];
print(nums.length); // 3

print(nums.first);  // 1
print(nums.last);   // 3

print(nums.isEmpty);    // false
print(nums.isNotEmpty); // true
```

#### 🔧 List Operations
- `void add(value)`
- `void addAll([item1, item2, item3])`
- `void insert(index, value)`
- `void insertAll(index, [item1, item2, item3])`
- `E removeAt(index)`
- `bool remove(firstItem)`
- `E removeLast()`
- `void removeRange(start, endNotInclusive)`
- `void clear()`
- `void removeWhere((element) => condition)`
  ```dart
  [1, 2, 3, 4, 5].removeWhere((x) => x % 2 == 0); // [1, 3, 5]
  ```
- `void setAll(index, [item1, item2, item3])`
  ```dart
  [1, 2, 3, 4, 5].setAll(0, [10, 20, 30]); // [10, 20, 30, 4, 5]
  ```
- `void replaceRange(start, end, [item1, item2])`
  ```dart
  [1, 2, 3, 4, 5].replaceRange(3, 5, [40, 50]); // [1, 2, 3, 40, 50]
  ```
- `void fillRange(start, end, value)`
  ```dart
  [1, 2, 3, 4, 5].fillRange(1, 4, 0); // [1, 0, 0, 0, 5]
  ```
- `String join()`
  ```dart
  print([1, 2, 3].join()); // 123
  ```
- `String join(sep)`
  ```dart
  print([1, 2, 3].join('-')); // 1-2-3
  ```
- `List<E> sublist(start)`
  ```dart
  print([1, 2, 3, 4, 5, 6].sublist(2)); // [3, 4, 5, 6]
  ```
- `List<E> sublist(start, end)`
  ```dart
  print([1, 2, 3, 4, 5, 6].sublist(2, 4)); // [3, 4]
  ```
- `void shuffle()` - mutates the list by shuffling the elements
- `void sort()`    - mutates the list by ascending sorting the elements

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

### 🔸 Set

A `Set` is an unordered collection of unique elements.

- All elements must be of the same type
- Duplicate values are not allowed  

Sets are commonly used to:
- remove duplicates  
- check if an element exists  

> 💡 Sets in Dart are unordered — element order is not guaranteed.

A `Set` can be declared explicitly or using type inference.

```dart
var nums = {1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 7};
print(nums); // {1, 2, 3, 4, 5, 6, 7}

Set nums2 = {1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 7};
print(nums2); // {1, 2, 3, 4, 5, 6, 7}

var emptySet = <int>{};
print(emptySet); // {}

var listItems = [1, 2, 3, 4, 2, 1, 1, 3, 2];
var uniqueItems = Set.from(listItems).toList();
print(uniqueItems); // [1, 2, 3, 4]

listItems = [1, 1, 2, 3, 2, 4, 5, 4, 6, 6, 6];
var setElements = {
  for (var i in listItems) if (i % 2 == 0) i
};

print(setElements); // {2, 4, 6}
```

#### 🔒 Immutability

```dart
var nums = const {1, 2, 3, 4};
var nums2 = Set.unmodifiable([1, 2, 3, 4, 5]);
```

#### ⚠️ Invalid Operations

```dart
var wrongSet = const {1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 7}; // ❌ Error: Constant evaluation error: Context: The element '1' conflicts with another existing element in the set.

var items = {1, 2, 3, 4};
items[0] = 2; // ❌ Error: The operator '[]=' isn't defined for the type 'Set<int>'.
```

#### 📏  Properties

> ⚠️ Even though you can use `first` and `last`, Sets are unordered, so the result may not be predictable.

```dart
var nums = {1, 2, 3};
print(nums.length); // 3

print(nums.first);  // 1
print(nums.last);   // 3

print(nums.isEmpty);    // false
print(nums.isNotEmpty); // true
```

#### 🔧 Set Operations
- bool add(value)
- void addAll([item1, item2, item3])
- bool remove(value)
- void removeAll([item1, item2])
- void removeWhere((element) => condition)
- void clear()

#### 🔍 where / firstWhere / lastWhere

```dart
final numbers = <int>{1, 2, 3, 5, 6, 7};

var result = numbers.where((x) => x < 5);
print(result); // (1, 2, 3)

result = numbers.where((x) => x > 5);
print(result); // (6, 7)

result = numbers.where((x) => x.isEven);
print(result); // (2, 6)

var resultInt = numbers.firstWhere((element) => element < 5);
print(resultInt); // 1

resultInt = numbers.firstWhere((element) => element > 5);
print(resultInt); // 6

resultInt = numbers.firstWhere((element) => element > 10, orElse: () => -1 );
print(resultInt); // -1

resultInt = numbers.lastWhere((element) => element < 5);
print(resultInt); // 3

resultInt = numbers.lastWhere((element) => element > 5);
print(resultInt); // 7

resultInt = numbers.lastWhere((element) => element > 10, orElse: () => -1);
print(resultInt); // -1
```

#### 🔗 union / difference / intersection
These operations create a new set and do not modify the original one.

```dart
var items1 = {1, 2, 3, 4, 5, 6};
var items2 = {4, 5, 6, 7, 8, 9};

print(items1.union(items2));        // {1, 2, 3, 4, 5, 6, 7, 8, 9}

print(items1.difference(items2));   // {1, 2, 3}
print(items2.difference(items1));   // {7, 8, 9}

print(items1.intersection(items2)); // {4, 5, 6}
```


#### 🔍 contains / containsAll
```dart
var items = {1, 2, 3};
print(items.contains(2)); // true
print(items.contains(5)); // false

print(items.containsAll({2, 3})); // true
print(items.containsAll({1, 5})); // false
```

### 🧠 Key Takeaways

- A `Set` is an unordered collection of unique elements  
- Duplicate values are automatically removed  
- Sets are strongly typed — all elements must be of the same type  
- Sets are useful for removing duplicates and checking membership  
- Sets do not guarantee element order  
- Operations like `union`, `difference`, and `intersection` return new sets  
- Use `.toSet()` to convert a `List` into a `Set`

---

### 🗺️ Map

A `Map` is a collection of key-value pairs.

Each key is unique and is used to access its corresponding value.

- Keys cannot be duplicated  
- Values can be duplicated  

Both keys and values can be of any data type.

In simple terms, a `Map` stores data in the form of: `key -> value`

> 💡 A `Map` is similar to a dictionary in other programming languages.

#### 🏗️ `Map` declaration

```dart
var user = <String, String>{
  'name': 'Alice',
  'email': 'alice@example.com'
};

print(user);          // {name: Alice, email: alice@example.com}
print(user['name']);  // Alice
print(user['email']); // alice@example.com

var students = <int, String> {
  1: 'Alice', 
  2: 'Bob', 
  3: 'Charlie'
};
print(students);  // {1: Alice, 2: Bob, 3: Charlie}

var emptyMap1 = Map<String, int>(); // {} - empty map
var emptyMap2 = <String, int>{};    // {} - empty map

// creating a map from two lists
var keys = [1, 2, 3];
var values = ['one', 'two', 'three'];

var map = Map.fromIterables(keys, values);

print(map); // {1: one, 2: two, 3: three}
```

#### ✏️ Modify Map Elements

```dart
var students = <String, int> {
  'Alice': 85,
  'Bob': 52,
  'Charlie': 78,
};

print(students); // {Alice: 85, Bob: 52, Charlie: 78}

students['Bob'] = 95; // Update Bob's score
print(students); // {Alice: 85, Bob: 95, Charlie: 78}

students['David'] = 88; // Add a new student
print(students); // {Alice: 85, Bob: 95, Charlie: 78, David: 88}
```

#### 🔑 Access Value by Key

You can access a value in a `Map` using its key.

If the key does not exist, it returns `null`.

```dart
var students = <int, String> {
  1: 'Alice', 
  2: 'Bob', 
  3: 'Charlie'
};
print(students[1]); // Alice
print(students[4]); // null
```

> ⚠️ The return type is nullable, so you should handle `null` if needed.

> 💡 Use `containsKey()` to check if a key exists before accessing it.

#### 📏 Properties & Helpers

```dart
var students = <int, String> {
  1: 'Alice', 
  2: 'Bob', 
  3: 'Charlie'
};

print(students.length);     // 3
print(students.isEmpty);    // false
print(students.isNotEmpty); // true

print(students.keys);   // (1, 2, 3) → Iterable
print(students.values); // (Alice, Bob, Charlie) → Iterable

print(students.keys.toList());    // [1, 2, 3]
print(students.values.toList());  // ['Alice', 'Bob', 'Charlie']
```

#### 🔁 Iterating over Map

```dart
var students = {'Alice': 85, 'Bob': 90};

// keys
for (var key in students.keys) {
  print(key);
}

// values
for (var value in students.values) {
  print(value);
}

// entries
for (var entry in students.entries) {
  print('${entry.key}: ${entry.value}');
}
```

#### 🔧 Map Operations
- V putIfAbsent(K key, V ifAbsent())
  ```dart
  var students = <int, String>{1: 'Alice', 2: 'Bob', 3: 'Charlie'};
  print(students.putIfAbsent(4, () => 'David')); // David
  print(students); // Output: {1: Alice, 2: Bob, 3: Charlie, 4: David}
  ```
- void addAll(Map<K, V> other)
  ```dart
  var students = <int, String>{1: 'Alice', 2: 'Bob', 3: 'Charlie'};
  students.addAll({5: 'Eve', 6: 'Frank'});
  print(students); // {1: Alice, 2: Bob, 3: Charlie, 5: Eve, 6: Frank} 
  ```
- V? remove(Object? key)
  ```dart
  var students = <int, String>{1: 'Alice', 2: 'Bob', 3: 'Charlie'};
  var bob = students.remove(2);

  print(bob);       // Bob
  print(students);  // {1: Alice, 3: Charlie}
  ```
- void removeWhere(bool test(K key, V value))
  ```dart
  var students = <int, String>{1: 'Alice', 2: 'Bob', 3: 'Charlie', 4: 'David'};
  students.removeWhere((key, value) => key % 2 == 0); // Remove entries with even keys
  print(students); // {1: Alice, 3: Charlie}  
  ```
- void clear()
- bool containsKey(Object? key) / bool containsValue(Object? value)
  ```dart
  var students = <int, String>{1: 'Alice', 2: 'Bob', 3: 'Charlie', 4: 'David'};
  print(students.containsKey(2));       // true
  print(students.containsValue('Eve')); // false
  ```
- V update(K key, V update(V value), {V ifAbsent()?})
  ```dart
  var students = <int, String>{1: 'Alice', 2: 'Bob', 3: 'Charlie', 4: 'David'};
  students.update(2, (value) => 'Bobby');
  print(students); // {1: Alice, 2: Bobby, 3: Charlie, 4: David}

  students.update(5, (value) => 'Eve', ifAbsent: () => 'Eve');
  print(students); // {1: Alice, 2: Bobby, 3: Charlie, 4: David, 5: Eve}
  ```
- void updateAll(V update(K key, V value))
  ```dart
  var students = <int, String>{1: 'Alice', 2: 'Bob', 3: 'Charlie', 4: 'David'};
  students.updateAll((key, value) => value.toUpperCase());
  print(students); // {1: ALICE, 2: BOB, 3: CHARLIE, 4: DAVID}
  ```

#### 🧠 Key Takeaways

- A `Map` stores data as key-value pairs  
- Keys are unique, but values can be duplicated  
- You access values using their keys: `map[key]`  
- If a key does not exist, it returns `null`  
- Use `containsKey()` to safely check if a key exists  
- `Map` is strongly typed: `<KeyType, ValueType>`  
- Keys and values can be of any data type  
- Properties like `keys` and `values` return Iterables  
- Methods like `update`, `remove`, and `addAll` modify the map  
- Use `entries` to iterate over key-value pairs
- Maps are commonly used for JSON-like data structures

---

### 🧩 Records

A `Record` is a way to group multiple values into a single object without creating a class.

Records are:
- anonymous
- immutable
- aggregate data type
- fixed-size  
- can store values of different types
- typed

> 💡 `Records` are values that can be stored in variables, passed to and from functions, and stored in data structures such as lists, maps, and sets.

#### 🏗️ Records declaration

```dart
var user = ('Alice', 25);
print(user);    // (Alice, 25)
print(user.$1); // Alice
print(user.$2); // 25

(String, int) user2 = ('Bob', 30);
print(user2);    // (Bob, 30)
print(user2.$1); // Bob
print(user2.$2); // 30

// ❌ Error: A value of type '(int, String)' can't be assigned to a variable of type '(String, int)'.
(String, int) bob = (30, 'Bob');

// ❌ Error: A value of type 'int' can't be assigned to a variable of type '(int)'.
(int) value = (42);

// A single-value record requires a trailing comma
(int,) value1 = (42,);
print(value1);              // (42)
print(value1.runtimeType);  // (int)

// Without a trailing comma, this is just an int
var value2 = (42);
print(value2);              // 42
print(value2.runtimeType);  // int
```

#### 🔢 Record fields

Records can contain two types of fields:

- Positional - Accessed by position
- Named - Accessed by name

```dart
var user = ('Alice', 25);

print(user.$1); // Alice
print(user.$2); // 25

var user2 = (name: 'Alice', age: 25);

print(user2.name); // Alice
print(user2.age);  // 25
```

#### 🔀 Mixed fields

Records can combine positional and named fields:

```dart
var user = ('Alice', age: 25);

print(user.$1);  // Alice
print(user.age); // 25

(int, {String name}) user2 = (40, name: 'Charlie');
print(user2);       // (40, name: Charlie)
print(user2.$1);    // 40
print(user2.name);  // Charlie

(int, {String name}) user3 = (name: 'Eva', 30);
print(user3);       // (30, name: Eva)
print(user3.$1);    // 30
print(user3.name);  // Eva
```

> 💡 Record syntax rule in type definition: positional fields come first, named fields go last.

```dart
// {String name}, int) ❌
({String name}, int) user = (name: 'Charlie', 35); // ❌

// (int, {String name}) ✅
(int, {String name}) user2 = (name: 'Eva', 30); // ✅
// or
(int, {String name}) user2 = (30, name: 'Eva'); // ✅ recommended
```

> 💡 In Dart Records, named fields can appear in any order, while positional values are matched by their position.

#### 💡 Notes
- Positional fields are ordered
- Named fields are accessed by name
- Records are immutable

#### ⚖️ Record Equality

Records are compared by value, not by reference.

Two records are equal if all their fields are equal.

```dart
var a = ('Alice', 25);
var b = ('Alice', 25);

print(a == b); // true
```

🔢 Order matters
```dart
var a = ('Alice', 25);
var b = (25, 'Alice');

print(a == b); // false
```

🏷️ Names and values must match
```dart
var a = (name: 'Alice', age: 25);
var b = (name: 'Alice', age: 25);

print(a == b); // true
```

⚠️ Mixed cases
```dart
var a = ('Alice', age: 25);
var b = ('Alice', age: 25);

print(a == b); // true
```

> 💡 Important
> - Records use value equality
> - Positional fields depend on order
> - Named fields depend on names and values


#### 📦 Record Destructuring

Record destructuring allows you to unpack record values into separate variables.

```dart
// destructuring positional fields
var user = ('Alice', 25);
var (name, age) = user;

print(name);  // Alice
print(age);   // 25

// destructuring named fields
var user2 = (name2: 'Alice', age2: 25);
var (:name2, :age2) = user2;

print(name2); // Alice
print(age2);  // 25

// destructuring mixed fields
var user3 = ('Alice', age: 25);
var (name3, age: userAge) = user3;

print(name3);   // Alice
print(userAge); // 25
```

> 💡 Destructuring makes code shorter and easier to read when working with Records.

#### 🧠 Key Takeaways

- A `Record` groups multiple values into a single object without creating a class  
- Records are immutable, fixed-size, and can hold values of different types  
- Records can have positional fields (`$1`, `$2`, ...) and named fields (`.name`)  
- Positional fields are ordered; named fields are accessed by name  
- In type definitions, positional fields come first, named fields go last  
- Records use value equality (not reference equality)  
- Records are useful for returning multiple values from functions  
- Destructuring allows you to unpack records into variables  

---

### 🧩 Modifiers: `final`, `const`, and `late`

`final`, `const`, and `late` are modifiers used to control how and when variables are initialized and whether their values can change.

They help you write safer and more predictable code by defining:
- if a variable can be reassigned  
- when a value is assigned  
- whether a value is known at compile time  

#### 🔒 `final` vs `const`

Both `final` and `const` variables cannot be reassigned after they are initialized.

The main differences:

- `final` variables are assigned **once at runtime**  
- `const` variables are assigned **at compile time** and must be initialized immediately  
- `const` is used for **compile-time constant values**  
- `const` can also be used with constructors to create immutable objects  

```dart
final int age;
const int maxAge = 150;

age = 25; // ✅ OK (assigned once)

maxAge = 200; // ❌ Error: const variables can't be reassigned
age = 21;     // ❌ Error: final variable can only be set once
```

> 💡 Use `final` when the value is known at runtime, and `const` when the value is known at compile time.

#### ⏳ `late` vs `final`

`late` is used to delay the initialization of a variable.

It is useful for:
- non-null variables that are initialized later  
- lazy initialization (value is computed when first used)

#### ⚖️ Key Differences

- `final` must be assigned only once  
- `late` delays initialization  
- `late final` = assigned once, but later  
- both must be initialized before being used  

```dart
const int maxAge = 120;

late int age;
late final int counter;

void main() {
  age = 25;         // can be reassigned
  counter = 0;      // can be assigned only once

  print('Age: $age');
  print('Max Age: $maxAge');
  print('Counter: $counter');
}
```

> ⚠️ Accessing a `late` variable before initialization will cause a runtime error.

> 💡 `late` does not make a variable mutable — it only delays initialization.

#### 🧠 Key Takeaways

- `final` variables can be assigned only once (at runtime)  
- `const` variables are compile-time constants and must be initialized immediately  
- `late` delays variable initialization  
- `late final` allows assigning a value once, but later  
- Accessing a `late` variable before initialization causes a runtime error  
- Use `final` when the value is known at runtime  
- Use `const` for compile-time constant values  

---

### 🚫 Null Safety

Dart supports null safety, which prevents you from accessing members on a `null` value. The main problem with `null` is that calling a property or method on a `null` value will crash the program.

By default, types are non-nullable. This means:
- variables must be initialized before use; otherwise, a compile-time error occurs
- variables cannot be assigned `null` values


```dart
class Cat {
  void helloMaster() {
    print("Meow meow meow");
  }
}

void main() {
  Cat myCat;

  // ❌ Error: A value of type 'Null' can't be assigned to a variable of type 'Cat'.
  // myCat = null;

  // ❌ Error: Non-nullable variable 'myCat' must be assigned before it can be used.
  // myCat.helloMaster(); 

  myCat = Cat();
  myCat.helloMaster(); // ✅ Meow meow meow
}
```

In some cases, Dart can automatically promote a nullable type to a non-nullable type if it can guarantee that the value is not null.

```dart
int? max;
int counter = max; // ❌ Error: A value of type 'int?' can't be assigned to a variable of type 'int'.

int? a = 100;

// Dart knows 'a' is not null here
int b = a; // ✅ OK due to type promotion

void test(int? age) {
  int yourAge = age; // ❌ Error: A value of type 'int?' can't be assigned to a variable of type 'int'.
}
```

> 💡 Dart uses flow analysis to promote nullable types to non-nullable when it can guarantee the value is not null.

To indicate that a variable can have the value `null`, add `?` to its type declaration:

```dart
int? a = null;
print(a); // ✅ null
```

`?.` null-aware operator:

```dart
class Cat {
  void helloMaster() {
    print("Meow meow meow");
  }
}

void main() {
  Cat? myCat = null;
  print(myCat); // ✅ null

  // method will not be called on null value
  myCat?.helloMaster();

  myCat = Cat();
  myCat.helloMaster(); // ✅ Meow meow meow

  String? str = null;
  print(str?.length); // ✅ null
}
```

`??` if-null operator:

```dart
String? name = null;
String nickname = name ?? 'Unknown';
print(nickname); // Unknown
```

`!` null-assertion operator (`bang`):

```dart
int? age = 50;
print(age!.isEven); // true

String? name = null;
print(name!.length); // ❌ Unhandled exception: Null check operator used on a null value
```

In Dart, all types ultimately inherit from `Object?`, while non-nullable types extend `Object`.

#### 🧠 Key Takeaways

- Types are non-nullable by default
- Add `?` to allow `null`
- Use `?.` to safely access members
- Use `??` to provide a fallback value
- Use `!` only when you are sure the value is not `null`
- Dart can promote nullable types using flow analysis

---

### 🌀 `dynamic` Type

`dynamic` is a special type in Dart that disables static type checking for a variable.

A `dynamic` variable can hold values of different types, and Dart allows calling any member on it at compile time.

```dart
dynamic value = 'hi';
print(value.length); // 2

value = 42;
print(value.isOdd); // false

value = [1, 2, 3];
print(value.first); // 1
```

`Object` can also hold values of different non-null types:
```dart
Object value = 'hi';
print(value); // hi

value = 42;
print(value); // 42

value = [1, 2, 3];
print(value); // [1, 2, 3]
```

However, unlike `Object`, a `dynamic` variable allows you to call any member at compile time. 

If the actual object does not have that member, the error will happen at runtime.

```dart
dynamic value = 2;
value.run(); // ❌ NoSuchMethodError: Class 'int' has no instance method 'run'.
```

#### ⚠️ Runtime Error

The main disadvantage of dynamic is that the Dart compiler does not check whether the called member actually exists.

If the member does not exist, the error appears at runtime and may crash the app.

```dart
dynamic text = 'this is a string';
print(text.floor()); // ❌ Runtime Error: NoSuchMethodError
```

#### 📦 `Object` Type

`Object` is safer than `dynamic` because Dart checks member access at compile time. 

If a variable has the `dynamic` type, Dart allows you to call methods of the actual object stored in it.

With `Object`, this is not allowed directly. You first need to check or cast the value to its actual type before calling type-specific methods.

```dart
dynamic value1 = 'Hello';
print(value1.length); // ✅ OK

Object value2 = 'Hello';
// print(value2.length); // ❌ Compile-time error

if (value2 is String) {
  print(value2.length); // ✅ OK
}
```

> 💡 `dynamic` gives flexibility but removes compile-time safety.  
> 💡 `Object` is safer because Dart checks member access at compile time.
> 💡 Use `Object?` if the value can also be `null`.

#### 🧠 Key Takeaways

- `dynamic` disables static type checking for a variable  
- A `dynamic` variable can hold values of different types  
- `dynamic` allows calling any member at compile time  
- If the member does not exist, the error happens at runtime  
- `Object` can also hold values of different non-null types  
- `Object` is safer because Dart checks member access at compile time  
- With `Object`, you need type checking or casting before calling type-specific members  
- Use `Object?` if the value can also be `null`  
- Prefer `Object` when possible; use `dynamic` only when you really need flexibility

---
