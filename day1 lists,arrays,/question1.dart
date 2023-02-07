// This is the point of my beggining I was dissapointed interviewing for Andela and
//This question just brought me to my knees
// It is the basis of this 50 day training challenge
//--
// Question 1 Given an array [1,2,3,4,5,6,7,8,9] in the array [1,2,3,4,5,6,7,8,9] the elements are arranged
//in order from the first to the last index.If we would like to reverse the order of elements write a function
//that takes the array, element index say k and direction  and returns the order and index of eleNments
//

//T --SOLUTION --//
List<int> reversedArray(List<int> arr, int k, String direction) {
  if (direction == 'right') {
    arr.replaceRange(0, k + 1, arr.sublist(0, k + 1).reversed.toList());
  } else if (direction == 'left') {
    arr.replaceRange(
        k, arr.length, arr.sublist(k, arr.length).reversed.toList());
  }
  return arr;
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(reversedArray(arr, 4, 'right')); // [1, 2, 3, 4, 9, 8, 7, 6, 5]
  print(reversedArray(arr, 4, 'left')); // [5, 6, 7, 8, 9, 4, 3, 2, 1]
}
