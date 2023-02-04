import 'package:flutter/material.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/widget/my_text.dart';
import 'package:food_order_app/widget/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void customAlertDialog(
    {required String message,
    required BuildContext context,
    String? title,
    FontWeight? messageFontWeight,
    required VoidCallback onClick}) {
  bool isTitleRequired = false;
  if (title != null) {
    isTitleRequired = true;
  }

  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: isTitleRequired
          ? Wrap(
              direction: Axis.horizontal,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: MyText(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      text: title.toString(),
                      textAlignment: TextAlign.center,
                    )),
              ],
            )
          : null,
      content: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
              alignment: Alignment.center,
              child: MyText(
                color: Colors.grey,
                fontWeight: messageFontWeight ?? FontWeight.w400,
                text: message.toString(),
                textAlignment: TextAlign.center,
              )),
        ],
      ),
      alignment: Alignment.center,
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  height: 45.0,
                  btnText: 'Cancel',
                  disablePadding: true,
                  color: buttonBackgroundGrey,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: PrimaryButton(
                  onPressed: () => onClick.call(),
                  height: 45.0,
                  disablePadding: true,
                  btnText: 'confirm',
                  textColor: white,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
