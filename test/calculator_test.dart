import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_calculator/calculator.dart';

void main() {

  group('StringCalculator - TDD', () {
    test('Empty string should return 0', () {
      final calculator = StringCalculator();
      expect(calculator.add(''), 0);
    });
    // Step 1
    test('should return the number when one number is passed', () {
      final calculator = StringCalculator();
      expect(calculator.add("1"), 1);
    });

    // Step 2
    test('Multiple numbers should return their sum', () {
      final calculator = StringCalculator();
      expect(calculator.add("1,2,3,4,5"), 15); // RED
    });

    // Step 3
    test('should handle newlines as delimiters along with commas', () {
      final calculator = StringCalculator();
      expect(calculator.add("1\n2,3"), 6); // RED: Fails initially
    });

    // Step 4
    test('Supports custom delimiter like ";"', () {
      final calculator = StringCalculator();
      expect(calculator.add("//;\n1;2"), 3); // RED
    });
    //Step 5
    test('should throw exception when negative numbers are used', () {
      final calculator = StringCalculator();
      expect(() => calculator.add("1,-2,-3"), throwsA(predicate((e) =>
      e is FormatException && e.message == 'Negative numbers not allowed: -2,-3')));
    });



  });
}