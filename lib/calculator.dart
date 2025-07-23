class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    return numbers
        .split(',')
        .map((s) => int.tryParse(s.trim()) ?? 0) // fallback to 0 for invalid input
        .fold(0, (a, b) => a + b);
  }

}
