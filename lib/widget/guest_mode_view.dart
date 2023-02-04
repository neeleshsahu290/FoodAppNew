import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'my_text.dart';
import 'primary_button.dart';

class GuestModeView extends StatelessWidget {
  const GuestModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "guestModeIcon",
          width: 200.0,
          height: 200.0,
        ),
        const SizedBox(height: 16.0),
        MyText(
          text: "Login Or Signup to access all the features of this app.",
          textAlignment: TextAlign.center,
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
        const SizedBox(height: 16.0),
        PrimaryButton(
          btnText: "Login/Sign Up",
          width: MediaQuery.of(context).size.width * .7,
          onPressed: () {
            // navigatorPush(context, Login());
          },
        )
      ],
    ));
  }
}
