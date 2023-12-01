import 'package:afya_popote/components/button.dart';
import 'package:afya_popote/main.dart';
import 'package:afya_popote/models/auth_model.dart';
import 'package:afya_popote/providers/dio_provider.dart';
import 'package:afya_popote/screens/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/config.dart';


class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _regionController = TextEditingController();
  final _districtController = TextEditingController();
  final _wardController = TextEditingController();
  final _disabilityController = TextEditingController();
  final _occupationController = TextEditingController();
  final _patientNumberController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool obsecurePass = true;
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Config.spaceSmall,
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                cursorColor: Config.primaryColor,
                decoration: const InputDecoration(
                  hintText: 'Majina matatu',
                  labelText: 'Andika majina yako matatu ',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.person_outlined),
                  prefixIconColor: Config.primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tafadhari andika majina yako matatu';
                  }
                  return null;
                },
              ),

              Config.spaceSmall,
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
                    return 'Tafadhari andika namba yako ya simu';
                  }
                  // You can add additional validation for phone numbers here
                  return null;
                },
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                cursorColor: Config.primaryColor,
                decoration: const InputDecoration(
                  hintText: 'Andika umri wako',
                  labelText: 'Umri',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                  prefixIconColor: Config.primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tafadhari andika umri wako';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Tafadhari andika umri wako kwa usahihi';
                  }
                  return null;
                },
              ),
              Config.spaceSmall,
              DropdownButtonFormField<String>(
                value: _genderController.text.isNotEmpty ? _genderController.text : null,
                decoration: InputDecoration(
                  hintText: 'Chagua jinsia yako',
                  labelText: 'Jinsia',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.person_outline),
                  prefixIconColor: Config.primaryColor,
                ),
                items: <String>['Mme', 'Mke'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _genderController.text = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tafadhari chagua jinsia yako';
                  }
                  return null;
                },
              ),


              Config.spaceSmall,
              TextFormField(
                controller: _nationalityController,
                keyboardType: TextInputType.text,
                cursorColor: Config.primaryColor,
                decoration: const InputDecoration(
                  hintText: 'Ingiza jina la Nchi yako',
                  labelText: 'Taifa lako',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.flag_outlined),
                  prefixIconColor: Config.primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tafadhari andika nchi yako';
                  }
                  return null;
                },
              ),

              Config.spaceSmall,
              TextFormField(
                controller: _regionController,
                keyboardType: TextInputType.text,
                cursorColor: Config.primaryColor,
                decoration: const InputDecoration(
                  hintText: 'Ingiza mkoa unaoishi',
                  labelText: 'Mkoa wako',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.place_outlined),
                  prefixIconColor: Config.primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tafadhari andika mkoa wako';
                  }
                  return null;
                },
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _districtController,
                keyboardType: TextInputType.text,
                cursorColor: Config.primaryColor,
                decoration: const InputDecoration(
                  hintText: 'Ingiza Wila unayoishi',
                  labelText: 'Wilaya yako',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.place_outlined),
                  prefixIconColor: Config.primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tafadhari andika namba yako ya simu';
                  }
                  // You can add additional validation for phone numbers here
                  return null;
                },
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _wardController,
                keyboardType: TextInputType.text,
                cursorColor: Config.primaryColor,
                decoration: const InputDecoration(
                  hintText: 'Andika kata yako',
                  labelText: 'Kata yako',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.place_outlined),
                  prefixIconColor: Config.primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tafadhari andika kata yako';
                  }
                  return null;
                },
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _disabilityController,
                keyboardType: TextInputType.text,
                cursorColor: Config.primaryColor,
                decoration: const InputDecoration(
                  hintText: 'Andika ulemavu wako',
                  labelText: 'Ulemavu',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.accessibility),
                  prefixIconColor: Config.primaryColor,
                ),
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _occupationController,
                keyboardType: TextInputType.text,
                cursorColor: Config.primaryColor,
                decoration: const InputDecoration(
                  hintText: 'Andika kazi yako',
                  labelText: 'Kazi yako',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.work_outline),
                  prefixIconColor: Config.primaryColor,
                ),
              ),

              Config.spaceSmall,
              TextFormField(
                controller: _patientNumberController,
                keyboardType: TextInputType.text,
                cursorColor: Config.primaryColor,
                decoration: const InputDecoration(
                  hintText: 'Kama ulishawahi kutibiwa kwetu andika namba ya mgonjwa',
                  labelText: 'Namba ya mgonjwa',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.assignment_ind_outlined),
                  prefixIconColor: Config.primaryColor,
                ),
              ),
              Config.spaceSmall,

              // Existing form field
              TextFormField(
                controller: _passController,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.primaryColor,
                obscureText: obsecurePass,
                decoration: InputDecoration(
                  hintText: 'Ingiza neno lako la siri',
                  labelText: 'Neno siri',
                  alignLabelWithHint: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  prefixIconColor: Config.primaryColor,
                ),
              ), // Ne
              Config.spaceSmall,
              TextFormField(
                controller: _confirmPassController,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.primaryColor,
                obscureText: obsecurePass,
                decoration: InputDecoration(
                  hintText: 'Thibitisha neno lako la siri',
                  labelText: 'Thibitisha neno siri',
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
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tafadhari thibitisha neno lako la siri';
                  }
                  if (value != _passController.text) {
                    return 'maneno yako ya siri hayafanani';
                  }
                  return null;
                },
              ),

              Config.spaceSmall,
              Consumer<AuthModel>(
                builder: (context, auth, child) {
                  return Button(
                    width: double.infinity,
                    title: 'Jisajiri',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final userRegistration = await DioProvider().registerUser(
                          _nameController.text,
                          _emailController.text,
                          _ageController.text,
                          _genderController.text,
                          _nationalityController.text,
                          _regionController.text,
                          _districtController.text,
                          _wardController.text,
                          _disabilityController.text,
                          _occupationController.text,
                          _patientNumberController.text,
                          _passController.text,
                          _confirmPassController.text,
                        );

                        // If register success, provide success message in AlertDialog and navigate to the login page
                        if (userRegistration) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Umejisajiri kikamirifu',
                                  style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),),
                                content: Text('Ingia kwenye akaunti yako kwa kuandika namba ya simu na neno siri kama ulivyoandika wakati wa kujisajiri',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        isSignIn = true; // switch to the login page
                                      });
                                      // Navigate to the login form
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AuthPage(),
                                        ),
                                      );
                                    },
                                    child: Text('Sawa'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          print('Usajiri haujakamilika');
                        }
                      }
                    },
                    disable: false,
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}
