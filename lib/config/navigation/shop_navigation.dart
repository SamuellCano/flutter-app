import 'package:flutter/material.dart';
import 'package:testgroupb/modules/shop/adapters/screen/shop.dart';
import 'package:testgroupb/modules/shop/adapters/screen/shop_cart.dart';
import 'package:testgroupb/modules/shop/adapters/screen/shop_detail.dart';

class ShopNavigation extends StatelessWidget {
  const ShopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/shop',
      routes: {
        '/shop': (context) => const Shop(),
        '/shop/detail-shop': (context) => ShopDetail(),
        '/shop/shop-cart': (context) => const ShopCart(),
      },
    );
  }
}
