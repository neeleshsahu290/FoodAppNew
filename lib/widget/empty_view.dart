import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'primary_button.dart';

class EmptyView extends StatelessWidget {
  final String? message, btnText;
  final VoidCallback? onPressed;
  const EmptyView({Key? key, this.message, this.btnText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(.emptyBoxIcon),
          const SizedBox(height: 32.0),
          const Text(
            "It's empty in here",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          if (message != null)
            Text(
              message ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: commonTextGreyColor,
              ),
            )
          else
            const SizedBox(),
          const SizedBox(height: 10.0),
          if (btnText != null)
            PrimaryButton(
              btnText: btnText!,
              width: MediaQuery.of(context).size.width * .5,
              onPressed: onPressed,
            )
          else
            const SizedBox()
        ],
      ),
    );
  }
}
