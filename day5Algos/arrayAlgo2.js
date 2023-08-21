
// Geek has N bricks. He needs to build a staircase consisting of k rows where
// the ith row has exactly i bricks. If he starts from the first row,
//find the number of complete rows of the staircase that he will be able to build completely.

// Input:
// N: 5
// Output: 2
// Explanation:
// Row 1: X
// Row 2: X X
// Row 3: X X
// Only 2 rows are complete.

// Example 2:

// Input:
// N: 8
// Output: 3
// Explanation:
// X
// X X
// X X X
// X X
// Only 3 rows are complete.


function countCompleteRows (N) {
  let k = 0 // The current row number
  let bricksUsed = 0 // Total number of bricks used so far
  while (bricksUsed <= N) {
    k++ // Move to the next row
    bricksUsed += k // Add bricks of the current row to the total
  }
  return k - 1 // Subtract 1 to get the number of complete rows
}

// Example usage
const N = 14
const completeRows = countCompleteRows(N)
console.log(`Number of complete rows that can be built: ${completeRows}`)
