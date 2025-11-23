List<int> range(int start, int end) {
  List<int> result = [];
  if (start <= end) {
    for (int i = start; i <= end; i++) {
      result.add(i);
    }
  } else {
    for (int i = start; i >= end; i--) {
      result.add(i);
    }
  }
  return result;
}

void main() {
  print(range(10, 1));   
  print(range(1, 10));   
}