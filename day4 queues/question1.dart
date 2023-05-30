// Queues use FIFO (first-in-first-out) ordering,
// meaning the first element that was added will always be the first to be removed.
// Queues are handy when you need to maintain the order of your elements to process later.
//Common Operations
// The following interface defines what a queue needs to do:

// abstract class Queue<E> {
//   bool enqueue(E element);
//   E? dequeue();
//   bool get isEmpty;
//   E? get peek;
// }
// enqueue: Insert an element at the back of the queue. Return true if the operation was successful.
// dequeue: Remove the element at the front of the queue and return it.
// isEmpty: Check if the queue is empty.
// peek: Return the element at the front of the queue without removing it.
// List-Based Implementation
// The Dart core library comes with a set of highly optimized data structures that you can use to build higher-level abstractions.
// One of them that you’re already familiar with is List, the data structure that stores a contiguous, ordered collection of elements.
// In this section, you’ll use a list to create a queue.

import 'dart:collection';
import 'dart:io';

abstract class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  E? dequeue() => (isEmpty) ? null : _list.removeAt(0);
  @override
  bool get isEmpty => _list.isEmpty;
  @override
  E? get peek => (isEmpty) ? null : _list.first;
  @override
  String toString() => _list.toString();
}

// In this challenge, you must first implement a queue using two stacks.
// Then process  queries, where each query is one of the following  types:

// 1 x: Enqueue element  into the end of the queue.
// 2: Dequeue the element at the front of the queue.
// 3: Print the element at the front of the queue.
// Input Format

// The first line contains a single integer, ,
//denoting the number of queries.
// Each line  of the  subsequent lines contains a single query
//in the form described in the problem statement above.
//All three queries start with an integer denoting the query ,
//but only query  is followed by an additional space-separated value, ,
// denoting the value to be enqueued.

class MyQueue {
  List<int> stack1 = [];
  List<int> stack2 = [];
  //ENQUEUE
  void enqueue(int x){
    stack1.add(x);
  }
  int dequeue(){
    if(stack2.isEmpty){
      while(stack1.isNotEmpty){
        stack2.add(stack1.removeLast());
      }
    }
     return stack2.removeLast();
  }
  int peek(){
    if(stack2.isEmpty){
      while(stack1.isNotEmpty){
        stack2.add(stack1.removeLast());
      }
    }
    return stack2.last;
  }
}
void main() {
  int n = int.parse(stdin.readLineSync()!); // Number of queries
  MyQueue queue = MyQueue();

  for (int i = 0; i < n; i++) {
    List<String> query = stdin.readLineSync()!.split(' ');
    if (query[0] == '1') {
      int x = int.parse(query[1]);
      queue.enqueue(x);
    } else if (query[0] == '2') {
      queue.dequeue();
    } else if (query[0] == '3') {
      int front = queue.peek();
      print(front);
    }
  }
}
