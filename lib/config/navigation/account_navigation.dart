import 'package:flutter/material.dart';
import 'package:testgroupb/modules/account.dart';

class AccountNavigation extends StatelessWidget {
  const AccountNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/account',
      routes: {'/account': (context) => Account()},
    );
  }
}
