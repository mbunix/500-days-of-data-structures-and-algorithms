// Given a pointer to the head of a singly-linked list, print each
// value from the reversed list. If the given list is empty,
//do not print anything.
class SinglyLinkedListNode {
  var data;
  SinglyLinkedListNode? next;

  SinglyLinkedListNode(this.data);
}

void reversePrint(SinglyLinkedListNode? head) {
  if (head == null) {
    return;
  }

  final stack = [];
  var current = head;

  while (current != null) {
    stack.add(current.data);
    current = current.next!;
  }

  while (stack.isNotEmpty) {
    print(stack.removeLast());
  }
}