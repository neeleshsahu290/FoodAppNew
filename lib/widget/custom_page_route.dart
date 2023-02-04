import 'package:flutter/material.dart';

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  CustomPageRoute({required WidgetBuilder builder}) : super(builder: builder);
}
