//LINKED LIST
/*
QUESTION 
Given the head of a singly linked list, return the middle node of the linked list.

If there are two middle nodes, return the second middle node.

DESCRIPTION 
A linked list is a collection of values arranged in a linear, unidirectional sequence. 
It has several theoretical advantages over contiguous storage options such as the Dart List


APPROACH 
Initialize two pointers slow and fast to the head of the linked list.
Traverse the linked list with fast pointer moving two nodes at a time 
and slow pointer moving one node at a time.
When fast pointer reaches the end of the linked list (i.e., fast is null or fast.next is null), 
slow pointer will be pointing to the middle node of the linked list.
If the linked list has even number of nodes, then there will be two middle nodes. In this case, slow pointer will be pointing to the first middle node.
To find the second middle node, we can simply move the slow pointer one more node.


*/

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? middleNode(ListNode? head) {
  var slow = head;
  var fast = head;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
  }
  return slow;
}

void main() {
  var head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
  print(middleNode(head)?.val);
  // output: 3
}
