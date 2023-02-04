import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_app/constants/assets.dart';
import 'package:food_order_app/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/app_color.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final Function()? onSuffixIconTap;
  final bool isPasswordField;
  final bool isCheckoutForm;
  final bool isReadOnly;
  final int? length;
  final Color backgroundColor;
  final double radius;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final Color? textColor;
  final bool hasContentPadding;
  final String? label;
  final bool isLabelReq;

  const PrimaryTextField(
      {Key? key,
      this.controller,
      this.inputType,
      this.obscureText = false,
      this.onChanged,
      this.validator,
      this.onSuffixIconTap,
      this.hintText,
      this.isPasswordField = false,
      this.isCheckoutForm = false,
      this.isReadOnly = false,
      this.length,
      this.inputFormatter,
      this.radius = 8.0,
      this.maxLines,
      this.textColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.hasContentPadding = true,
      this.isLabelReq=false,
      this.label
      
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        isLabelReq?Align(alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: MyText(text: label??"",color: commonTextColor,fontSize: 14.sp,fontWeight: FontWeight.w400,),
          ),
        ):SizedBox.shrink(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor,
          ),
          padding: (isCheckoutForm)
              ? const EdgeInsets.all(0)
              : const EdgeInsets.only(right: 24, left: 24),
          child: TextFormField(
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
            controller: controller,
            keyboardType: inputType,
            obscureText: obscureText,
            maxLines: maxLines,
            maxLength: length,
            onChanged: onChanged,
            readOnly: isReadOnly,
            validator: validator,
            inputFormatters: inputFormatter,
            decoration: buildInputDecoration(hintText),
          ),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String? hinttext) {
    return InputDecoration(
      isDense: false,
      contentPadding: hasContentPadding
          ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)
          : const EdgeInsets.symmetric(horizontal: 16.0),
      hintText: hinttext,
      hintStyle: const TextStyle(
        color: lightGrey,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: colorPrimary, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: Colors.black26,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: Colors.black26,
          width: 1,
        ),
      ),
      suffixIconConstraints: isPasswordField
          ? const BoxConstraints(minHeight: 40.0)
          : const BoxConstraints(minWidth: 0, minHeight: 40.0),
      suffixIcon: isPasswordField
          ? Container(
              width: 24,
              margin: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: onSuffixIconTap,
                child: SvgPicture.asset(
                  obscureText ? passwordHiddenIcon : passwordVisibleIcon,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
