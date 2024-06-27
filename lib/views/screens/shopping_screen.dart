import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/controllers/cart_controller.dart';
import 'package:lesson64_statemanagement/models/product.dart';
import 'package:lesson64_statemanagement/views/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shopping"),
      ),
      body: cartController.cart.products.isEmpty
        ? const Center(
            child: Text("Savatcha bo'sh, mahsulot qo'shing"),
          )
        : ListView.builder(
            itemCount: cartController.cart.products.length,
            itemBuilder: (ctx, index) {
              final product = cartController.cart.products.values
                  .toList()[index]['product'];
              return ChangeNotifierProvider<Product>.value(
                value: product,
                builder: (context, child) {
                  return const ProductItem();
                },
              );
            },
          ),
    );
  }
}
