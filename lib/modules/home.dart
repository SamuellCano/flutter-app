import 'package:flutter/material.dart';
import 'package:testgroupb/kernel/colors/colors_app.dart';
import 'package:testgroupb/kernel/widgets/custom_list_user.dart';
//import 'package:testgroupb/modules/forms/adapters/screens/first_form.dart';

class Home extends StatelessWidget {
  Home({super.key});
  
  Widget build(BuildContext context) {
    final Map item = {'name': 'Samuel Cano Pérez'};
    final Map item2 = {'name': 'Maximiliano Cano Pérez'};
    final List items = [item, item2];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: ColorsApp.primaryColor,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
        return CustomListUser(item: items[index]);
      }),
    );
  }
}
