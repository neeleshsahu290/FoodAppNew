import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/constants/assets.dart';
import 'package:food_order_app/constants/dimensions.dart';
import 'package:food_order_app/util/utils.dart';
import 'package:food_order_app/widget/my_text.dart';
import 'package:food_order_app/widget/primary_button.dart';
import 'package:food_order_app/widget/primary_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';


final loderProvider =
    StateProvider.autoDispose<bool>((ref) {
  return false;
});
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(mainHozPadd),
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyText(
                      text: "Sign in",
                      fontSize: 22.sp,
                      color: commonTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyText(
                      text:
                          "Acesss to get best produts at yoout home with our best services",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      textAlignment: TextAlign.center,
                      color: commonTextGreyColor,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PrimaryTextField(
                              controller: _emailController,
                              label: 'Email',
                              isLabelReq: true,
                              hintText: 'Enter Email',
                              hasContentPadding: false,
                              validator: (str) {
                                if (str?.trim().isEmpty == true) {
                                  return "Email address is required.";
                                } else if (!isValidEmail(str)) {
                                  return "Enter valid email Id";
                                } else {
                                  return null;
                                }
                              },
                              isCheckoutForm: true),
                          const SizedBox(
                            height: 10.0,
                          ),
                          PrimaryTextField(
                            controller: _passwordController,
                            label: 'Password',
                            isLabelReq: true,
                            hintText: 'Enter Password',
                            isCheckoutForm: true,
                            validator: (str) {
                              if (str?.trim().isEmpty == true) {
                                return "Password is required.";
                              } else if (str != null && str.trim().length < 6) {
                                return "Password must be greater than 6 characters";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Consumer(builder: (context, ref, child) =>PrimaryButton(
                      disablePadding: true,
                      color: purpleColor,
                      onPressed: () async{
                         ref
                                          .read(loderProvider
                                              .notifier)
                                          .state =
                                      !ref.read(loderProvider);
                        if (_formkey.currentState!.validate()) {
                         
                         await Future.delayed(const Duration(seconds: 2));

                          check.fire();
                          await Future.delayed(const Duration(seconds: 2));
                          ref
                                          .read(loderProvider
                                              .notifier)
                                          .state =
                                      !ref.read(loderProvider);
                        }else{
                         await Future.delayed(const Duration(seconds: 1));
                                                   
                          error.fire();
                          await Future.delayed(const Duration(seconds: 1));

                          ref
                                          .read(loderProvider
                                              .notifier)
                                          .state =
                                      !ref.read(loderProvider);
                        }
                      },
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.forward, color: purpleColorDark),
                            const SizedBox(
                              width: 5.0,
                            ),
                            MyText(
                              text: "Sign in",
                              fontSize: 16.sp,
                              color: white,
                            ),
                          ]),
                    ) ,),
                    
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyText(
                      text: 'OR',
                      color: commonTextGreyColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyText(
                        text: 'Sign Up with Google or Apple',
                        color: commonTextGreyColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
            ),
            Consumer(builder: (context, ref, child) => ref.watch(loderProvider)?Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: RiveAnimation.asset(
                              loadingIcon,
                              onInit: (artboard) {
                  StateMachineController? controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: "State Machine 1");
                  if (controller != null) {
                    check = controller.findSMI('Check') as SMITrigger;
                    error = controller.findSMI('Error') as SMITrigger;
                    reset = controller.findSMI('Reset') as SMITrigger;
                  }
                              },
                            ),
                )):const SizedBox.shrink())
            ,
          ],
        ),
      ),
    );
  }
}
