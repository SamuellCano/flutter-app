import 'package:flutter/material.dart';
import 'package:testgroupb/kernel/validations/validation.dart';
//import 'package:testgroupb/modules/forms/adapters/screens/account_info.dart';
import 'package:testgroupb/modules/forms/adapters/screens/first_form.dart';
import 'package:dio/dio.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});
  

  @override
  State<LoginForm> createState() => _FirstFormState();
}

Future<void> registerUser(String email, String password) async {
  final dio = Dio(); // Puedes configurar Dio según tus necesidades

  try {
    final response = await dio.post('https://crudcrud.com/api/27de2085970d45e2bbd89775c33b5e24/users', data: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      // Registro exitoso, maneja la respuesta
      print('Registro exitoso: ${response.data}');
    } else {
      // Maneja errores en la respuesta
      print('Registro exitoso: ${response.data}');
    }
  } catch (e) {
    // Maneja errores de red o excepciones
    print('Error de red: $e');
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}


class _FirstFormState extends State<LoginForm> {
  final _forKey = GlobalKey<FormState>();
  bool _isButtonDisabled = true;
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController();
  //bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Container>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Center(
                          child: Image.asset(
                        'assets/images/logo-utez.png',
                        width: 200,
                        height: 150,
                      )),
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
                              : () 
                                async {
                                final email = _email.text;
                                final password = _password.text;
                                
                                await registerUser(email, password);
                                    
                              },
                              child: const Text('Login')),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const FirstForm(),
                              ),
                            );
                          },
                          child:
                              const Text('¿No tienes una cuenta? Registrate')),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
