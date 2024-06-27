import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/controllers/products_controller.dart';
import 'package:lesson64_statemanagement/models/product.dart';
import 'package:lesson64_statemanagement/views/screens/cart_screen.dart';
import 'package:lesson64_statemanagement/views/widgets/addProducts.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController productsController =
        Provider.of<ProductsController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahsulotlar'),
        leading: IconButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   CupertinoPageRoute(
            //     builder: (BuildContext context) => const OrderScreen(),
            //   ),
            // );
          },
          icon: const Icon(Icons.ac_unit),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddProductAlertDialog(isAdd: true),
              );
            },
            icon: const Icon(Icons.add_circle),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const CartScreen()),
              ),
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider<Product>.value(
            value: product,
            builder: (context, child) {
              return ProductItem();
            },
          );
        },
      ),
    );
  }
}
