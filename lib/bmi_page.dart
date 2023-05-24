import 'package:bmi_app/bmi_logic.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/results_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Height { feet, meter }

enum Weight { kg, lb }

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  Set<Gender> selection = <Gender>{Gender.male};
  Gender genderView = Gender.male;
  Height selectedHeight = Height.feet;
  Weight selectedWeight = Weight.kg;
  TextEditingController heightCM = TextEditingController();
  TextEditingController weightKG = TextEditingController();
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void displayCalendar() async {
      DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: currentDate,
          firstDate: DateTime(1960),
          lastDate: currentDate);

      if (newDate == null) {
        return;
      } else {
        setState(() {
          currentDate = newDate;
        });
      }
    }

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome! Let\'s assess your current BMI.',
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SegmentedButton(
                    segments: const [
                      ButtonSegment(
                          value: Gender.male,
                          label: Text('Male'),
                          icon: Icon(Icons.male)),
                      ButtonSegment(
                          value: Gender.female,
                          label: Text('Female'),
                          icon: Icon(Icons.female))
                    ],
                    selected: <Gender>{genderView},
                    onSelectionChanged: (Set<Gender> newSelection) {
                      setState(() {
                        genderView = newSelection.first;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(0xffd68f8a);
                          }
                          return Colors.white;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Height',
                    style: kTextHeadingTheme,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 90,
                        height: 60,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          controller: heightCM,
                          decoration: const InputDecoration(
                              fillColor: Color(0xfff7f9fc),
                              filled: true,
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('cm')
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Weight',
                    style: kTextHeadingTheme,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 90,
                        height: 60,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          controller: weightKG,
                          decoration: const InputDecoration(
                              fillColor: Color(0xfff7f9fc),
                              filled: true,
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('kg')
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Date of Birth',
                    style: kTextHeadingTheme,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        '${currentDate.month}/${currentDate.day}/${currentDate.year}',
                        style: GoogleFonts.poppins(fontSize: 18),
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          tooltip: 'Open Calendar',
                          onPressed: () async {
                            displayCalendar();
                          },
                          icon: const Icon(
                            Icons.calendar_month_outlined,
                            color: kFabBgColor,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            BMI bmi = BMI(
                height: double.parse(heightCM.text),
                weight: double.parse(weightKG.text));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    birthYear: currentDate.year,
                    gender: genderView,
                    bmi: bmi.calculateBMI(),
                    feedback: bmi.getFeedback(),
                    classification: bmi.getClassification(),
                  ),
                ));
          },
          label: Row(
            children: [
              Text(
                'Calculate My BMI',
                style: kFabTextColor,
              )
            ],
          ),
          backgroundColor: kFabBgColor,
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
