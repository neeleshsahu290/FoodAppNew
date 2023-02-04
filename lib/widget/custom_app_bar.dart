import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'my_text.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Color appBarColor;
  final String title;
  final List<Widget>? actionsList;
  final VoidCallback? onBackPressed;
  final Widget? leading;
  const CustomAppBar({
    Key? key,
    this.appBarColor = colorPrimary,
    this.leading,
    required this.title,
    this.actionsList,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        titleSpacing: 0,
        leadingWidth: (onBackPressed == null && leading == null) ? 16 : 56,
        leading: (leading != null)
            ? leading
            : (onBackPressed != null)
                ? Tooltip(
                    message: "Back",
                    child: IconButton(
                      onPressed: onBackPressed,
                      icon: const Icon(Icons.arrow_back),
                    ),
                  )
                : const SizedBox(),
        backgroundColor: appBarColor,
        title: MyText(text: title),
        actions: actionsList,
        elevation: 1);
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
