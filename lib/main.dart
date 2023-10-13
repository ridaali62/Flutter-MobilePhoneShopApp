import 'package:flutter/material.dart';
import 'package:mobileapp/homepage.dart';
import 'package:mobileapp/provider/cart_provider.dart';
import 'package:mobileapp/provider/fav_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => CartProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => FavProvider()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
