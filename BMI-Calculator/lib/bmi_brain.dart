import 'dart:math' as math;

class BmiBrain {
  BmiBrain({required this.weight, required this.height});

  double weight;
  double height;

  double _result = 0.0;

  String calculateBMI() {
    _result = weight / math.pow(height / 100, 2);
    return _result.toStringAsFixed(2);
  }

  String bmiResult() {
    if (_result < 25) {
      return 'Normal';
    } else if (_result >= 25 && _result <= 29) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String bmiInterpretation() {
    if (_result < 25) {
      return 'You have a normal body weight. Good job!';
    } else if (_result >= 25 && _result <= 29) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else {
      return 'You have an abnormal or excessive fat accumulation that presents a risk to health. ';
    }
  }
}
