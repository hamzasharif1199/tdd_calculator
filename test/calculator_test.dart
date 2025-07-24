import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_calculator/calculator.dart';

void main() {

  group('StringCalculator - TDD', () {
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

    test('should handle newlines as delimiters along with commas', () {
      final calculator = StringCalculator();
      expect(calculator.add("1\n2,3"), 6); // RED: Fails initially
    });

    test('Supports custom delimiter like ";"', () {
      final calculator = StringCalculator();
      expect(calculator.add("//;\n1;2"), 3); // RED
    });

    test('should throw exception when negative numbers are used', () {
      final calculator = StringCalculator();
      expect(() => calculator.add("1,-2,-3"), throwsA(predicate((e) =>
      e is FormatException && e.message == 'Negative numbers not allowed: -2,-3')));
    });



  });
}