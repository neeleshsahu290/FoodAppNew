import 'package:flutter/material.dart';

import '../widget/my_text.dart';
import '../widget/ripple.dart';

showProgressDialog(context, {Widget? child}) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child ?? const CircularProgressIndicator(),
        ),
      ),
    ),
  );
}

showLoaderDialog(BuildContext context, var msg) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: MyText(
              text: msg,
            ),
          ),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(onWillPop: () => Future.value(false), child: alert);
    },
  );
}

showCustomDialog(context, {message, onClose}) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: Container(
        margin: const EdgeInsets.all(24.0),
        width: double.infinity,
        height: 220.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SvgPicture.asset(Assets.keyIcon, width: 72.0, height: 72.0),
                  const SizedBox(height: 24.0),
                  MyText(
                    text: message,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    textAlignment: TextAlign.center,
                  )
                ],
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Ripple(
                onTap: onClose,
                child: const Icon(
                  Icons.close_rounded,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

showSnackBar(BuildContext context, {required String message}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      // action: SnackBarAction(
      //     label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

// showToast(
//   message, {
//   gravity = ToastGravity.BOTTOM,
//   length = Toast.LENGTH_LONG,
//   backgroundColor = Colors.black,
//   textColor = Colors.white,
//   double? textSize,
// }) {
//   return Fluttertoast.showToast(
//       msg: message ?? "",
//       toastLength: length,
//       gravity: gravity,
//       timeInSecForIosWeb: 1,
//       backgroundColor: backgroundColor,
//       textColor: textColor,
//       fontSize: textSize ?? 14.0);
// }

void removeFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

