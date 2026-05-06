void main() {
  var nums = List<int>.filled(3, 0);
  print(nums); // [0, 0, 0] 

  nums[1] = 1;
  print(nums); // [0, 1, 0]

  nums.add(4); // Unsupported operation: Cannot add to a fixed-length list
  print(nums); // [0, 1, 0, 4]

  nums[3] = 2; // RangeError (index): Invalid value: Not in inclusive range 0..2: 3
  print(nums);
}
