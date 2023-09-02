// You are given the pointer to the head node of a linked list and an integer to add to the list. Create a new node with the given integer. Insert this node at the tail of the linked list and return the head node of the linked list formed after inserting this new node. The given head pointer may be null, meaning that the initial list is empty.

// Function Description

// Complete the insertNodeAtTail function in the editor below.

// insertNodeAtTail has the following parameters:

// SinglyLinkedListNode pointer head: a reference to the head of a list
// int data: the data value for the node to insert
// Returns

// SinglyLinkedListNode pointer: reference to the head of the modified linked list
// Input Format

// The first line contains an integer , the number of elements in the linked list.
// The next  lines contain an integer each, the value that needs to be inserted at tail.

// Constraints

// Sample Input

// STDIN Function ----- -------- 5 size of linked list n = 5 141 linked list data values 141..474 302 164 530 474

// Sample Output

// 141
// 302
// 164
// 530
// 474
class SinglyLinkedListNode {
  int data;
  SinglyLinkedListNode? next;

  SinglyLinkedListNode(this.data, {this.next});
}

SinglyLinkedListNode insertNodeAtTail(SinglyLinkedListNode head, int data) {
  SinglyLinkedListNode newNode = SinglyLinkedListNode(data);

  if (head == null) {
    // If the linked list is empty, set the new node as the head node
    return newNode;
  }

  SinglyLinkedListNode? current = head;

  while (current!.next != null) {
    // Traverse the linked list until the last node
    current = current.next!;
  }

  // Set the next pointer of the last node to the new node
  current.next = newNode;

  return head;
}

void main() {
  SinglyLinkedListNode? head;
  List<int> dataValues = [141, 302, 164, 530, 474];

  for (int data in dataValues) {
    head = insertNodeAtTail(head!, data);
  }

  // Print the linked list
  SinglyLinkedListNode? current = head;
  while (current != null) {
    print(current.data);
    current = current.next;
  }
}
