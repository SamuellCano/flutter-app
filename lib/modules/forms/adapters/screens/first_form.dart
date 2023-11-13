import 'package:flutter/material.dart';
import 'package:testgroupb/kernel/validations/validation.dart';
import 'package:testgroupb/kernel/colors/colors_app.dart';
import 'package:testgroupb/modules/account.dart';
import 'package:testgroupb/modules/forms/adapters/screens/account_info.dart';

class FirstForm extends StatefulWidget {
  const FirstForm({super.key});

  @override
  State<FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  final _forKey = GlobalKey<FormState>();
  bool _isButtonDisabled = true;
  final TextEditingController _fullname = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');
  final TextEditingController _age = TextEditingController(text: '');
  final TextEditingController _email = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: ColorsApp.primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: _forKey,
              onChanged: () {
                setState(() {
                  _isButtonDisabled = !_forKey.currentState!.validate();
                });
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Container>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Nombre completo',
                            hintText: 'Samuel Cano'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obligatorio';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        controller: _fullname,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Edad', hintText: '21'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obligatorio';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: _age,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Correo electronico',
                            hintText: '@gmail.com'),
                        validator: (value) {
                          RegExp regex = RegExp(Validations.email);
                          if (value == null || value.isEmpty) {
                            return 'campo obligatorio';
                          } else if (!regex.hasMatch(value)) {
                            return 'Introduce un correo válido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Contraseña', hintText: 'contraseña'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obligatorio';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        controller: _password,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                          onPressed: _isButtonDisabled
                              ? null
                              : () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => AccountInfo(),
                                    ),
                                  );
                                  //print('${_fullname.value} ${_email.value} ${_age.value}');
                                },
                          child: Text('Registar')),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Account(),
                              ),
                            );
                          },
                          child: const Text(
                              '¿Ya tienes una cuenta? Inicia Sesión')),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
