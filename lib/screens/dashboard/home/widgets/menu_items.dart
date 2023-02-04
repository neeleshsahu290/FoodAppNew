import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/constants/dimensions.dart';
import 'package:food_order_app/screens/dashboard/home/models/menu_data.dart';
import 'package:food_order_app/widget/custom_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../widget/my_text.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: mainHozPadd),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Mood  ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: commonTextColor)),
              TextSpan(
                  text: "Traditional menu",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: erroColor))
            ])),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(menuList.length, (index) {
                var data = menuList[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomContainer(
                    radius: 20.0,
              
                    color: data.color  ,
                    width: 100.0,
                    height: 140.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(data.image,
                        height: 42.0,width: 42.0,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        MyText(
                          text: data.title,
                          textAlignment: TextAlign.center,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        )
      ],
    );
  }
}
