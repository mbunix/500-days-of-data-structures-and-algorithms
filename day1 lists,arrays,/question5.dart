// Given the pointer to the head node of a linked list and
// an integer to insert at a certain position,
// create a new node with the given integer as its data  attribute,
// insert this node at the desired position and return the head node.
// A position of 0 indicates head,
// a position of 1 indicates one node away from the head and so on.
// The head pointer given may be null meaning that the initial list is empty.
// Example
// head  refers to the first node in the list
// 1 ->2->3
// data  =4
// position = 2
// Insert a node at position  2 with data =4 .
// The new list is  1 ->2->4->3



// solution

// class ListNode {
//   int data;
//   ListNode? next;
//   ListNode([this.data = 0, this.next]);
//   List<dynamic> insertNodeAtPosition<head,data,pos>(
//     current = head,
//     nextNode = new ListNode(data, null),
//     position = pos,
//     while (current != null) {
//       if (position == 0) {
//         current.next = nextNode;
//       }
//       position--;
//     }
//     return head;
    
//   )
// }

class Node {
  int data;
  Node? next;

  Node(this.data);
}

Node? insertNodeAtPosition(Node? head, int data, int position) {
  Node newNode = Node(data);

  if (head == null) {
    return newNode;
  }

  if (position == 0) {
    newNode.next = head;
    return newNode;
  }

  Node? current = head;
  int currentPosition = 0;

  while (current != null) {
    if (currentPosition == position - 1) {
      newNode.next = current.next;
      current.next = newNode;
      break;
    }
    current = current.next;
    currentPosition++;
  }

  return head;
}

void main() {
  Node head = Node(1);
  Node node2 = Node(2);
  Node node3 = Node(3);

  head.next = node2;
  node2.next = node3;

  int data = 4;
  int position = 2;

  Node? newHead = insertNodeAtPosition(head, data, position);

  Node? current = newHead;
  while (current != null) {
    print(current.data);
    current = current.next;
  }
}

