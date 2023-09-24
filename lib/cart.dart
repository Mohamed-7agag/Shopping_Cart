import 'package:flutter/material.dart';
import 'item.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  int _price = 0;
  void add(Item item) {
    _price += item.price;
    _items.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    _price -= item.price;
    _items.remove(item);
    notifyListeners();
  }

  get count {
    return _items.length;
  }

  get totalprice {
    return _price;
  }

  get cartitems {
    return _items;
  }
}
