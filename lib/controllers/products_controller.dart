import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/models/product.dart';

class ProductsController extends ChangeNotifier {
  final Product _product = Product(
    id: "",
    title: "",
    color: Colors.black,
    price: 0,
  );

  Product get product {
    return _product;
  }

  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "iPhone",
      color: Colors.teal,
      price: 340,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Macbook",
      color: Colors.grey,
      price: 1340,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "AirPods",
      color: Colors.blue,
      price: 140,
    ),
  ];

  List<Product> get list {
    return [..._list];
  }

  void addProduct(Product product) {
    _list.add(product);
    notifyListeners();
  }

  void editProduct(String productId, String newTitle, int newPrice) {
    int index = _list.indexWhere((element) => element.id == productId);
    if (index != -1) {
      _list[index].updateProduct(newTitle, newPrice);
    }
    notifyListeners();
  }

  void deleteProduct(String productId) {
    _list.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
