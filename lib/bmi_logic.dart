// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class BMI {
  double height;
  double weight;
  late double bmi;
  BMI({required this.weight, required this.height}) {
    bmi = weight / pow(height / 100, 2);
  }
  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getFeedback() {
    if (bmi < 18.5) {
      return 'Your BMI indicates that you fall into the underweight category. It\'s essential to ensure you maintain a healthy weight to support your overall well-being. We recommend consulting with a healthcare professional to evaluate any underlying factors and develop a plan that focuses on balanced nutrition and gradual weight gain.';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Congratulations! Your BMI falls within the normal weight range. This indicates that you have a healthy balance between your weight and height. It\'s crucial to maintain this level and continue practicing a healthy lifestyle, which includes a well-rounded diet and regular physical activity.';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'Your BMI suggests that you are in the overweight range. While it\'s important to remember that BMI is a general measure and may not capture individual differences, this category indicates the need to focus on adopting healthier habits. Incorporating regular exercise, making mindful food choices, and consulting with a healthcare professional or a registered dietitian can provide you with guidance and support to achieve a healthier weight.';
    } else {
      return 'Your BMI indicates that you are in the obese category. This suggests a higher risk for various health conditions. It\'s crucial to take steps towards a healthier lifestyle by incorporating regular physical activity, making informed dietary choices, and seeking professional guidance. We recommend consulting with a healthcare provider who can help create a personalized plan to improve your health and manage your weight.';
    }
  }

  String getClassification() {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
