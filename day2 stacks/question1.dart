// You are given the head of a singly linked-list. The list can be represented as:

// L0 → L1 → … → Ln - 1 → Ln
// Reorder the list to be on the following form:

// L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
// You may not modify the values in the list's nodes. Only nodes themselves may be changed.
//
//
//
// EXAMPLE
// Input: head = [1,2,3,4,5]
// Output: [1,4,2,3,5]
//
//
//
// CONSTRAINTS
// The number of nodes in the list is in the range [1, 100].
// 1 <= Node.val <= 100
//
//
//
// Follow up: Could you do it in one pass?

class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val);
}

ListNode? reorderList(ListNode? head) {
  if (head == null || head.next == null) {
    return head;
  }
  ListNode? slow = head;
  ListNode? fast = head;

  while (fast!.next != null && fast.next?.next != null) {
    slow = slow?.next;
    fast = fast.next?.next;
  }
  ListNode? secondHalf = slow?.next;
  slow?.next = null;
  // reverse the second half
  ListNode? prev = null;
  ListNode? curr = secondHalf;
  while (curr != null) {
    ListNode? nextNode = curr.next;
    curr.next = prev;
    prev = curr;
    curr = nextNode;
  }
  secondHalf = prev;
  // merge the two halves
  ListNode? p1 = head;
  ListNode? p2 = secondHalf;
  while (p1 != null && p2 != null) {
    ListNode? temp1 = p1.next;
    ListNode? temp2 = p2.next;
    p1.next = p2;
    p2.next = temp1;
    p1 = temp1;
    p2 = temp2;
  }
  // set the next pointer of the last node in the second half to be null
  if (p1 != null) {
    p1.next = null;
  }
  return head;
}
