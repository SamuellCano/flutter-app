import 'package:flutter/material.dart';
import 'package:testgroupb/kernel/widgets/menu.dart';
import 'package:testgroupb/kernel/widgets/splash.dart';
//import 'package:testgroupb/modules/forms/adapters/screens/login_form.dart';
//import 'package:testgroupb/modules/count/adapters/screens/count.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/menu': (context) => const Menu(),
      },
    );
  }
}


/*class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Count(),
    );
 }
}*/