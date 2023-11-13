import 'package:flutter/material.dart';
import 'package:testgroupb/config/navigation/account_navigation.dart';
import 'package:testgroupb/config/navigation/home_navigation.dart';
import 'package:testgroupb/config/navigation/news_navigation.dart';
import 'package:testgroupb/config/navigation/shop_navigation.dart';
import 'package:testgroupb/kernel/widgets/custom_bottom_navigation_tap.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectIndex = 0;
  final homeNavigatorKey = GlobalKey<NavigatorState>();
  final accountNavigatorKey = GlobalKey<NavigatorState>();
  void _onItemTapped(int index){
    setState(() {
      _selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectIndex,
        children: [HomeNavigation(), AccountNavigation(), NewsNavigation(), ShopNavigation()],
      ),
      bottomNavigationBar: CustomBottomNavigationTab(
        selectedIndex: _selectIndex, onItemTapped: _onItemTapped),
    );
  }
}
