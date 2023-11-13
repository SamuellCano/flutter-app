import 'package:flutter/material.dart';
import 'package:testgroupb/modules/shop/adapters/screen/shop.dart';

class ShopNavigation extends StatelessWidget{
  const ShopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/shop',
      routes: {
        '/shop' : (context) => const Shop()
      },
    );
  }
}