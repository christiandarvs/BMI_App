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
  TextEditingController heightFeetController = TextEditingController();
  TextEditingController heightInchesController = TextEditingController();
  TextEditingController heightCmController = TextEditingController();

  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Height'),
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedHeight = Height.feet;
                            });
                            debugPrint('$selectedHeight');
                          },
                          style: ButtonStyle(
                            backgroundColor: selectedHeight == Height.feet
                                ? const MaterialStatePropertyAll(
                                    Color(0xff768ba7))
                                : const MaterialStatePropertyAll(Colors.white),
                          ),
                          child: Text(
                            'feet',
                            style: TextStyle(
                                color: selectedHeight == Height.feet
                                    ? Colors.white
                                    : const Color(0xffb3bdcc)),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedHeight = Height.meter;
                            });
                            debugPrint('$selectedHeight');
                          },
                          style: ButtonStyle(
                            backgroundColor: selectedHeight == Height.meter
                                ? const MaterialStatePropertyAll(
                                    Color(0xff768ba7))
                                : const MaterialStatePropertyAll(Colors.white),
                          ),
                          child: Text(
                            'meter',
                            style: TextStyle(
                                color: selectedHeight == Height.meter
                                    ? Colors.white
                                    : const Color(0xffb3bdcc)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 60,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: heightFeetController,
                        decoration: const InputDecoration(
                            fillColor: Color(0xfff7f9fc),
                            filled: true,
                            border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('feet'),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 50,
                      height: 60,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: heightInchesController,
                        decoration: const InputDecoration(
                            fillColor: Color(0xfff7f9fc),
                            filled: true,
                            border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('inches'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 60,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: heightCmController,
                        decoration: const InputDecoration(
                            fillColor: Color(0xfff7f9fc),
                            filled: true,
                            border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Weight'),
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedWeight = Weight.kg;
                            });
                            debugPrint('$selectedHeight');
                          },
                          style: ButtonStyle(
                            backgroundColor: selectedWeight == Weight.kg
                                ? const MaterialStatePropertyAll(
                                    Color(0xff768ba7))
                                : const MaterialStatePropertyAll(Colors.white),
                          ),
                          child: Text(
                            'kg',
                            style: TextStyle(
                                color: selectedWeight == Weight.kg
                                    ? Colors.white
                                    : const Color(0xffb3bdcc)),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedWeight = Weight.lb;
                            });
                            debugPrint('$selectedHeight');
                          },
                          style: ButtonStyle(
                            backgroundColor: selectedWeight == Weight.lb
                                ? const MaterialStatePropertyAll(
                                    Color(0xff768ba7))
                                : const MaterialStatePropertyAll(Colors.white),
                          ),
                          child: Text(
                            'lb',
                            style: TextStyle(
                                color: selectedWeight == Weight.lb
                                    ? Colors.white
                                    : const Color(0xffb3bdcc)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          debugPrint(
              '${heightFeetController.text} ${heightInchesController.text}');
        },
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
