class StringCalculator {
  /// Adds numbers in a comma or newline separated string.
  /// Returns 0 for an empty string.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Replace all newlines with commas so we can split by a single delimiter
    final sanitized = numbers.replaceAll('\n', ',');

    // Split by comma and parse each number, falling back to 0 on invalid input
    return sanitized
        .split(',')
        .map((s) => int.tryParse(s.trim()) ?? 0)
        .fold(0, (a, b) => a + b);
  }
}
