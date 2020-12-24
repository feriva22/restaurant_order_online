import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_order_online/models/menu.dart';

class CartModel extends ChangeNotifier {
  MenuModel _menu;

  //Save discount
  double discount = 0;

  final List<CartItem> _cartItems = [];

  MenuModel get menu => _menu;

  set menu(MenuModel newMenu) {
    assert(newMenu != null);
    assert(_cartItems.every((item) => newMenu.getById(item.menu.id) != null),
        'The catalog $newMenu does not have one of $_cartItems in it.');
    _menu = newMenu;
    notifyListeners();
  }

  List<CartItem> get items => _cartItems;

  int get subTotalPrice =>
      items.fold(0, (total, current) => total + current.totalPrice.toInt());

  int get finalTotalPrice => subTotalPrice - discount.toInt();

  void add(MenuItem menu) {
    int sameMenuidx =
        _cartItems.indexWhere((element) => element.menu.id == menu.id);
    (sameMenuidx == -1)
        ? _cartItems.add(CartItem(menu))
        : increaseQuantity(_cartItems[sameMenuidx]);

    notifyListeners();
  }

  void remove(CartItem cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }

  void increaseQuantity(CartItem cartItem) {
    CartItem item =
        _cartItems[_cartItems.indexWhere((element) => element == cartItem)];
    item.increaseQuantity();
    notifyListeners();
  }

  void decreaseQuantity(CartItem cartItem) {
    CartItem item =
        _cartItems[_cartItems.indexWhere((element) => element == cartItem)];
    (item.quantity == 1) ? _cartItems.remove(item) : item.decreaseQuantity();

    notifyListeners();
  }
}

class CartItem {
  final MenuItem menu;
  int quantity = 1;

  CartItem(this.menu);

  double get totalPrice => menu.price * quantity;

  increaseQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    quantity--;
  }
}
