import 'package:flutter/material.dart';
import 'package:testgroupb/modules/news/adapters/screens/news.dart';

class NewsNavigation extends StatelessWidget {
  const NewsNavigation({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/news',
      routes: {
        '/news' : (context) => News()
      },
    );
  }
}