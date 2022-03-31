import 'package:flutter/material.dart';
import 'package:medico_app/constants.dart';
import 'package:medico_app/coustom_bottom_nav_bar.dart';
import 'package:medico_app/default_button.dart';
import 'package:medico_app/enums.dart';

class HistoryBase extends StatefulWidget {
  static String routeName = "/history";

  const HistoryBase({Key? key}) : super(key: key);

  @override
  State<HistoryBase> createState() => _HistoryBaseState();
}

int _index = 0;

class _HistoryBaseState extends State<HistoryBase> {
  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {
      // Create button
      Widget okButton = TextButton(
        child: const Text(
          "Upload",
          style: TextStyle(color: kPrimaryColor),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      Widget cancel = TextButton(
        child: const Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // Create AlertDialog
      AlertDialog alert = AlertDialog(
        title: const Text(
          "Upload Your Document Yourself",
          style: TextStyle(color: kSecondaryColor),
        ),
        content: const Text("Upload in doc or image."),
        actions: [
          okButton,
          cancel,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.history),
      appBar: AppBar(
        title: const Text(
          "Medical History",
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
      body: Theme(
        data: ThemeData(
            primaryColor: const Color.fromRGBO(254, 64, 102, 1),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: const Color.fromRGBO(254, 64, 102, 1))
                .copyWith(secondary: Colors.black)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stepper(
                currentStep: _index,
                onStepCancel: () {
                  if (_index > 0) {
                    setState(() {
                      _index -= 1;
                    });
                  }
                },
                onStepContinue: () {
                  if (_index <= 0) {
                    setState(() {
                      _index += 1;
                    });
                  }
                },
                onStepTapped: (int index) {
                  setState(() {
                    _index = index;
                  });
                },
                steps: <Step>[
                  Step(
                    isActive: true,
                    title: const Text('Medical Report uploaded'),
                    content: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Uploaded medical report')),
                  ),
                  const Step(
                    isActive: true,
                    title: Text('Prescription uploaded'),
                    content: Text('Tap to download'),
                  ),
                  const Step(
                    isActive: true,
                    title: Text('Prescription uploaded'),
                    content: Text('Tap to download'),
                  ),
                  const Step(
                    isActive: true,
                    title: Text('Prescription uploaded'),
                    content: Text('Tap to download'),
                  ),
                  const Step(
                    isActive: true,
                    title: Text('Prescription uploaded'),
                    content: Text('Tap to download'),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: DefaultButton(
                  text: "Upload YourSelf",
                  press: () {
                    showAlertDialog(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
