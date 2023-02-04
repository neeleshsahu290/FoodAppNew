import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/constants/dimensions.dart';
import 'package:food_order_app/helper/navigator_help.dart';
import 'package:food_order_app/screens/dashboard/home/ui/home.dart';
import 'package:food_order_app/screens/item_description/item_description.dart';
import 'package:food_order_app/screens/item_description/models/ItemModel.dart';
import 'package:food_order_app/services/itemService.dart';
import 'package:food_order_app/widget/custom_container.dart';
import 'package:food_order_app/widget/custom_image_view.dart';
import 'package:food_order_app/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecomendedItems extends ConsumerWidget {
  const RecomendedItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(homeScreenProvider).itemList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: mainHozPadd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                MyText(
                    text: "Recommended",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: commonTextColor,
                    textAlignment: TextAlign.left),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            item(context,
                                ref.read(homeScreenProvider).itemList[0]),
                            const SizedBox(
                              height: 10.0,
                            ),
                            item(context,
                                ref.read(homeScreenProvider).itemList[1])
                          ],
                        )),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: CustomContainer(
                                radius: 12.0,
                                hasBorder: true,
                                horizontalPadding: 5.0,
                                verticalPadding: 5.0,
                                child: Row(
                                  children: [
                                    const CustomContainer(
                                      color: faintWhite,
                                      radius: 12.0,
                                      height: 50.0,
                                      width: 50.0,
                                      child: Icon(
                                        Icons.forward,
                                        size: 20.0,
                                        color: commonTextColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Expanded(
                                        child: MyText(
                                      text: 'View All',
                                      color: commonTextColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      textAlignment: TextAlign.center,
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            item(context,
                                ref.read(homeScreenProvider).itemList[2]),
                            const SizedBox(
                              height: 10.0,
                            ),
                            item(context,
                                ref.read(homeScreenProvider).itemList[3]),
                          ],
                        )),
                  ],
                )
              ],
            ),
          )
        : const SizedBox();
  }

  Widget item(BuildContext context, ShopItemModel item) {
    return InkWell(
      onTap: () {
        navigatorPush(context,  ItemDescription(item: item,index: 1,));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  child: CustomImageView(
                    url: item.image,
                    fallBackText: '',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomContainer(
                horizontalPadding: 10.0,
                verticalPadding: 5.0,
                color: lightGreenColor,
                child: MyText(
                  text: 'low histamine',
                  color: commonTextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: MyText(
                text: item.name,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: MyText(
                      text: "Rs ${item.price}",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
                  child: CustomContainer(
                    onClick: () {
                      ItemServices().addToCart(item);
                    },
                    color: colorPrimary,
                    radius: 12.0,
                    child: const Icon(
                      Icons.add,
                      size: 20.0,
                      color: white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
