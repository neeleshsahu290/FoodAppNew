import 'package:flutter/material.dart';
import 'package:food_order_app/screens/item_description/models/ItemModel.dart';
import 'package:food_order_app/services/itemService.dart';

class HomeScreenNotifier extends ChangeNotifier {
  HomeScreenNotifier() {
    init();
  }

  List<ShopItemModel> itemList = [];

  init() async {
    itemList = ItemServices().getShoppingItems();
    notifyListeners();
  }

  addtoCart({required int index}) {
    itemList[index].quantity = itemList[index].quantity + 1;
    notifyListeners();
  }

  removetoCart({required int index}) {
    itemList[index].quantity = itemList[index].quantity - 1;
    notifyListeners();
  }
}
