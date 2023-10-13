import 'package:flutter/material.dart';

class FavProvider with ChangeNotifier {
  final List Product = [
    [
      "Infinix S7",
      "https://www.assuredzone.com/pk/wp-content/uploads/sites/18/2023/02/Infinix-Smart-7.jpg",
      "400"
    ],
    [
      "Infinix 8i",
      "https://rgmprice.com.pk/wp-content/uploads/2020/12/infinix-note8i-price-in-pakistan-by-RGM-Price.jpg",
      "300"
    ],
    [
      "Infinix Hot 9",
      "https://infinix-staging-s3.s3.ap-south-1.amazonaws.com/media/gcipkncm/hot9_violet_1000x1497_6.png",
      "400"
    ],
    [
      "Infinix Hot 30",
      "https://g-mart.pk/wp-content/uploads/Infinix-Hot-30-5G-1-435x590.jpg",
      "500"
    ],
    [
      "Infinix Zero 20",
      "https://www.pakmobizone.pk/wp-content/uploads/2023/04/Infinix-Zero-20-Space-Grey-3.png",
      "300"
    ],
    [
      "Infinix Smart 5A",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPYJ7VfON92rPHZdrjl5O-eWhjfJsd9ivgnw&usqp=CAU",
      "200"
    ]
  ];

  List FavItem = [];

  void Additem(int index) {
    bool itemfound = false;
    // CartItem.add(AddCart(index, Product[index], 1));
    for (int i = 0; i < FavItem.length; i++) {
      if (FavItem[i].index == index) {
        itemfound = true;
        notifyListeners();
      }
    }
    if (!itemfound) {
      FavItem.add(AddFav(
        index,
        Product[index],
      ));
      notifyListeners();
    }
  }

  void Removeitem(int index) {
    FavItem.removeAt(index);
    notifyListeners();
  }
}

class AddFav {
  int index;
  List<dynamic> product;
  AddFav(this.index, this.product);
}
