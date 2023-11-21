import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testgroupb/kernel/colors/colors_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopDetail extends StatelessWidget {
  ShopDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double widthImage = MediaQuery.of(context).size.width;
    final dynamic rawArguments = ModalRoute.of(context)!.settings.arguments;
    final Map<String, dynamic> arguments =
        (rawArguments as Map<String, dynamic>?) ?? {};
    final title = arguments['title'] ?? 'No hay texto';
    final descriprion = arguments['description'] ?? 'No hay descripción';
    final initialRating = arguments['initialRating'] ?? 0.0;
    final imageUrl = arguments['imageUrl'] ?? 'assets/images/logo-utez.png';
    final price = arguments['price'] ?? 0.0;

    Future addCart() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString('shopping_cart_list');
      List list = [];
      if (data != null) {
        list = jsonDecode(data);
      }
      list.add({
        'title': title,
        'description': descriprion,
        'image': imageUrl,
        'price': price
      });
      String jsonString = jsonEncode(list);
      prefs.setString('shopping_cart_list', jsonString);
      print("Añadir en detail: " + jsonString);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: ColorsApp.primaryColor,
        foregroundColor: ColorsApp.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              imageUrl,
              width: widthImage,
              height: 250,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(
                    width: widthImage / 2,
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  RatingBar.builder(
                    initialRating: initialRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 16,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                    ignoreGestures: true,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                descriprion,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text('\$$price',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          addCart();
          Navigator.pushNamed(context, '/shop/shop-cart');
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorsApp.successColor,
          backgroundColor: Colors.white,
          side: const BorderSide(color: ColorsApp.successColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text('Agregar al carrito'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
