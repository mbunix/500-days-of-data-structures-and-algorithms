// You are given an array prices where prices[i] is the price of a given stock on the ith day.

// You want to maximize your profit by choosing a single day to buy 
//one stock and choosing a different day in the future to sell that stock.

// Return the maximum profit you can achieve from this transaction. 
//If you cannot achieve any profit, return 0.
// i need the step  by step explanation  and implementation in dart

// Solution 
// We need to find the maximum profit that can be achieved
// by buying a stock on one day and selling it on a future day.
// To maximize profit, we want to buy at the lowest price and sell at the highest price.
// We can use a variable to keep track of the minimum price encountered so far and another
// variable to keep track of the maximum profit we can achieve.
// Iterate through the prices array and for each price:
// Check if the current price is lower than the minimum price seen so far. 
//If so, update the minimum price. Calculate the potential profit we can achieve 
//if we sell the stock on the current day (current price - minimum price).
// Update the maximum profit if the potential profit is greater than the current maximum profit.
// After iterating through the entire array, the maximum profit will be stored in the maximum profit variable.

int maxProfit(List<int> prices) {
  int minPrice = prices[0];
  int maxProfit = 0;
  for (int i = 1; i < prices.length; i++) {
    if (prices[i] < minPrice) {
      minPrice = prices[i];
    } else if (prices[i] - minPrice > maxProfit) {
      maxProfit = prices[i] - minPrice;
    }
  }
  return maxProfit;
}