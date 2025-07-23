import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_calculator/calculator.dart';

void main() {
  group('StringCalculator - TDD Step 1', () {
    test('Empty string should return 0', () {
      final calculator = StringCalculator();
      expect(calculator.add(''), 0);
    });
  });
}