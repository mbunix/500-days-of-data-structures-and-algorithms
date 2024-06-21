// Given an integer array nums, rotate the array to the right by k steps,
// where k is non-negative.

// solution explanation
// The rotateArray function takes two parameters: nums,
//the integer array to be rotated, and k, the number of steps to rotate the array to the right.
// We handle the case where k is greater than the length of
// the array by taking the modulo of k with the length of the array.
//This ensures that we perform only the necessary number of rotations,
// and we don't rotate the array more than needed.
// To rotate the array, we perform three reverse operations:

// a. First, we reverse the entire array.
//This effectively flips the array elements from the last to the first position.

// b. Next, we reverse the first k elements of the array.
// This step places the first k elements at the end of the array.

// c. Finally, we reverse the remaining elements after the k elements.
// This step places the elements originally at the end back to their correct positions at the start of the array.

// The reverseList function is a helper function used to reverse a portion of the array.
// It takes three parameters: nums (the array), start (the index to start reversing from), and end (the index to stop reversing at).
//The function uses a two-pointer approach to swap elements and reverse the given portion of the array in-place.

void rotatedArray(List<int> nums, int K) {
  //when k is greater than array length
  K = K % nums.length;
  // reverse the array
  reverseList(nums, 0, nums.length - 1);

  /// reverse the first K elements
  reverseList(nums, 0, K - 1);
  //reverse the remaining elements after K
  reverseList(nums, K, nums.length - 1);
}

void reverseList(List<int> nums, int start, int end) {
  while (start < end) {
    int temp = nums[start];
    nums[start] = nums[end];
    nums[end] = temp;
    start++;
    end--;
  }
}
