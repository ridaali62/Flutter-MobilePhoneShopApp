import 'package:flutter/material.dart';
import 'package:mobileapp/cart_screen.dart';
import 'package:mobileapp/fav_screen.dart';
import 'package:mobileapp/provider/cart_provider.dart';
import 'package:mobileapp/provider/fav_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<CartProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.amber[800],
              title: Text("Buy Your Gadget!"),
              leading: Container(
                  color: Colors.black,
                  child: IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Fav_Screen()));
                      })),
              actions: [
                Container(
                  color: Colors.black,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cart_Screen(),
                            ));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 20,
                      )),
                )
              ]),
          backgroundColor: Colors.grey[300],
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(color: Colors.purple, width: 2))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          iconColor: Colors.black,
                          border: InputBorder.none,
                          hintText: "Search",
                          icon: Icon(Icons.search),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mobile Result 594",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 30,
                                color: Colors.amber[800],
                                child: Image.asset("assets/swap.png"),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 25,
                                width: 30,
                                color: Colors.amber[800],
                                child: Image.asset(
                                  "assets/layout.png",
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: value.Product.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.7, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Image.network(
                                            value.Product[index][1],
                                            height: 140,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.favorite),
                                          onPressed: () {
                                            Provider.of<FavProvider>(context,
                                                    listen: false)
                                                .Additem(index);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Fav_Screen(),
                                                ));
                                          },
                                        )
                                      ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    value.Product[index][0],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "A mobile phone is one kind of portable telephone.A great discovery of science.",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "\$${value.Product[index][2]}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.orange[900]),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/star.png",
                                                height: 20,
                                                width: 20,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "5.0",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: IconButton(
                                          onPressed: () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .Additem(index);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Cart_Screen(),
                                                ));
                                          },
                                          icon: const Icon(
                                            Icons.card_travel,
                                            size: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
