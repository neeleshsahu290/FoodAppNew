import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/assets.dart';

class AppCircularLogo extends StatelessWidget {
  final double radius;
  const AppCircularLogo({
    Key? key,
    this.radius = 70.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey.shade50,
        child: SvgPicture.asset(
          bottomIcon,
          width: radius < 70.0 ? (radius - 8) : null,
          height: radius < 70.0 ? (radius - 8) : null,
        ),
      ),
    );
  }
}
