import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_order_app/constants/app_color.dart';
import 'package:food_order_app/constants/assets.dart';
import 'package:food_order_app/screens/dashboard/home/ui/home.dart';
import 'package:food_order_app/services/itemService.dart';
import 'package:food_order_app/util/utils.dart';
import 'package:food_order_app/widget/custom_container.dart';
import 'package:food_order_app/widget/keep_alive_page.dart';
import 'dart:math' as math;

import 'package:rive/rive.dart';

final currentIndexNotifier = StateProvider<int>((ref) {
  return 0;
});
// late SMIBool searchTigger;
// late SMIBool homeTrigger;
// late SMIBool bellTrigger;
// late SMIBool personTrigger;

final pageControllerProvider = Provider.autoDispose<PageController>((ref) {
  final controller = PageController();
  controller.addListener(() {
    ref.read(currentIndexNotifier.notifier).state =
        controller.page?.toInt() ?? 0;
  });
  return controller;
});

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    ItemServices().openDB();
    ItemServices().getShoppingItems();
    super.initState();
  }

  final _screenList = [
    const KeepAlivePage(child: HomeScreen()),
    KeepAlivePage(
      child: Container(
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
      ),
    ),
    KeepAlivePage(
        child: Container(
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    )),
    KeepAlivePage(
        child: Container(
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    //log("Initial Build");
    return Scaffold(
      body: Consumer(
        builder: ((context, ref, child) => PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: ref.watch(pageControllerProvider),
              restorationId: "dashboard_pageview",
              itemBuilder: ((context, index) => _screenList[index]),
              itemCount: _screenList.length,
            )),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80.0,
        color: white,
        padding: const EdgeInsets.all(8),
        child: Consumer(
          builder: ((context, ref, child) {
            // final currentPage = ref.watch(currentIndexNotifier);
            return CustomContainer(
              radius: isIos() ? 40.0 : 8.0,
              width: double.infinity,
              color: colorPrimary,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...List.generate(bottomList.length, (index) {
                      var item = bottomList[index];
                      return GestureDetector(
                        onTap: () {
                          item.input?.change(true);

                          Future.delayed(const Duration(seconds: 1), () {
                            item.input?.change(false);
                          });

                          if (ref.read(pageControllerProvider).hasClients) {
                            ref.read(pageControllerProvider).jumpToPage(index);
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ref.watch(currentIndexNotifier) == index
                                ? AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    child: const CustomContainer(
                                      radius: 4.0,
                                      color: white,
                                      height: 8.0,
                                      width: 36.0,
                                    ),
                                  )
                                : const SizedBox(
                                    height: 8.0,
                                  ),
                            Container(
                              color: colorPrimary,
                              height: 32.0,
                              width: 32.0,
                              child: RiveAnimation.asset(
                                bottomIcon,
                                artboard: item.artboard,
                                onInit: (artboard) {
                                  var controller = RiveUtils.getRiveController(
                                      artboard,
                                      stateMachineName: item.stateMachineName);

                                  if (controller != null) {
                                    item.input =
                                        controller.findSMI("active") as SMIBool;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                  ]),
            );
          }),
        ),
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title;
  late SMIBool? input;
  RiveAsset(
      {required this.artboard,
      this.input,
      required this.title,
      required this.stateMachineName});
  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomList = [
  RiveAsset(
      artboard: "HOME", stateMachineName: "HOME_interactivity", title: "Home"),
  RiveAsset(
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset(
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notification"),
  RiveAsset(
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile")
];
