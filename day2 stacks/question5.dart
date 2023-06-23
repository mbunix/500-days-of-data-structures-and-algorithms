// Challenge 6: Reverse a List using a stack
// Create a function that prints the contents of a list in reverse order.

// define the function

void reverseList(List<dynamic> list) {
  List<dynamic> stack = [];
  // push elements into the stack
  for (var element in list) {
    stack.add(element);
  }
  //pop elements from the stack and print them until the stack is empty
  while (stack.isNotEmpty) {
    stack.removeLast();
    print(stack);
  }
}

void main(List<String> args) {
  List<dynamic> myList = [1, 2, 3, 4, 5, 6, 7];
  reverseList(myList);
}
