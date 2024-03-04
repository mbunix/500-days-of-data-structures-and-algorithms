function countDistinctElements (arr) {
  let distinctCount = 0
  for (let i = 0; i < arr.length; i++) {
    let isDistinct = true
    for (let j = 0; j < i; j++) {
      if (arr[i] === arr[j]) {
        isDistinct = false
        break
      }
    }
    if (isDistinct) {
      distinctCount++
    }
  }
  return distinctCount
}

const A = [5, 2, 5, 7, 8, 5, 2, 6]
console.log(countDistinctElements(A)) // Output: 5
