import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/screens/dashboard/home/models/slider_data.dart';
import 'package:food_order_app/screens/dashboard/home/widgets/slider_dots.dart';
import 'package:food_order_app/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final currentPage = StateProvider<int>((ref) {
  return 0;
});

class SliderItems extends ConsumerWidget {
  SliderItems({super.key});

  // / final int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 25.h,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            restorationId: "intro_slider",
            controller: _pageController,
            onPageChanged: (value) {
              ref.read(currentPage.notifier).state = value;

              // ref.read(currentIndexNotifier.notifier).state =
              //     controller.page?.toInt() ?? 0;
            },
            itemBuilder: (context, int index) {
              var item = sliderList[index];
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Card(
                      
                      color: listColor[index],
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: SizedBox(
                        height: 16.h,

                        // radius: 20.0,

                        width: double.infinity,
                        child: 
                        Padding(
                          padding:  EdgeInsets.only(left: 20.0,right: 45.w,top: 20.0,bottom: 20.0),
                          child: Align(alignment: Alignment.centerLeft,child: MyText(text: item.title,fontSize: 18.sp,fontWeight: FontWeight.w600,color: white)),
                        ),
                      ),
                    ),
                    Positioned(bottom: -40,
                      right: -5.0,child: Image.asset(item.image,fit:BoxFit.contain ,height: 200.0,width: 200.0,))
                  ],
                ),
              );
            },
            itemCount: sliderList.length,
          ),
        ),
       
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < sliderList.length; i++)
            SlideDots(i == ref.watch(currentPage))
        ]),
      ],
    );
  }
}
