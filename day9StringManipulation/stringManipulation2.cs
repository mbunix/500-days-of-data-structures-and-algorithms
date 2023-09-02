// Write a function to find the longest common prefix string
//  amongst an array of strings.

// If there is no common prefix, return an empty string ""


public class Solution (){
    public string LongestCommonPrefix(string[] strs){
        if (strs.Length == 0){
            return "";
        }
        string prefix = strs[0];
        for (int i = 1; i < strs.Length; i++){
            while (strs[i].IndexOf(prefix) != 0){
                prefix = prefix.Substring(0, prefix.Length - 1);
                if (prefix == ""){
                    return "";
                }
            }
        }
        return prefix;
    }
}
