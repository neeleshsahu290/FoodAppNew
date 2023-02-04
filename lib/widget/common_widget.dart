// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../constants/constant.dart';

// getAttachMediaButton({onPressed}) {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 16.0),
//     width: double.infinity,
//     height: 40.0,
//     alignment: Alignment.center,
//     decoration: const BoxDecoration(
//         image: DecorationImage(
//             fit: BoxFit.fitWidth,
//             image: AssetImage(Constant.DASHED_BORDER_BG))),
//     child: InkWell(
//       borderRadius: BorderRadius.circular(8.0),
//       onTap: onPressed,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset(Constant.ATTACH_MEDIA_ICON),
//           MyText(
//               text: "Attach Media",
//               fontSize: 14.0,
//               color: AppColor.textGreenColor),
//         ],
//       ),
//     ),
//   );
// }

// Widget getRounderView(
//     {@required Widget child, double radius, EdgeInsets padding, Color color}) {
//   return Container(
//       padding: padding ??
//           EdgeInsets.only(
//               left: size_8, top: size_8, bottom: size_4, right: size_4),
//       decoration: BoxDecoration(
//           color: color ?? AppTheme.button_color,
//           borderRadius:
//               BorderRadius.only(topLeft: Radius.circular(radius ?? size_24))),
//       child: child);
// }

// //Common Option menu that return a function with an index number - Can be used anywhere in the Project.
// Widget getCustomOptionMenu(
//     List<String> popMenuItems, Function() onMenuCliked(int),
//     {icon = const Icon(Icons.more_vert), horizontalPadding = 8.0}) {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//     child: ConstrainedBox(
//       constraints: BoxConstraints(
//         maxHeight: 24.0,
//         maxWidth: 24.0,
//       ),
//       child: PopupMenuButton(
//           elevation: 3,
//           color: Colors.black54,
//           icon: icon,
//           padding: EdgeInsets.zero,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//             Radius.circular(5.0),
//           )),
//           itemBuilder: (context) => List.generate(
//               popMenuItems.length,
//               (index) => PopupMenuItem(
//                   padding: EdgeInsets.symmetric(horizontal: 12.0),
//                   onTap: onMenuCliked(index),
//                   child: Text(popMenuItems[index],
//                       style: TextStyle(
//                           color: AppColor.white,
//                           fontSize: size_10,
//                           fontWeight: FontWeight.w500))))),
//     ),
//   );
// }

// Widget getCustomAppBar(
//     String title, VoidCallback onBackBtnClicked, List<Widget> actionsList,
//     {Color appBarColor = AppColor.colorPrimary}) {
//   return AppBar(
//       titleSpacing: 0,
//       leading: Tooltip(
//           message: "Back",
//           child:
//               InkWell(onTap: onBackBtnClicked, child: Icon(Icons.arrow_back))),
//       backgroundColor: appBarColor,
//       title: Text(title,
//           style: TextStyle(fontSize: size_14, fontWeight: FontWeight.w500)),
//       actions: actionsList,
//       elevation: 1);
// }

// Widget getUserErrorImageView({double size, Color colors, borderWidth}) {
//   return Container(
//     width: size ?? size_40,
//     height: size ?? size_40,
//     decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(
//             color: colors ?? AppTheme.appColor, width: borderWidth ?? size_1)),
//     child: Center(
//       child: SvgPicture.asset(
//         "assets/images/account_icon.svg",
//         width: size_24,
//       ),
//     ),
//   );
// }

// void initStatusBar({Color colors}) {
//   if (colors == null) colors = AppTheme.statusBarColor;
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: colors,
//       statusBarIconBrightness:
//           AppTheme.isDarkMode ? Brightness.light : Brightness.light));
// }
