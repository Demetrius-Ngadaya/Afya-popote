import 'dart:convert';

import 'package:afya_popote/components/button.dart';
import 'package:afya_popote/main.dart';
import 'package:afya_popote/models/auth_model.dart';
import 'package:afya_popote/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.phone,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Andika namba yako ya simu',
              labelText: 'Namba ya simu',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.phone),
              prefixIconColor: Config.primaryColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Namba ya simu ni lazima';
              }
              return null;
            },
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
                hintText: 'Ingiza Nenosiri',
                labelText: 'Nenosiri',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecurePass = !obsecurePass;
                      });
                    },
                    icon: obsecurePass
                        ? const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.black38,
                    )
                        : const Icon(
                      Icons.visibility_outlined,
                      color: Config.primaryColor,
                    ))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nenosiri ni lazima';
              }
              return null;
            },
          ),
          Config.spaceSmall,
          Consumer<AuthModel>(
            builder: (context, auth, child) {
              return Button(
                width: double.infinity,
                title: 'Ingia',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      // Login here
                      final token = await DioProvider()
                          .getToken(
                          _emailController.text, _passController.text);

                      if (token) {
                        // Auth.loginSuccess(); // Update login status
                        // Redirect to the main page

                        // Grab user data here
                        final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        final tokenValue = prefs.getString('token') ?? '';

                        if (tokenValue.isNotEmpty && tokenValue != '') {
                          // Get user data
                          final response = await DioProvider().getUser(
                              tokenValue);
                          if (response != null) {
                            setState(() {
                              // JSON decode
                              Map<String, dynamic> appointment = {};
                              final user = json.decode(response);

                              // Check if any appointment today
                              for (var doctorData in user['doctor']) {
                                // If there is an appointment return for today

                                if (doctorData['appointments'] != null) {
                                  appointment = doctorData;
                                }
                              }

                              auth.loginSuccess(user, appointment);
                              MyApp.navigatorKey.currentState!.pushNamed(
                                  'main');
                            });
                          }
                        }
                      }
                    } catch (e) {
                      // Display error message to the user
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Umekosea kitu',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            content: const Text(
                              'Haujaingiza taharifa sahihi. Tafadhari ingiza tena kwa usahihi namba yako ya simu na neno lako la siri.',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Sawa',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                disable: false,
              );
            },
          )
        ],
      ),
    );
  }
}