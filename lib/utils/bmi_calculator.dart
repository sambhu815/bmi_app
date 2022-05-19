import 'dart:math';

class BMICalculator {
  final int height;
  final int weight;
  double bmi = 0.0;

  BMICalculator({required this.height, required this.weight});

  String calculate() {
    bmi = weight / (pow(height / 100, 2));
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Nomral";
    } else {
      return "Underweight";
    }
  }

  String getInterpreparation() {
    if (bmi >= 25) {
      return "You have a higher than normal bodyweight";
    } else if (bmi > 18.5) {
      return "You have a normal bodyweight. Good job!";
    } else {
      return "You have a lower than normal bodyweight. Try to eat more.";
    }
  }
}
