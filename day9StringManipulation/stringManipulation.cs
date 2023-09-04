// A binary gap within a positive integer N
//  is any maximal sequence of consecutive zeros that is surrounded by ones
//   at both ends in the binary representation of N.
// For example, number 9 has binary representation 1001 
// and contains a binary gap of length 2. The number 529 has binary 
// representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. 
// The number 20 has binary representation 10100 and contains one binary gap of length 1. 
// The number 15 has binary representation 1111 and has no binary gaps.
//  The number 32 has binary representation 100000 and has no binary gaps.

public class Solution{
    public int solution(int N){
        int maxGap = 0;
        int currentGap = 0;
        bool counting = false;
        while(N > 0){
            if(N % 2 == 1){
                counting = true;
                if(currentGap > maxGap){
                    maxGap = currentGap;
                }
                currentGap = 0;
            }else{
                if(counting){
                    currentGap++;
                }
            }
            N = N / 2;
        }
        return maxGap;
    }
}
//explanation 
// 1. convert the number to binary
// 2. find the longest gap
// 3. return the longest gap
// 4. if there is no gap return 0
// 5. if there is no 1 return 0
// 6. if there is no 0 return 0
