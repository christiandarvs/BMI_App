import 'package:bmi_app/bmi_page.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Lottie.asset(
                      'assets/images/143769-shoulder-press-exercise.json'),
                  const SizedBox(
                    height: 40,
                  ),
                  Text('Keep Track of Your Progress', style: kTextHeadingTheme),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Manage your weight, activity and water intake based on your BMI results for a healthier you!',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BMIPage(),
                ));
          },
          backgroundColor: kFabBgColor,
          label: Row(
            children: [
              Text(
                'Get Started',
                style: kFabTextColor,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Exit'),
              content: const Text('Are you sure you want to exit the app?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
    );
  }
}
