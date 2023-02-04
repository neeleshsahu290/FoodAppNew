import 'package:flutter/material.dart';

import '../constants/constant.dart';
import 'my_text.dart';
import 'primary_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    required this.errorMsg,
    required this.onRetryPress,
  }) : super(key: key);

  final String? errorMsg;
  final VoidCallback onRetryPress;

  @override
  Widget build(BuildContext context) {
    return Container( height: double.infinity,width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.error_rounded,
                size: 72,
              ),
              MyText(
                text: errorMsg ?? failureMessage,
                fontSize: 25.0,
                textAlignment: TextAlign.center,
              ),
              PrimaryButton(
                btnText: "Retry",
                disablePadding: false,
                onPressed: onRetryPress,
              )
            ],
          ),
        ),
      ),
    );
  }
}
