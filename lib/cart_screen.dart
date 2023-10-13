import 'package:flutter/material.dart';
import 'package:mobileapp/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({super.key});

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.CartItem.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          value.CartItem[index].product[1],
                          height: 100,
                          width: 100,
                        ),
                        Text(value.CartItem[index].product[0]),
                        Text(value.CartItem[index].quantity.toString()),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    ));
  }
}
