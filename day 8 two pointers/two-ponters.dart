// Given an integer array nums sorted in non-decreasing order,
// remove some duplicates in-place such that each unique element
// appears at most twice. The relative order of the elements should
//be kept the same.
// Since it is impossible to change the length of the array in
// some languages, you must instead have the result be placed in
// the first part of the array nums. More formally,
//if there are k elements after removing the duplicates,
//then the first k elements of nums should hold the final result.
// It does not matter what you leave beyond the first k elements.
// Return k after placing the final result in the first k slots of
// nums.

int removeDuplicates(List<int> nums) {
// If the length of the nums list is less than or equal to 2, there are no duplicates to remove,
// so we simply return the length of the list as it is.
  if (nums.length <= 2) {
    return nums.length;
  }
  // We initialize the slow pointer to 2.
  //This pointer keeps track of the position where the next unique
  //element should be placed in the modified list.
  int slow = 2;
  // We iterate over the list using
  //the fast pointer starting from index 2 (fast = 2)
  for (int fast = 2; fast < nums.length; fast++) {
    //If the element at the current index (nums[fast]) is not equal to 
    //the element at the slow pointer minus 2 (nums[slow - 2]), 
    //it means we have encountered a new unique element. 
    //In this case, we move this element to the slow pointer position in the list 
    //and increment both the slow and fast pointers.
    if (nums[fast] != nums[slow - 2]) {
      nums[slow] = nums[fast];
      slow++;
    }
  }
  return slow;
}
