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

//Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that 
//each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
//Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
//Change the array nums such that the first k elements of nums contain the unique elements in the order
//they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
//Return k.
int removeDuplicates(List<int> nums) {
      if (nums.isEmpty || nums.length == 1) {
    return nums.length;
  }
        int i = 0;
  int j = 0;
  for (j = 0; j < nums.length; j++) {
    if (nums[j] != nums[i]) {
      i++;
      nums[i] = nums[j];
      
    }
  }
  return i+1;
  }

// validation of the solutionS
void main() {
   List<int> nums = [1, 1, 2, 2, 3, 4, 4, 4, 5, 6, 6];
  int k = removeDuplicates(nums);
  
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

