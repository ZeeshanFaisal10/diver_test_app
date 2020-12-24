import 'package:flutter/material.dart';
import 'Item.dart';

class ItemAddNotifier extends ChangeNotifier{
  List<Item> itemList = [];

  addItem(String hname, String hDate) async{
    Item item = Item(hname,hDate);
    itemList.add(item);
    notifyListeners();
  }

  updateItem(int index, String itemName, String hdate) async{
    Item item = Item(itemName,hdate);
    itemList.elementAt(index).hname = item.hname;
    itemList.elementAt(index).hdate= item.hdate;
    notifyListeners();
  }

  deleteItem(int index) async{
    itemList.removeAt(index);
    notifyListeners();
  }

}