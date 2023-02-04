
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/screens/dashboard/home/models/commants_data.dart';
import 'package:food_order_app/widget/custom_container.dart';
import 'package:food_order_app/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class CommentsSlider extends ConsumerWidget {
  const CommentsSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  //List<CommentsData> list=  commentList;
    return Column(
      children: [

        Consumer(
          builder: ((context, ref, child)=> Column(
          children: [
            const SizedBox(height: 20.0,),

            MyText(text: 'Check what others say!',fontSize: 18.sp,fontWeight: FontWeight.w600,),
            const SizedBox(height: 20.0,),

            CarouselSlider(
              options: CarouselOptions(height: 250.0,autoPlay: true,viewportFraction: 0.7  ),

            items: commentList.map((data) {

                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:
                      Card(elevation: 2.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: CustomContainer(
                          width: double.infinity,
                          color: white,

                            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                              MyText(text: data.title,fontSize: 18.sp,fontWeight: FontWeight.w600,),
                              const SizedBox(height: 5.0,),
                              MyText(text: data.comment,fontSize: 16.sp,fontWeight: FontWeight.w400,textAlignment: TextAlign.center,)

                            ],)
                        ),
                      ),
                    );
                  },
                );
              }).toList(),

            ),
            const SizedBox(height: 20.0,),

          ],
        ))),
      ],
    );
  
  }
}