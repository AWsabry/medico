import 'package:flutter/material.dart';
import 'package:medico_app/constants.dart';
import 'package:medico_app/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ambulance quick Call",
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
      body: Body(),
    );
  }
}
