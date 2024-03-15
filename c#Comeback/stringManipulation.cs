//given two strings,s1 and,s2 that may not be of the same length, 
//determine the minimum number of character deletions required to make  and  anagrams.
// Any characters can be deleted from either of the strings.
//Example.
//s1 =abc
//s2 =amnop
//The only characters that match are the a's so we have to remove  
//bc from s1  and mnop  from s2 for a total of 6 deletions.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace stringManipulation;
{
    class Program
{
    static void Main(string[] args)
    {
        string s1 = "abc";
        string s2 = "amnop";
        int result = makeAnagram(s1, s2);
        Console.WriteLine(result);
    }
    static int makeAnagram(string s1, string s2)
    {
        int[] freq = new int[26];
        for (int i = 0; i < s1.Length; i++)
        {
            freq[s1[i] - 'a']++;
        }
        for (int i = 0; i < s2.Length; i++)
        {
            freq[s2[i] - 'a']--;
        }
        int count = 0;
        for (int i = 0; i < 26; i++)
        {
            count += Math.Abs(freq[i]);
        }
        return count;
    }
}
}