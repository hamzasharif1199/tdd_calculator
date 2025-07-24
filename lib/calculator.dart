class StringCalculator {
  int add(String numbers) {
    // Return 0 for empty input
    if (numbers.isEmpty) return 0;

    String delimiter = ','; // default delimiter
    String numberString = numbers;

    // Check if input starts with custom delimiter syntax
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2); // extract custom delimiter
      numberString = parts.sublist(1).join('\n'); // join remaining lines
    }

    // Normalize newlines to use the same delimiter
    numberString = numberString.replaceAll('\n', delimiter);

    // Split numbers using delimiter, parse to int, and sum
    return numberString
        .split(delimiter)
        .map((s) => int.tryParse(s.trim()) ?? 0) // handle invalid integers safely
        .fold(0, (a, b) => a + b);
  }
}
