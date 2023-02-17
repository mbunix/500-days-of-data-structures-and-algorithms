// You are given an integer array height of length n.
//There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i])
// Find two lines that together with the x-axis form a container,
//such that the container contains the most water
// Return the maximum amount of water a container can store
// Notice that you may not slant the container.

// ignore_for_file: unused_element

import 'dart:math';

void main() {
  int maxArea(List<int> height) {
    int maxArea = 0;
    int left = 0;
    int right = height.length - 1;

    while (left < right) {
      int resultArea = (right - left) * min(height[left], height[right]);
      maxArea = max(maxArea, resultArea);
      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }
    height = [15, 43, 5, 47, 8, 3, 17];

    print(maxArea);
    return maxArea;
  }
}
