// A left rotation operation on an array of size n  shifts each of the array's elements  1 unit to the left. Given an integer,d , rotate the array that many steps left and return the result
// example
// d=2
// arr =[1,2,3,4,5]
// after 2 rottations  arr' =[3,4,5,1,2]

function Leftrotation(arr, d) {
    rotatedArray = [];
    const rotations = d % arr.length
    for (i = rotations; i < arr.length; i++){
        rotatedArray.push(arr[i])
    }
    for (i = 0; i < rotations; i++){
        rotatedArray.push(arr[i])
    }
    return rotatedArray
    
}

// a more efficient solution
function Leftrotation(arr, d) {
    
}