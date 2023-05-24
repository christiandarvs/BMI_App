import 'package:bmi_app/bmi_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String feedback;
  final String bmi;
  final Gender gender;
  final int birthYear;
  final String classification;
  const ResultsPage(
      {super.key,
      required this.bmi,
      required this.feedback,
      required this.birthYear,
      required this.gender,
      required this.classification});

  @override
  Widget build(BuildContext context) {
    int age = DateTime.now().year - birthYear;
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Results'),
        ),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  classification,
                  style: GoogleFonts.poppins(
                      color: const Color(0xff67932e),
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BMI:',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(style: kBmiResultsTheme, children: [
                        TextSpan(text: '$bmi kg/m'),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(4, -20.0),
                            child: Text(
                              '2',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff67932e),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'What does this mean?',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  feedback,
                  style: GoogleFonts.poppins(wordSpacing: 3),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: const Color(0xfff7f9fc),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Other Details',
                            style: kTextHeadingTheme,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Age: $age',
                            style: kTextLabelTheme,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            gender == Gender.male
                                ? 'Gender: Male'
                                : 'Gender: Female',
                            style: kTextLabelTheme,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
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
                'RECALCULATE BMI',
                style: kFabTextColor,
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
