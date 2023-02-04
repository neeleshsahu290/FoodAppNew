import 'package:flutter/animation.dart';
import 'package:food_order_app/constants/assets.dart';

class MenuData {
  final String title;
  final String image;
  final Color color;
  MenuData({required this.title, required this.image, required this.color});
}

List<MenuData> menuList = [
  MenuData(title: "Mood Booster", image: moodBoosterIcon, color:const Color.fromARGB(255, 182, 217, 233) ),
  MenuData(title: "Brain Focus", image: brainFocusIcon,color:const Color.fromARGB(255, 233, 221, 182) ),
  MenuData(title: "Gossip with Friends", image: gossipFriendsIcon,color:const Color.fromARGB(255, 182, 233, 189))
];
