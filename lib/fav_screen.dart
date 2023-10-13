import 'package:flutter/material.dart';
import 'package:mobileapp/provider/fav_provider.dart';
import 'package:provider/provider.dart';

class Fav_Screen extends StatefulWidget {
  const Fav_Screen({super.key});

  @override
  State<Fav_Screen> createState() => _Fav_ScreenState();
}

class _Fav_ScreenState extends State<Fav_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<FavProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.FavItem.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          value.FavItem[index].product[1],
                          height: 100,
                          width: 100,
                        ),
                        Container(
                            width: 100,
                            child: Text(value.FavItem[index].product[0])),
                        Container(
                            width: 100,
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 50,
                              ),
                              onPressed: () {
                                Provider.of<FavProvider>(context, listen: false)
                                    .Removeitem(index);
                              },
                            )),
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
    ;
  }
}
