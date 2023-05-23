import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender { male, female }

enum Height { feet, meter }

enum Weight { kg, lb }

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  Set<Gender> selection = <Gender>{Gender.male};
  Gender? selectedGender;
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'BMI Calculator',
                  style: kTextHeadingTheme,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome! Let\'s assess your current BMI.',
                  style: GoogleFonts.poppins(),
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
                  selected: selection,
                  onSelectionChanged: (Set<Gender> newSelection) {
                    setState(() {
                      selection = newSelection;
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
                Center(
                    child: Text(
                  '${currentDate.month}/${currentDate.day}/${currentDate.year}',
                  style: GoogleFonts.poppins(fontSize: 18),
                )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    displayCalendar();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: kFabBgColor),
                  child: Text(
                    'Open Calendar',
                    style: kFabTextColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            Text(
              'Calculate My BMI',
              style: kFabTextColor,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: kFabBgColor,
      ),
    );
  }
}
