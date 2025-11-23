List<int> rangeWithStep(int start, int end, int step) {
  List<int> result = [];
  if (start < end) {
    for (int i = start; i <= end; i += step) {
      result.add(i);
    }
  } else {
    for (int i = start; i >= end; i -= step) {
      result.add(i);
    }
  }
  return result;
}

void main() {
  print(rangeWithStep(30, 23, 3));  
 // print(rangeWithStep(10, 1, 2));  // [10, 8, 6, 4, 2]
}