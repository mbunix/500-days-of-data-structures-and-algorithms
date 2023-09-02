// There are n children standing in a line. Each child is assigned 
//a rating value given in the integer array ratings.

// You are giving candies to these children subjected to the following requirements:

// Each child must have at least one candy.
// Children with a higher rating get more candies than their neighbors.
// Return the minimum number of candies you need to have to distribute the candies to the children.

public class Solution{

    public int Candy(int[] ratings){
        int[] candies = new int[ratings.Length];
        for(int i = 0; i < candies.Length; i++){
            candies[i] = 1;
        }
        for(int i = 1; i < candies.Length; i++){
            if(ratings[i] > ratings[i-1]){
                candies[i] = candies[i-1] + 1;
            }
        }
        for(int i = candies.Length - 2; i >= 0; i--){
            if(ratings[i] > ratings[i+1]){
                candies[i] = Math.Max(candies[i], candies[i+1] + 1);
            }
        }
        int sum = 0;
        foreach(int candy in candies){
            sum += candy;
        }
        return sum;
    }
}