// Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced. For example: // 1
// h((e))llo(world)() // balanced parentheses

// (hello world // unbalanced parentheses

// Approach
// Initialize an empty stack.
// Iterate through each character in the string:
// If the character is an opening parenthesis (i.e., '('), push it onto the stack.
// If the character is a closing parenthesis (i.e., ')'):
// If the stack is empty, return false (unbalanced parentheses).
// If the top of the stack is an opening parenthesis, pop it from the stack.
// If the top of the stack is not an opening parenthesis, return false (unbalanced parentheses).
// After iterating through all characters, if the stack is empty, return true (balanced parentheses). Otherwise, return false (unbalanced parentheses).

// Time Complexity: O(n)
// Space Complexity: O(n)

bool areParanthessBalanced(String string) {
  final stack = <String>[];
  final openingParentheses = ['(', '{', '['];
  final closingParentheses = [')', '}', ']'];

  for (final char in string.runes.map((rune) => String.fromCharCode(rune))) {
    if (openingParentheses.contains(char)) {
      stack.add(char);
    } else if (closingParentheses.contains(char)) {
      if (stack.isEmpty) {
        return false;
      }
      final top = stack.removeLast();
      if (closingParentheses.indexOf(top) != openingParentheses.indexOf(char)) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}
void main() {
  print(areParanthessBalanced("h((e))llo(world)()")); // true
  print(areParanthessBalanced("(hello world")); // false
}
