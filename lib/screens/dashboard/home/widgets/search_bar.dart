import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_order_app/constants/assets.dart';
import 'package:food_order_app/constants/dimensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../../../../constants/app_color.dart';
import '../../../../widget/custom_container.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mainHozPadd),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 30.0,
            width: 30.0,
            child: RiveAnimation.asset(
              menuIcon,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: CustomContainer(
              horizontalPadding: 0.0,
              verticalPadding: 0.0,
              radius: 16.0,
              color: lightGrey,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(
                  //   width: 20.0,
                  // ),
                  // SvgPicture.asset(
                  //   searchIcon,
                  //   height: 25.0,
                  //   width: 25.0,
                  // ),
                  Expanded(
                      child: TextField(
                    minLines: 1,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 16.sp),
                      hintText: 'Search',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: colorPrimary,
                        size: 25.0,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(20),
                    ),
                  )),
                  const CustomContainer(
                    horizontalPadding: 0.0,
                    verticalPadding: 0.0,
                    radius: 16.0,
                    color: colorPrimary,
                    height: 50.0,
                    width: 50.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
