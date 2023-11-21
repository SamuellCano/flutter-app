import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testgroupb/kernel/colors/colors_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopCart extends StatelessWidget {
  const ShopCart({super.key});

  Future getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('shopping_cart_list');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: ColorsApp.primaryColor,
        foregroundColor: ColorsApp.whiteColor,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FutureBuilder(
                future: getList(),
                builder: (context, snapshot) {
                  Widget result = const Center(
                      child: Text('Aun no hay productos añadidos'));
                  if (snapshot.hasData) {
                    List lista = jsonDecode(snapshot.data);
                    if (lista.length == 0) {
                      result = const Center(
                          child: Text('Aun no hay productos añadidos'));
                    } else {
                      result = ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: lista.length,
                          itemBuilder: (context, index) {
                            return ListCartShop(
                              item: lista[index],
                              index: index,
                            );
                          });
                    }
                  } else if (snapshot.hasError) {
                    print("Hubo un error ${snapshot.error}");
                    result = const CircularProgressIndicator();
                  }
                  return result;
                }),
          ),
        ],
      ),
    );
  }
}

class ListCartShop extends StatelessWidget {
  final Map item;
  final int index;
  const ListCartShop({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Image.asset(
            item["image"],
            height: 120,
            width: 120,
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            margin: const EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  item["description"],
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '\$${item["price"]}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.primaryColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String? data = prefs.getString('shopping_cart_list');
              List list = jsonDecode(data!);
              list.removeAt(index);
              String newList = jsonEncode(list);
              prefs.setString('shopping_cart_list', newList);
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, '/shop/shop-cart');
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
            child: const Icon(Icons.delete),
          )
        ]),
      ),
    );
  }
}
