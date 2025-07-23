class StringCalculator {
  /// Adds the numbers in a comma-separated string.
  /// Returns the total sum of all valid integers in the string.
  int add(String numbers) {
    // If the input is empty, return 0 as per the spec
    if (numbers.isEmpty) return 0;

    // Extract numbers from the string
    final numberList = _extractNumbers(numbers);

    // Sum all the numbers and return the result
    return numberList.fold(0, (sum, number) => sum + number);
  }

  /// Converts the input string into a list of integers.
  /// Splits the string by comma, trims each part,
  /// and parses it into an int (defaulting to 0 on failure).
  List<int> _extractNumbers(String numbers) {
    return numbers
        .split(',')                           // Split the string by commas
        .map((s) => int.tryParse(s.trim())    // Try to parse each number
        ?? 0)                             // Fallback to 0 if invalid
        .toList();                            // Convert the result into a list
  }
}
