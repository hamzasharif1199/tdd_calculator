class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numberString = numbers;

    // Check for custom delimiter at the beginning
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2); // extract delimiter from "//;\n"
      numberString = parts[1]; // numbers part
    }

    // Replace \n with delimiter to support both
    numberString = numberString.replaceAll('\n', delimiter);

    return numberString
        .split(delimiter)
        .map((s) => int.tryParse(s.trim()) ?? 0)
        .fold(0, (a, b) => a + b);
  }
}
