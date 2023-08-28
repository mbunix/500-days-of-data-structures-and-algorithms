// Find the number of ways that a given integer,
//, can be expressed as the sum of the  powers of unique, natural numbers.
// For example, if  and , we have to find all combinations of unique
//squares adding up to 13. The only solution is 2*2+3*3=13.
// Function Description
// Complete the powerSum function in the editor below. It should return an integer
//that represents the number of possible combinations.
// powerSum has the following parameter(s):
// X: the integer to sum to
// N: the integer power to raise numbers to

import 'dart:math';

// int powerSum(int X, int N) {
//   // Write your code here
//   int countWays(int num, int sum) {
//     if (sum == X) {
//       return 1;
//     } else if (sum > X || num > (X / num)) {
//       return 0;
//     }
//     int ways = 0;
//     ways += countWays(num + 1, sum + (num.pow(N)).toInt());
//     ways += countWays(num + 1, sum);
//     return ways;
//   }

//   return countWays(1, 0);
// }
