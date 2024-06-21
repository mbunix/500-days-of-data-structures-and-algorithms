using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace 50-days-of-dart-data-structures-and-algorithms.c#Comeback
{
    public class ArraySort
{
    static int BinarySearch(int[] arr, int target)
    {
        int left = 0;
        int right = arr.Length - 1;
        while (left <= right)
        {
            int mid = left + (right - left) / 2;
            // check if targret is present in the middle
            if (arr[mid] == target)
            return mid;
            // if targret is greater, ignore left half
            else if (arr[mid] < target)
            left = mid + 1;
            // if targret is smaller, ignore right half
            else right = mid - 1;
        }
        return -1;
    }
    static void Main(string[] args)
    {
        int[] arr = { 1, 3, 7, 9, 11, 12, 45 };
        int target = 9;
        int result = BinarySearch(arr, target);
        if (result == -1)
        Console.WriteLine("Element not present");
        else
        Console.WriteLine("Element found at index " + result);
}
}