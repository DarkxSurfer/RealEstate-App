import 'package:flutter/material.dart';
import 'product.dart';

class WishlistProvider with ChangeNotifier {
  final List<MyProduct> _wishlist = [];

  List<MyProduct> get wishlist => _wishlist;


  void toggleWhishList(MyProduct product) {
    if (_wishlist.contains(product)) {
      wishlist.remove(product);
    } else {
      wishlist.add(product);
    }
    notifyListeners();
  }

  // void addProduct(MyProduct product) {
  //   _wishlist.add(product);
  //   notifyListeners();
  // }

  // void removeProduct(MyProduct product) {
  //   _wishlist.remove(product);
  //   notifyListeners();
  // }

  bool isInWishlist(MyProduct product,) {
    return _wishlist.contains(product);
  }
}
