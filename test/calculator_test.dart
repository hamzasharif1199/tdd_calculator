import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_calculator/calculator.dart';

void main() {

  group('StringCalculator - TDD Step 1', () {
    test('should return the number when one number is passed', () {
      final calculator = StringCalculator();
      expect(calculator.add("1"), 1);
    });
    test('Empty string should return 0', () {
      final calculator = StringCalculator();
      expect(calculator.add(''), 0);
    });

    test('Multiple numbers should return their sum', () {
      final calculator = StringCalculator();
      expect(calculator.add("1,2,3,4,5"), 15); // RED
    });
  });
}