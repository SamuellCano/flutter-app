import 'package:flutter/material.dart';
import 'package:testgroupb/kernel/colors/colors_app.dart';
import 'package:testgroupb/modules/account.dart';
import 'package:dio/dio.dart';

class AccountInfo extends StatelessWidget {
   AccountInfo({super.key});

  final dio = Dio();

  void request() async {
    Response response;
    response = await dio.get(
      'https://crudcrud.com/api/27de2085970d45e2bbd89775c33b5e24/users/65386b3e2e0fb203e8541198');
    print(response.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    String email = 'Sam';
    () async {
    Response response;
    response = await dio.get(
      'https://crudcrud.com/api/27de2085970d45e2bbd89775c33b5e24/users/65386b3e2e0fb203e8541198');
    email = response.data.toString();
    };
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
          backgroundColor: ColorsApp.primaryColor,
        ),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text('Bienvenido, $email has iniciado sesión'),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(ColorsApp.dangerColor)),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Account(),
                          ),
                        );
                      },
                      child: const Text('Cerrar Sesión')),
                ),
              ]),
        ));
  }
}
