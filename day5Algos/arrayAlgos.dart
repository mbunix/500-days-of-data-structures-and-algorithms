// Given an integer array nums and an integer val, remove all occurrences of val in nums in-place.
//The order of the elements may be changed.
// Then return the number of elements in nums which are not equal to val.
// Consider the number of elements in nums which are not equal to val be k,
//to get accepted, you need to do the following things:
// Change the array nums such that the first k elements of nums contain the elements which are not equal to val.
//The remaining elements of nums are not important as well as the size of nums.
// Return k.

int removeElement(List<int> nums, int val) {
  int i = 0;
  int j = 0;
  for (j = 0; j < nums.length; j++) {
    if (nums[j] != val) {
      nums[i] = nums[j];
      i++;
    }
  }
  return i;
}

// validation of the solution
void main() {
  List<int> nums = [3, 2, 2, 3];
  int val = 3;
  List<int> expectedNums = [2, 2];
  int k = removeElement(nums, val);
  assert(k == expectedNums.length);
  nums.sort();
  for (int i = 0;i<k ;i++) {
    assert(nums[i] == expectedNums[i]);
  }
}
