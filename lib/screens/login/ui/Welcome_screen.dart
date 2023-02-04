import 'package:flutter/material.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/screens/login/widgets/sign_in.dart';
import 'package:food_order_app/widget/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryButton(
        btnText: 'Sign Up',
        onPressed: () {
          customSigninDialog(context);
        },
      ),
    );
  }

  Future<Object?> customSigninDialog(BuildContext context) {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'Signin',
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0.0, -1.0), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: redColor,
                    ),
                    margin: const EdgeInsets.all(25.0),
                    child: const SignIn()),
              ),
              Positioned(
                  bottom: 15.h - 15.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            border: Border.all(color: black, width: 0.1),
                            borderRadius: BorderRadius.circular(15.0)),
                        height: 30.0,
                        width: 30.0,
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
