import 'package:flutter/material.dart';
import 'package:testgroupb/kernel/colors/colors_app.dart';
import 'package:testgroupb/modules/forms/adapters/screens/login_form.dart';

class Account extends StatefulWidget {
  Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Widget screen = LoginForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: ColorsApp.primaryColor,
        ),
        body: LoginForm());
  }
}
