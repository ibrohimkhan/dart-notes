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
}```

---

### 🏷️ Naming Conventions
- `lowerCamelCase` — variables, functions, and methods
- `UpperCamelCase` — classes
- Names cannot start with `digits`
- Dart is case-sensitive: `name` and `NAME` are different identifiers
- Names starting with `_` are private to the library

---

### 📊 Built-in Data Types
- num, int, double
- String
- Runes
- Symbol
- bool
- List
- Set
- Map
- Record
- Null
