void main() {
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
}
