import 'package:flutter/material.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/constants/assets.dart';
import 'package:food_order_app/widget/custom_container.dart';
import 'package:food_order_app/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubItemList extends StatefulWidget {
  const SubItemList({super.key});

  @override
  State<StatefulWidget> createState() => _SubItemListState();
}

class _SubItemListState extends State<SubItemList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ...List.generate(
              8,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(width: 105.0,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Align(alignment: Alignment.center,
                                child: CustomContainer(
                                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                                  height: 100.0,
                                  width: 100.0,
                                  color: white,
                                  radius: 16.0,
                                  child: Image.asset(dishImage2),
                                ),
                              ),
                              const Positioned(right: 0.0,bottom: 0.0,child: CustomContainer(height: 25.0,width: 25.0
                              ,
                                horizontalPadding: 5.0,verticalPadding: 5.0,color: colorPrimary,child: Icon(Icons.add,color: white,size: 12.0,),))
                                                         , Positioned(height: 25.0,width: 25.0,right: 0.0,top: 0.0,child: CustomContainer(horizontalPadding: 5.0,verticalPadding: 5.0,color: colorPrimary,child: 
                                                        Align(alignment: Alignment.center,child: MyText(text:'1' ,color: white,fontSize: 12.sp,textAlignment: TextAlign.center,fontWeight: FontWeight.w600,)),))

                            ],
                            
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Align(alignment: Alignment.centerLeft,
                            child: MyText(
                              textAlignment: TextAlign.start,
                              text: "Almond Milk",
                              fontSize: 15.sp,
                              color: commonTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                         Align(alignment: Alignment.centerLeft,
                            child: MyText(
                               textAlignment: TextAlign.start,
                              text: "Rs 25000",
                              fontSize: 14.sp,
                              color: commonTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}
