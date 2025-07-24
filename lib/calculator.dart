class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';

    // Check for custom delimiter at the beginning
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts.first.substring(2); // Extract delimiter (e.g., "//;\n")
      numbers = parts.sublist(1).join('\n'); // Remainder is actual number string
    }

    // Normalize input by replacing newline with delimiter
    final parts = numbers.replaceAll('\n', delimiter).split(delimiter);

    // Parse all parts into integers, using 0 if parsing fails
    final parsedNumbers = parts.map((s) => int.tryParse(s.trim()) ?? 0).toList();

    // Find all negative numbers
    final negativeNumbers = parsedNumbers.where((n) => n < 0).toList();

    // Throw exception if any negative numbers exist
    if (negativeNumbers.isNotEmpty) {
      throw FormatException('Negative numbers not allowed: ${negativeNumbers.join(',')}');
    }

    // Return sum of all valid numbers
    return parsedNumbers.fold(0, (a, b) => a + b);
  }
}
