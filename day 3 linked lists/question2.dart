// manipulating linked list
// A sequence of numbers is called an arithmetic progression if the difference
//between any two consecutive elements is the same.
// Given an array of numbers arr, return true if the
//array can be rearranged to form an arithmetic progression. Otherwise, return false.


  bool checkArithmeticProgression(List<int> arr) {
    arr.sort();
    int difference = arr[1] - arr[0];
    for (int i = 2; i < arr.length; i++) {
      if (arr[i] - arr[i - 1] != difference) {
        return false;
      }
    }
    return true;
  }

// main function
void main() {
  List<int> arr = [ 4,3,7,9];
  bool result = checkArithmeticProgression(arr);
  print(result);
}
