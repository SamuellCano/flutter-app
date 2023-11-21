import 'package:flutter/material.dart';
import 'package:testgroupb/kernel/colors/colors_app.dart';
import 'package:testgroupb/kernel/widgets/access_shop_cart.dart';
import 'package:testgroupb/kernel/widgets/conatiner_shop.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item = {
      'title': 'Samsung Galaxy S23 Ultra',
      'description':
          'Nuevo Galaxy S23 Ultra con 4 camaras, descubre todo lo nuevo que trae para ti',
      'initialRating': 4.5,
      'imageUrl': 'assets/images/samsung.jpg',
      'price': 20000.0
    };

    final Map<String, dynamic> item2 = {
      'title': 'Iphone 13 Pro Max',
      'description':
          'Nuevo Iphone 13 Pro Max con 4 camaras, descubre todo lo nuevo que trae para ti',
      'initialRating': 4.2,
      'imageUrl': 'assets/images/iphone13.png',
      'price': 20000.0
    };

    final List items = [item, item2];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.primaryColor,
          foregroundColor: ColorsApp.whiteColor,
          title: const Text('Tienda'),
          actions: const [AccessShopCart()],
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(8),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: List.generate(items.length, (index) {
              return ContainerShop(
                  title: items[index]['title'],
                  description: items[index]['description'],
                  initialRating: items[index]['initialRating'],
                  imageUrl: items[index]['imageUrl'],
                  price: items[index]['price']);
            })
            /*ContainerShop(title: item['title'], description: item['description'], initialRating: item['initialRating'], imageUrl: item['imageUrl']),
    ContainerShop(title: item2['title'], description: item2['description'], initialRating: item2['initialRating'], imageUrl: item2['imageUrl']),*/

            ));
  }
}
