// There are n gas stations along a circular route, where the amount of gas at the ith station is gas[i].

// You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from the ith station to its next (i + 1)th station. 
// You begin the journey with an empty tank at one of the gas stations.

// Given two integer arrays gas and cost, return the starting gas station's 
// index if you can travel around the circuit once in the clockwise direction, 
// otherwise return -1. If there exists a solution, it is guaranteed to be unique

//PSEUDOCODE:
//Calculate the differences and store them in the 'diff' array.
// If the sum of 'diff' is negative:
//     Return - 1(no solution).

// Initialize 'total' and 'start' to 0.

// For i = 0 to n-1:
//     Add diff[i] to 'total'.
//     If 'total' becomes negative:
//         Update 'start' to (i + 1) and reset 'total'.

// If 'total' is non-negative:
//     Return 'start' as the solution.

// Return -1 (no solution).
// consider checking whether it's possible to complete the circuit by iterating through all possible starting points. 

//solution
public class Solution
{
    public int CanCompleteCircuit(int[] gas, int[] cost)
    {
        int n = gas.Length;
        int total = 0;
        int currentSum = 0;
        int start = 0;

        for (int i = 0; i < n; i++)
        {
            int diff = gas[i] - cost[i];
            total += diff;
            currentSum += diff;

            if (currentSum < 0)
            {
                currentSum = 0;
                start = i + 1;
            }
        }

        return total >= 0 ? start : -1;
    }
}
