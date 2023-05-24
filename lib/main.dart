import 'package:bmi_app/constants.dart';
import 'package:bmi_app/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffF8F1F1),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              titleTextStyle: kAppbarTextTheme,
              color: kFabBgColor)),
      title: 'Material App',
      home: const OnboardingPage(),
    );
  }
}
