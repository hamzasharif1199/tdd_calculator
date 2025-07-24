class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts.first.substring(2); // custom delimiter
      numbers = parts.sublist(1).join('\n');
    }

    // Replace \n with delimiter for uniform splitting
    final parts = numbers.replaceAll('\n', delimiter).split(delimiter);

    final parsedNumbers = parts.map((s) => int.tryParse(s.trim()) ?? 0).toList();

    // Check for negatives
    final negativeNumbers = parsedNumbers.where((n) => n < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      throw FormatException('Negative numbers not allowed: ${negativeNumbers.join(',')}');
    }

    return parsedNumbers.fold(0, (a, b) => a + b);
  }
}
