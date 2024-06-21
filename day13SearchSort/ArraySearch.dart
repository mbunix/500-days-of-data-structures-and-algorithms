// You are given an array A consisting of n positive integers.
// In one operation, you can choose any index i such that 1 <= i <=n and Ai is even, then you can assign Ai = Ai / 2.

// Your task is to make total sum of array even using minimum number of operations (possibly 0) or return -1 if it is not possible.

// Example 1:

// Input:
// N = 5
// A[] = {1, 2, 1, 2, 1}
// Output: 1
// Explanation: Initially sum is 7
// which is odd. Assign A2 = A2/2
// then array becomes 1, 1, 1, 2, 1
// having sum 6 which is even. So total one
// operation is required which is minimum
// possible.

//solution

int MakeSumEven(List<int> A) {
  int sum = 0;
  int minOperation = 0;
  for (int i = 0; i < A.length; i++) {
    sum += A[i];
    if (A[i] % 2 == 1) {
      int count = 0;
      int temp = A[i];
      while (temp % 2 == 0) {
        temp ~/= 2;
        count++;
      }
      minOperation = (count > minOperation) ? count : minOperation;
    }
  }
  if (sum % 2 == 0) {
    return minOperation;
  } else if (minOperation > 0) {
    return minOperation;
  }else{
    return -1;
  }
}

void main() {
  List<int> A = [1, 5, 1, 2, 1];
  print(MakeSumEven(A));
}
//Explanation 
// The idea is to first check if the total sum of the array is already even. If it is, then we don't need to do any operation and we can return 0.

// Step 1: Initialize variables

// Initialize sum to 0 (to keep track of the total sum of the array).
// Initialize minOperations to 0 (to count the minimum number of operations needed).
// Step 2: Loop through the array

// For each element A[i] in the array:
// Add A[i] to sum.
// If A[i] is even:
// Check how many times it can be divided by 2. Let's call this count.
// Update minOperations by taking the maximum of minOperations and count.
// Step 3: Check if the total sum is even

// If sum is already even, return minOperations.
// If sum is odd and minOperations is greater than 0, return minOperations.
// Otherwise, return -1 because it's not possible to make the sum even.