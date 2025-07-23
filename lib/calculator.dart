class StringCalculator {
  /// Adds numbers in a string that may use commas or newlines as delimiters.
  /// Example: "1\n2,3" -> 6
  /// - Returns 0 if the input string is empty.
  /// - Ignores invalid numbers by treating them as 0.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Normalize input by replacing newline characters with commas
    final sanitized = numbers.replaceAll('\n', ',');

    // Split the string by comma, parse each number, and sum them
    return sanitized
        .split(',')
        .map((s) => int.tryParse(s.trim()) ?? 0)
        .fold(0, (sum, num) => sum + num);
  }
}
