// reverse an arrray of integers
List<int> reversedArray(List<int> array) {
  // Leimannn return array.reversed.toList();
  int start = 0;
  int end = array.length - 1;

  // loop over
  while (start < end) {
    // swap elements at start and end
    int temp = array[start];
    array[start] = array[end];
    array[end] = temp;
    // increment start and decrement end
    start++;
    end--;
  }
  return array;
}
