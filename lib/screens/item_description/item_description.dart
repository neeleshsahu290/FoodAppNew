import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/constants/assets.dart';
import 'package:food_order_app/constants/dimensions.dart';
import 'package:food_order_app/screens/dashboard/home/ui/home.dart';
import 'package:food_order_app/screens/item_description/models/ItemModel.dart';
import 'package:food_order_app/screens/item_description/widgets/sub_item_list.dart';
import 'package:food_order_app/widget/custom_container.dart';
import 'package:food_order_app/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemDescription extends ConsumerStatefulWidget {
  ShopItemModel item;
  int index;
  ItemDescription({super.key, required this.item, required this.index});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ItemDescriptionState(item: item);
}

class _ItemDescriptionState extends ConsumerState<ItemDescription> {
  ShopItemModel item;
  _ItemDescriptionState({required this.item});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFD5E0F3),
        body: SingleChildScrollView(
            child: Container(
          decoration: const BoxDecoration(
              color: faintWhite,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0))),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: topPadd,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: mainHozPadd),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomContainer(
                        height: 55.0,
                        width: 55.0,
                        onClick: () {
                          Navigator.pop(context);
                        },
                        radius: 16.0,
                        color: lightGrey,
                        child: const Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                      const CustomContainer(
                        height: 55.0,
                        width: 55.0,
                        radius: 16.0,
                        color: white,
                        child: Icon(Icons.favorite_border_outlined),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: mainHozPadd),
                  child: MyText(
                    text: item.name,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: mainHozPadd),
                  child: MyText(
                    text: "Rs ${item.price}",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Stack(
                  children: [
                    Image.asset(
                      dishImage2,
                      height: 70.w,
                      width: 70.w,
                    ),
                    Positioned(
                        bottom: 0.0,
                        child:addCartButton() )
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const SubItemList(),
                const SizedBox(
                  height: 50.0,
                )
              ]),
        )),
      ),
    );
  }

  Widget addCartButton(){
    return AnimatedSize( 
                    curve: Curves.easeInOutCubic,
                          clipBehavior: Clip.antiAlias,
                          duration: const Duration(milliseconds: 200),      
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            color: white,
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomContainer(
                                    onClick: () {
                                      ref
                                          .read(homeScreenProvider)
                                          .addtoCart(index: widget.index);
                                    },
                                    horizontalPadding: 8.0,
                                    verticalPadding: 8.0,
                                    color: colorPrimary,
                                    radius: 12.0,
                                    child: const Icon(
                                      Icons.add,
                                      size: 20.0,
                                      color: white,
                                    ),
                                  ),
                                  ref
                                     .watch(homeScreenProvider)
                                      .itemList[widget.index]
                                      .quantity >
                                      0
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            MyText(
                                              text: ref
                                                  .read(homeScreenProvider)
                                                  .itemList[widget.index]
                                                  .quantity
                                                  .toString(),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),

                                            CustomContainer(
                                              onClick: () {
                                                ref
                                          .read(homeScreenProvider)
                                          .removetoCart(index: widget.index);
                                              },
                                              horizontalPadding: 8.0,
                                              verticalPadding: 8.0,
                                              color: lightGrey,
                                              radius: 12.0,
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20.0,
                                                color: commonTextColor,
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                      
                                  
                                ],
                              ),
                            ),
                          ),
                        );
  }
}
